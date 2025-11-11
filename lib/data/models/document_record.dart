import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

enum DocumentKind { note, report }

@immutable
class DocumentRecord {
  const DocumentRecord({
    required this.key,
    required this.slug,
    required this.languageCode,
    required this.kind,
    required this.assetPath,
    required this.reference,
    required this.displayName,
  });

  final String key;
  final String slug;
  final String languageCode;
  final DocumentKind kind;
  final String assetPath;
  final String reference;
  final String displayName;
}

class DocumentKindAdapter extends TypeAdapter<DocumentKind> {
  @override
  final int typeId = 1;

  @override
  DocumentKind read(BinaryReader reader) {
    final index = reader.readByte();
    return DocumentKind.values[index];
  }

  @override
  void write(BinaryWriter writer, DocumentKind obj) {
    writer.writeByte(obj.index);
  }
}

class DocumentRecordAdapter extends TypeAdapter<DocumentRecord> {
  @override
  final int typeId = 2;

  @override
  DocumentRecord read(BinaryReader reader) {
    return DocumentRecord(
      key: reader.readString(),
      slug: reader.readString(),
      languageCode: reader.readString(),
      kind: reader.read() as DocumentKind,
      assetPath: reader.readString(),
      reference: reader.readString(),
      displayName: reader.readString(),
    );
  }

  @override
  void write(BinaryWriter writer, DocumentRecord obj) {
    writer
      ..writeString(obj.key)
      ..writeString(obj.slug)
      ..writeString(obj.languageCode)
      ..write(obj.kind)
      ..writeString(obj.assetPath)
      ..writeString(obj.reference)
      ..writeString(obj.displayName);
  }
}
