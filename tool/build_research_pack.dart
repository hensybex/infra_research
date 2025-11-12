import 'dart:convert';
import 'dart:io';

import 'package:archive/archive.dart';
import 'package:infra/data/models/recommendation_letter.dart';
import 'package:infra/data/static/recommendation_letters.dart' as letters_data;

void main() {
  const builder = ResearchPackBuilder(
    outputPath: 'assets/bundles/research_pack.zip',
  );
  builder.build();
}

class ResearchPackBuilder {
  const ResearchPackBuilder({required this.outputPath});

  final String outputPath;

  void build() {
    final archive = Archive();
    final readme = _buildReadme();
    archive.addFile(
      ArchiveFile('README.md', readme.codeUnits.length, utf8.encode(readme)),
    );

    for (final spec in _papers) {
      for (final path in spec.englishFiles) {
        _addFile(
          archive,
          sourcePath: path,
          archivePath: 'research_papers/${spec.id}/en/${_basename(path)}',
        );
      }
      for (final path in spec.russianFiles) {
        _addFile(
          archive,
          sourcePath: path,
          archivePath: 'research_papers/${spec.id}/ru/${_basename(path)}',
        );
      }
    }

    _addDirectory(
      archive,
      sourceDir: Directory('assets/eng/notes'),
      archivePrefix: 'notes/en',
    );
    _addDirectory(
      archive,
      sourceDir: Directory('assets/rus/notes'),
      archivePrefix: 'notes/ru',
    );

    const lettersReadme = '''
# Recommendation letters

Three partner recommendation letters live in Google Docs for now.
Use the in-app links or drop PDFs here when exporting for offline handoffs.
''';
    archive.addFile(
      ArchiveFile(
        'letters/README.md',
        lettersReadme.codeUnits.length,
        utf8.encode(lettersReadme),
      ),
    );
    _addLettersMetadata(archive);

    final encoder = ZipEncoder();
    final bytes = encoder.encode(archive);
    if (bytes == null) {
      stderr.writeln('Failed to encode archive.');
      exitCode = 1;
      return;
    }
    final file = File(outputPath);
    file.createSync(recursive: true);
    file.writeAsBytesSync(bytes);
    stdout.writeln('Wrote ${bytes.length} bytes to $outputPath');
  }

  void _addDirectory(
    Archive archive, {
    required Directory sourceDir,
    required String archivePrefix,
  }) {
    if (!sourceDir.existsSync()) {
      stderr.writeln('Skipping missing directory: ${sourceDir.path}');
      return;
    }
    for (final entity in sourceDir.listSync(followLinks: false)) {
      if (entity is! File) continue;
      final fileName = _basename(entity.path);
      _addFile(
        archive,
        sourcePath: entity.path,
        archivePath: '$archivePrefix/$fileName',
      );
    }
  }

  void _addFile(
    Archive archive, {
    required String sourcePath,
    required String archivePath,
  }) {
    final file = File(sourcePath);
    if (!file.existsSync()) {
      stderr.writeln('Missing source file: $sourcePath');
      return;
    }
    final bytes = file.readAsBytesSync();
    archive.addFile(ArchiveFile(archivePath, bytes.length, bytes));
  }

  String _buildReadme() {
    final buffer = StringBuffer()
      ..writeln('# Infra Research Pack')
      ..writeln()
      ..writeln(
        'Curated offline bundle with research papers, bilingual notes, '
        'and placeholders for recommendation letters.',
      )
      ..writeln()
      ..writeln('## Research papers')
      ..writeln();
    for (final spec in _papers) {
      buffer.writeln('- ${spec.title}');
    }
    buffer
      ..writeln()
      ..writeln('## Notes')
      ..writeln('- notes/en — English notes and data tables')
      ..writeln('- notes/ru — Russian translations')
      ..writeln()
      ..writeln('## Letters')
      ..writeln('- letters/README.md — drop exported PDFs here once ready')
      ..writeln('- letters/letters.json — metadata mirrored from the app');
    return buffer.toString();
  }

  void _addLettersMetadata(Archive archive) {
    final encoder = const JsonEncoder.withIndent('  ');
    final payload = letters_data.recommendationLetters
        .map(
          (RecommendationLetter letter) => <String, dynamic>{
            'id': letter.id,
            'partner': letter.partner,
            'role': letter.role,
            'summary': letter.summary,
            'note': letter.note,
            'status': letter.status.name,
            'url': letter.url,
          },
        )
        .toList();
    final bytes = utf8.encode(encoder.convert(payload));
    archive.addFile(ArchiveFile('letters/letters.json', bytes.length, bytes));
  }
}

class ResearchPaperSpec {
  const ResearchPaperSpec({
    required this.id,
    required this.title,
    required this.englishFiles,
    required this.russianFiles,
  });

  final String id;
  final String title;
  final List<String> englishFiles;
  final List<String> russianFiles;
}

String _basename(String path) {
  final segments = path.split('/');
  return segments.isEmpty ? path : segments.last;
}

const List<ResearchPaperSpec> _papers = [
  ResearchPaperSpec(
    id: 'paper1_architecture_validation',
    title: 'Stack Proof · Architecture Validation',
    englishFiles: [
      'assets/eng/reports/DR1_architecture_validation.md',
      'assets/eng/reports/DR1_architecture_validation_full.md',
    ],
    russianFiles: [
      'assets/rus/reports/DR1_architecture_validation.ru.md',
      'assets/rus/reports/DR1_architecture_validation_full.ru.md',
    ],
  ),
  ResearchPaperSpec(
    id: 'paper2_solution_pathing',
    title: 'Launch Blueprint · Solution Pathing',
    englishFiles: [
      'assets/eng/reports/DR2_solution_pathing.md',
      'assets/eng/reports/DR2_solution_pathing_full.md',
    ],
    russianFiles: [
      'assets/rus/reports/DR2_solution_pathing.ru.md',
      'assets/rus/reports/DR2_solution_pathing_full.ru.md',
    ],
  ),
  ResearchPaperSpec(
    id: 'paper3_market_access',
    title: 'Market Bridge · Marketplace Access',
    englishFiles: [
      'assets/eng/reports/DR2_5_market_access.md',
      'assets/eng/reports/DR2_5_market_access_full.md',
    ],
    russianFiles: [
      'assets/rus/reports/DR2_5_market_access.ru.md',
      'assets/rus/reports/DR2_5_market_access_full.ru.md',
    ],
  ),
  ResearchPaperSpec(
    id: 'paper4_value_pricing',
    title: 'Value Engine · Value & Pricing',
    englishFiles: [
      'assets/eng/reports/DR3_value_pricing.md',
      'assets/eng/reports/DR3_value_pricing_full.md',
    ],
    russianFiles: [
      'assets/rus/reports/DR3_value_pricing.ru.md',
      'assets/rus/reports/DR3_value_pricing_full.ru.md',
    ],
  ),
];
