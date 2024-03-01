// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'date.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DateHiveModelAdapter extends TypeAdapter<DateHiveModel> {
  @override
  final int typeId = 2;

  @override
  DateHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DateHiveModel()
      ..day = fields[0] as int
      ..type = fields[1] as WeekHiveModel;
  }

  @override
  void write(BinaryWriter writer, DateHiveModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.day)
      ..writeByte(1)
      ..write(obj.type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DateHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
