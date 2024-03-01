// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LessonHiveModelAdapter extends TypeAdapter<LessonHiveModel> {
  @override
  final int typeId = 4;

  @override
  LessonHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LessonHiveModel()
      ..id = fields[0] as String
      ..subject = fields[1] as String
      ..subjectType = fields[2] as int
      ..teacher = fields[3] as String
      ..lessonType = fields[4] as int
      ..time = fields[5] as LessonTimeHiveModel
      ..classroom = fields[6] as String
      ..date = fields[7] as DateHiveModel
      ..subgroup = fields[8] as int;
  }

  @override
  void write(BinaryWriter writer, LessonHiveModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.subject)
      ..writeByte(2)
      ..write(obj.subjectType)
      ..writeByte(3)
      ..write(obj.teacher)
      ..writeByte(4)
      ..write(obj.lessonType)
      ..writeByte(5)
      ..write(obj.time)
      ..writeByte(6)
      ..write(obj.classroom)
      ..writeByte(7)
      ..write(obj.date)
      ..writeByte(8)
      ..write(obj.subgroup);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LessonHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
