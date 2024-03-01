import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:scheduleapp/core/constants/constants.dart';

@immutable
abstract class RightMenuEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class RightMenuEventMoveTo extends RightMenuEvent {
  final int day;
  RightMenuEventMoveTo({day}) : day=day??-1;
  @override
  List<Object> get props => [day];
}

class RightMenuEventInitialize extends RightMenuEvent {
  final List<GlobalKey> daysKeys;
  final List<Weekday> days;
  final int weekNumber;
  RightMenuEventInitialize({required this.daysKeys,required this.weekNumber,required this.days});
  @override
  List<Object> get props => [daysKeys,weekNumber,days];
}
