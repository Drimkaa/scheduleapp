import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../presenter/pages/week_schedule.dart';

import '../../data/entities/lesson_entity.dart';
import '../../presenter/pages/edit_lesson.dart';

part 'routing.gr.dart';


@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
    CustomRoute(
      page: EditLessonRoute.page,
      initial: false,
      transitionsBuilder: TransitionsBuilders.noTransition,

    ),
    CustomRoute(
      page: WeekScheduleRoute.page,
      initial: true,
      transitionsBuilder: TransitionsBuilders.noTransition,

    ),
  ];
}