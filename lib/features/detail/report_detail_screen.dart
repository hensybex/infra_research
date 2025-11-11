import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:infra/l10n/app_localizations.dart';
import 'package:infra/data/models/report_document.dart';
import 'package:infra/data/models/source_entry.dart';
import 'package:infra/data/repositories/document_repository.dart';
import 'package:infra/data/services/document_registry.dart';
import 'package:infra/features/common/utils/source_launcher.dart';
import 'package:infra/features/common/widgets/registry_markdown.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:provider/provider.dart';

class ReportDetailScreen extends StatefulWidget {
  const ReportDetailScreen({super.key, required this.reportId});

  final String reportId;

  @override
  State<ReportDetailScreen> createState() => _ReportDetailScreenState();
}

class _ReportDetailScreenState extends State<ReportDetailScreen> {
  final ScrollController _scrollController = ScrollController();
  final Map<String, GlobalKey> _sectionKeys = {};

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DocumentRepository>(
      builder: (context, repository, _) {
        final l10n = AppLocalizations.of(context)!;
        if (repository.status != RepositoryStatus.ready) {
          return Scaffold(
            appBar: AppBar(),
            body: repository.status == RepositoryStatus.error
                ? Center(
                    child: Text(repository.errorMessage ?? l10n.loadingError),
                  )
                : const Center(child: CircularProgressIndicator()),
          );
        }
        final document = repository.findById(widget.reportId);
        if (document == null) {
          return Scaffold(
            appBar: AppBar(),
            body: Center(child: Text(l10n.reportNotFound)),
          );
        }
        for (final section in document.sections) {
          _sectionKeys.putIfAbsent(section.anchor, () => GlobalKey());
        }
        return Scaffold(
          body: LayoutBuilder(
            builder: (context, constraints) {
              const tocRailWidth = 300.0;
              const tocRailGap = 32.0;
              const contentMinWidth = 900.0;
              final showRail =
                  constraints.maxWidth >=
                  contentMinWidth + tocRailWidth + tocRailGap;
              final slivers = _buildSlivers(
                context,
                l10n,
                document,
                repository,
                showRail: showRail,
              );
              final scrollView = CustomScrollView(
                controller: _scrollController,
                slivers: slivers,
              );
              if (!showRail) {
                return scrollView;
              }
              final mediaPadding = MediaQuery.of(context).padding.top;
              return Stack(
                children: [
                  Positioned.fill(
                    right: tocRailWidth + tocRailGap,
                    child: scrollView,
                  ),
                  Positioned(
                    top: mediaPadding + kToolbarHeight + 8,
                    right: 16,
                    bottom: 16,
                    width: tocRailWidth,
                    child: _PinnedTocRail(
                      child: _TocPanel(
                        sections: document.sections,
                        onTap: _scrollToSection,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }

  List<Widget> _buildSlivers(
    BuildContext context,
    AppLocalizations l10n,
    ReportDocument document,
    DocumentRepository repository, {
    required bool showRail,
  }) {
    final slivers = <Widget>[
      SliverAppBar(pinned: true, title: Text(document.title)),
    ];
    if (!showRail) {
      final tocHeight =
          120.0 + (document.sections.length.clamp(1, 20).toDouble() * 44.0);
      slivers.add(
        SliverPersistentHeader(
          pinned: true,
          delegate: _TocHeaderDelegate(
            height: tocHeight,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
              child: _TocPanel(
                sections: document.sections,
                onTap: _scrollToSection,
              ),
            ),
          ),
        ),
      );
    }
    slivers.add(
      SliverPadding(
        padding: EdgeInsets.fromLTRB(
          16,
          showRail ? 16 : 12,
          showRail ? 32 : 16,
          100,
        ),
        sliver: SliverToBoxAdapter(
          child: _MarkdownPanel(
            document: document,
            repository: repository,
            sectionKeys: _sectionKeys,
            onLinkTap: (href) => _handleLink(context, repository, href),
            onSourceTap: (entry) =>
                _handleSourceTap(context, repository, entry),
          ),
        ),
      ),
    );
    return slivers;
  }

  Future<void> _handleLink(
    BuildContext context,
    DocumentRepository repository,
    String? href,
  ) async {
    if (href == null) return;
    if (href.startsWith('#')) {
      _scrollToSection(href.replaceFirst('#', ''));
      return;
    }
    await SourceLauncher.open(context, repository, href);
  }

  Future<void> _handleSourceTap(
    BuildContext context,
    DocumentRepository repository,
    SourceEntry entry,
  ) async {
    final reference = entry.reference;
    if (reference == null) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppLocalizations.of(context)!.sourceUnavailable),
        ),
      );
      return;
    }
    await SourceLauncher.open(context, repository, reference);
  }

  void _scrollToSection(String anchor) {
    final key = _sectionKeys[anchor];
    if (key?.currentContext == null) return;
    Scrollable.ensureVisible(
      key!.currentContext!,
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeInOut,
    );
  }
}

class _MarkdownPanel extends StatelessWidget {
  const _MarkdownPanel({
    required this.document,
    required this.repository,
    required this.sectionKeys,
    required this.onLinkTap,
    required this.onSourceTap,
  });

  final ReportDocument document;
  final DocumentRepository repository;
  final Map<String, GlobalKey> sectionKeys;
  final ValueChanged<String?> onLinkTap;
  final ValueChanged<SourceEntry> onSourceTap;

  @override
  Widget build(BuildContext context) {
    final headingBuilder = _HeadingBuilder(sectionKeys);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SelectionArea(
          child: RegistryMarkdown(
            data: document.body,
            repository: repository,
            preferredLanguageCode: document.languageCode,
            onTapLink: (_, href, __) => onLinkTap(href),
            styleSheet: MarkdownStyleSheet.fromTheme(Theme.of(context))
                .copyWith(
                  h2Padding: const EdgeInsets.only(top: 24),
                  h3Padding: const EdgeInsets.only(top: 12),
                ),
            builders: {'h2': headingBuilder, 'h3': headingBuilder},
          ),
        ),
        const SizedBox(height: 24),
        _SourcesList(entries: document.sources, onTap: onSourceTap),
      ],
    );
  }
}

class _TocPanel extends StatelessWidget {
  const _TocPanel({required this.sections, required this.onTap});

  final List<ReportSection> sections;
  final ValueChanged<String> onTap;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.contentsTitle,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 12),
            ...sections.map(
              (section) => ListTile(
                dense: true,
                contentPadding: EdgeInsets.zero,
                title: Text(section.title),
                onTap: () => onTap(section.anchor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PinnedTocRail extends StatelessWidget {
  const _PinnedTocRail({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      thumbVisibility: true,
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(right: 8),
        child: child,
      ),
    );
  }
}

class _TocHeaderDelegate extends SliverPersistentHeaderDelegate {
  _TocHeaderDelegate({required this.child, required this.height});

  final Widget child;
  final double height;

  @override
  double get minExtent => height;

  @override
  double get maxExtent => height;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Material(
      elevation: overlapsContent ? 2 : 0,
      color: Theme.of(context).colorScheme.surface,
      child: child,
    );
  }

  @override
  bool shouldRebuild(covariant _TocHeaderDelegate oldDelegate) {
    return height != oldDelegate.height || child != oldDelegate.child;
  }
}

class _SourcesList extends StatelessWidget {
  const _SourcesList({required this.entries, this.onTap});

  final List<SourceEntry> entries;
  final ValueChanged<SourceEntry>? onTap;

  @override
  Widget build(BuildContext context) {
    if (entries.isEmpty) return const SizedBox.shrink();
    final l10n = AppLocalizations.of(context)!;
    final registry = DocumentRegistry.instance;
    final localeCode = Localizations.localeOf(context).languageCode;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.sourcesTitle,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 12),
            ...entries.map((entry) {
              final friendly = registry.resolveDisplayName(
                entry.reference,
                locale: localeCode,
              );
              final showSubtitle = friendly != null && friendly != entry.label;
              return ListTile(
                dense: true,
                contentPadding: EdgeInsets.zero,
                leading: Icon(_iconFor(entry.type)),
                title: Text(friendly ?? entry.label),
                subtitle: showSubtitle ? Text(entry.label) : null,
                onTap: entry.reference == null
                    ? null
                    : () {
                        onTap?.call(entry);
                      },
              );
            }),
          ],
        ),
      ),
    );
  }

  IconData _iconFor(SourceType type) {
    switch (type) {
      case SourceType.internal:
        return Icons.note;
      case SourceType.external:
        return Icons.public;
      case SourceType.missing:
        return Icons.hourglass_bottom;
    }
  }
}

class _HeadingBuilder extends MarkdownElementBuilder {
  _HeadingBuilder(this.sectionKeys);

  final Map<String, GlobalKey> sectionKeys;

  @override
  Widget? visitElementAfter(md.Element element, TextStyle? preferredStyle) {
    final text = element.textContent;
    final anchor = _anchorFor(text);
    final key = sectionKeys.putIfAbsent(anchor, () => GlobalKey());
    return Container(
      key: key,
      padding: const EdgeInsets.only(top: 24, bottom: 8),
      child: Text(text, style: preferredStyle),
    );
  }
}

String _anchorFor(String title) {
  return title
      .toLowerCase()
      .replaceAll(RegExp(r'[^a-z0-9а-яё ]', caseSensitive: false), '')
      .trim()
      .replaceAll(RegExp(r'\s+'), '-');
}
