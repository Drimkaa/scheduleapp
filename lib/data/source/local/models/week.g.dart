// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'week.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WeekHiveModelAdapter extends TypeAdapter<WeekHiveModel> {
  @override
  final int typeId = 1;

  @override
  WeekHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WeekHiveModel()..weeks = fields[0] as String;
  }

  @override
  void write(BinaryWriter writer, WeekHiveModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.weeks);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeekHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
