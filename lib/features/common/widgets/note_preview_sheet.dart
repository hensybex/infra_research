import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:infra/data/models/note_document.dart';

class NotePreviewSheet extends StatelessWidget {
  const NotePreviewSheet({super.key, required this.note});

  final NoteDocument note;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.only(bottom: 12),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.outlineVariant,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            Text(note.title, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 12),
            Expanded(child: Markdown(data: note.body)),
          ],
        ),
      ),
    );
  }
}
