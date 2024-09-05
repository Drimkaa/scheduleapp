import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:scheduleapp/presenter/pages/redactor.dart';
import 'package:scheduleapp/presenter/pages/settings_page.dart';
import '../../presenter/bloc/lesson/lesson_bloc.dart';
import '../../presenter/pages/lesson_page.dart';
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
      path: '/edit-lesson',
      transitionsBuilder: TransitionsBuilders.noTransition,
    ),
    CustomRoute(
      page: LessonRoute.page,
      initial: false,
      path: '/lesson',
      transitionsBuilder: TransitionsBuilders.noTransition,
    ),
    CustomRoute(
      page: WeekScheduleRoute.page,
      initial: true,
      path: '/',
      transitionsBuilder: TransitionsBuilders.noTransition,
    ),
    CustomRoute(
      page: SettingsRoute.page,
      initial: false,
      path: '/settings',
      transitionsBuilder: TransitionsBuilders.noTransition,
    ),
    CustomRoute(
      page: RedactorRoute.page,
      initial: false,
      path: '/redactor',
      transitionsBuilder: TransitionsBuilders.noTransition,
    ),
  ];
}