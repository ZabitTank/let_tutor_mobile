// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enum.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocalizationCodeAdapter extends TypeAdapter<LocalizationCode> {
  @override
  final int typeId = 0;

  @override
  LocalizationCode read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return LocalizationCode.vietnam;
      case 1:
        return LocalizationCode.english;
      default:
        return LocalizationCode.vietnam;
    }
  }

  @override
  void write(BinaryWriter writer, LocalizationCode obj) {
    switch (obj) {
      case LocalizationCode.vietnam:
        writer.writeByte(0);
        break;
      case LocalizationCode.english:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocalizationCodeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
