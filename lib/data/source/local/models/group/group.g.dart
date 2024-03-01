// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GroupHiveModelAdapter extends TypeAdapter<GroupHiveModel> {
  @override
  final int typeId = 11;

  @override
  GroupHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GroupHiveModel()
      ..subgroup = fields[0] as int
      ..group = fields[1] as String;
  }

  @override
  void write(BinaryWriter writer, GroupHiveModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.subgroup)
      ..writeByte(1)
      ..write(obj.group);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GroupHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
