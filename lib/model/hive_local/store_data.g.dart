// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StorageitemAdapter extends TypeAdapter<Storageitem> {
  @override
  final int typeId = 1;

  @override
  Storageitem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Storageitem(
      id: fields[0] as int?,
      dateTime: fields[1] as DateTime,
      data: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Storageitem obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.dateTime)
      ..writeByte(2)
      ..write(obj.data);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StorageitemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
