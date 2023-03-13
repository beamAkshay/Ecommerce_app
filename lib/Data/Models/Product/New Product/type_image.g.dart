// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'type_image.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TypeImageAdapter extends TypeAdapter<TypeImage> {
  @override
  final int typeId = 1;

  @override
  TypeImage read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TypeImage(
      alt: fields[0] as String?,
      caption: fields[1] as String?,
      primary: fields[2] as bool?,
      filename: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, TypeImage obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.alt)
      ..writeByte(1)
      ..write(obj.caption)
      ..writeByte(2)
      ..write(obj.primary)
      ..writeByte(3)
      ..write(obj.filename);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TypeImageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
