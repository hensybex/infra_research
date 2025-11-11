import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../theme/neo_colors.dart';

class NeoTimelineEntry {
  const NeoTimelineEntry({
    required this.phase,
    required this.timeframe,
    required this.highlights,
  });

  final String phase;
  final String timeframe;
  final List<String> highlights;
}

class NeoTimeline extends StatelessWidget {
  const NeoTimeline({
    required this.entries,
    this.activeIndex,
    this.revealedCount,
    super.key,
  });

  final List<NeoTimelineEntry> entries;
  final int? activeIndex;
  final int? revealedCount;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final int columnCount = entries.length;
        if (columnCount == 0) {
          return const SizedBox.shrink();
        }

        final double gap = columnCount > 1 ? 24 : 0;
        final double totalGap = gap * (columnCount - 1);
        final double availableWidth = (constraints.maxWidth - totalGap).clamp(
          0.0,
          constraints.maxWidth,
        );
        final double columnWidth = columnCount == 0
            ? constraints.maxWidth
            : availableWidth / columnCount;

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            for (int index = 0; index < columnCount; index++) ...<Widget>[
              SizedBox(
                width: columnWidth,
                child: _TimelineColumn(
                  entry: entries[index],
                  isLast: index == columnCount - 1,
                  delay: Duration(milliseconds: 140 * index),
                  isActive: activeIndex != null && index == activeIndex,
                  isFuture:
                      revealedCount != null && index >= (revealedCount ?? 0),
                  textStyle: theme.textTheme.bodyMedium?.copyWith(
                    color: NeoColors.textSecondary,
                    height: 1.45,
                  ),
                ),
              ),
              if (index != columnCount - 1) SizedBox(width: gap),
            ],
          ],
        );
      },
    );
  }
}

class _TimelineColumn extends StatelessWidget {
  const _TimelineColumn({
    required this.entry,
    required this.isLast,
    required this.delay,
    required this.isActive,
    required this.isFuture,
    required this.textStyle,
  });

  final NeoTimelineEntry entry;
  final bool isLast;
  final Duration delay;
  final bool isActive;
  final bool isFuture;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final column = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                color: isActive ? NeoColors.accent : NeoColors.primary,
                shape: BoxShape.circle,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: (isActive ? NeoColors.accent : NeoColors.primary)
                        .neoOpacity(0.8),
                    blurRadius: 12,
                    spreadRadius: 2,
                  ),
                ],
              ),
            ),
            if (!isLast)
              Expanded(
                child: Container(
                  height: 2,
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: <Color>[NeoColors.primary, NeoColors.secondary],
                    ),
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 16),
        AutoSizeText(
          entry.phase,
          maxLines: 1,
          minFontSize: 18,
          overflowReplacement: Text(
            entry.phase,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: isActive ? NeoColors.accent : NeoColors.textPrimary,
            ),
          ),
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w600,
            color: isActive ? NeoColors.accent : NeoColors.textPrimary,
          ),
        ),
        const SizedBox(height: 4),
        AutoSizeText(
          entry.timeframe,
          maxLines: 1,
          minFontSize: 14,
          overflowReplacement: Text(
            entry.timeframe,
            style: theme.textTheme.labelMedium?.copyWith(
              color: NeoColors.textSecondary,
              letterSpacing: 0.3,
            ),
          ),
          style: theme.textTheme.labelLarge?.copyWith(
            color: NeoColors.textSecondary,
            letterSpacing: 0.4,
          ),
        ),
        const SizedBox(height: 16),
        for (final highlight in entry.highlights) ...<Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                '• ',
                style: TextStyle(color: NeoColors.accent, fontSize: 22),
              ),
              Expanded(
                child: Text(
                  highlight,
                  style: textStyle?.copyWith(
                    color: isFuture
                        ? NeoColors.textSecondary.neoOpacity(0.35)
                        : textStyle?.color,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
        ],
      ],
    );

    return column
        .animate()
        .fadeIn(duration: 420.ms, delay: delay)
        .moveY(begin: 20, end: 0)
        .scale(
          begin: const Offset(0.96, 0.96),
          end: Offset(isActive ? 1.02 : 1.0, isActive ? 1.02 : 1.0),
          duration: 320.ms,
          curve: Curves.easeOut,
        );
  }
}
