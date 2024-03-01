// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'date_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DateImpl _$$DateImplFromJson(Map<String, dynamic> json) => _$DateImpl(
      day: $enumDecodeNullable(_$WeekdayEnumMap, json['day']) ?? Weekday.monday,
      type: json['type'] == null
          ? const Week(weeks: "")
          : Week.fromJson(json['type'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DateImplToJson(_$DateImpl instance) =>
    <String, dynamic>{
      'day': instance.day,
      'type': instance.type,
    };

const _$WeekdayEnumMap = {
  Weekday.monday: 'monday',
  Weekday.tuesday: 'tuesday',
  Weekday.wednesday: 'wednesday',
  Weekday.thursday: 'thursday',
  Weekday.friday: 'friday',
  Weekday.saturday: 'saturday',
  Weekday.sunday: 'sunday',
};
