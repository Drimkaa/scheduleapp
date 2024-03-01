// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'routing.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    EditLessonRoute.name: (routeData) {
      final args = routeData.argsAs<EditLessonRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: EditLessonScreen(
          key: args.key,
          lesson: args.lesson,
        ),
      );
    },
    WeekScheduleRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const WeekScheduleScreen(),
      );
    },
  };
}

/// generated route for
/// [EditLessonScreen]
class EditLessonRoute extends PageRouteInfo<EditLessonRouteArgs> {
  EditLessonRoute({
    Key? key,
    required Lesson lesson,
    List<PageRouteInfo>? children,
  }) : super(
          EditLessonRoute.name,
          args: EditLessonRouteArgs(
            key: key,
            lesson: lesson,
          ),
          initialChildren: children,
        );

  static const String name = 'EditLessonRoute';

  static const PageInfo<EditLessonRouteArgs> page =
      PageInfo<EditLessonRouteArgs>(name);
}

class EditLessonRouteArgs {
  const EditLessonRouteArgs({
    this.key,
    required this.lesson,
  });

  final Key? key;

  final Lesson lesson;

  @override
  String toString() {
    return 'EditLessonRouteArgs{key: $key, lesson: $lesson}';
  }
}

/// generated route for
/// [WeekScheduleScreen]
class WeekScheduleRoute extends PageRouteInfo<void> {
  const WeekScheduleRoute({List<PageRouteInfo>? children})
      : super(
          WeekScheduleRoute.name,
          initialChildren: children,
        );

  static const String name = 'WeekScheduleRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
