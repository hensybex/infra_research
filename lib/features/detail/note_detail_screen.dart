import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:infra/data/models/document_record.dart';
import 'package:infra/data/models/note_document.dart';
import 'package:infra/data/repositories/document_repository.dart';
import 'package:infra/l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class NoteDetailScreen extends StatefulWidget {
  const NoteDetailScreen({super.key, required this.record});

  final DocumentRecord record;

  @override
  State<NoteDetailScreen> createState() => _NoteDetailScreenState();
}

class _NoteDetailScreenState extends State<NoteDetailScreen> {
  late Future<NoteDocument?> _noteFuture;

  @override
  void initState() {
    super.initState();
    final repository = context.read<DocumentRepository>();
    _noteFuture = repository.loadNote(widget.record.reference);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(widget.record.displayName)),
      body: FutureBuilder<NoteDocument?>(
        future: _noteFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data == null) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  l10n?.noteMissing ?? 'Источник появится после обновления.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            );
          }
          return Markdown(
            data: snapshot.data!.body,
            padding: const EdgeInsets.all(16),
          );
        },
      ),
    );
  }
}
