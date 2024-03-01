
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:scheduleapp/core/constants/constants.dart';

import 'week_entity.dart';

part 'date_entity.freezed.dart';
part 'date_entity.g.dart';

@freezed
class Date with _$Date {
  const factory Date({
    @Default(Weekday.monday) Weekday day,
    @Default(Week(weeks: "")) Week type,
  }) = _Date;

  factory Date.fromJson(Map<String, Object?> json) => _$DateFromJson(json);
}