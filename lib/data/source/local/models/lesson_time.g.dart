// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson_time.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LessonTimeHiveModelAdapter extends TypeAdapter<LessonTimeHiveModel> {
  @override
  final int typeId = 3;

  @override
  LessonTimeHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LessonTimeHiveModel()
      ..start = fields[0] as String
      ..end = fields[1] as String
      ..label = fields[2] as String?;
  }

  @override
  void write(BinaryWriter writer, LessonTimeHiveModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.start)
      ..writeByte(1)
      ..write(obj.end)
      ..writeByte(2)
      ..write(obj.label);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LessonTimeHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
