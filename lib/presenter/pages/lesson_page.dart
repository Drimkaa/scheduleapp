import 'package:auto_route/auto_route.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scheduleapp/core/constants/constants.dart';
import 'package:scheduleapp/core/constants/my_colors.dart';
import 'package:scheduleapp/data/entities/lesson_entity.dart';
import 'package:scheduleapp/presenter/bloc/lesson/lesson_bloc.dart';
import 'package:scheduleapp/presenter/bloc/lesson/lesson_state.dart';
import 'package:share_plus/share_plus.dart';
import 'dart:ui' as ui;
import '../../core/constants/background_image.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../core/routing/routing.dart';
import '../../core/utils/time/time_service.dart';
import '../bloc/week/week_bloc.dart';
import '../widgets/button/bottom_button.dart';
import '../widgets/card/card_widget.dart';

@RoutePage()
class LessonScreen extends StatefulWidget {
  const LessonScreen({super.key, required this.lesson});

  final LessonBloc lesson;

  @override
  State<LessonScreen> createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen> {
  final double _sheetPosition = 0.25;
  final double _sheetMaxHeight = 0.1;
  late final double _funcButtonHeight = 68 / MediaQuery.of(context).size.height;
  bool borderRadius = true;
  final GlobalKey _key = GlobalKey();
  bool init = false;
  late List<Widget> _notes = [];
  bool buildNotes = false;
  bool scrolledToNotes = false;
  final AssetImage _image = AssetImages.random;
  final GlobalKey _noteKey = GlobalKey();
  final DraggableScrollableController _controller = DraggableScrollableController();
  _getNotes(ScrollController controller) {
    if (buildNotes) return;
    buildNotes = true;
    int pos = 0;
    _notes = [];
    for (var note in 2022.toString().split("")) {
      _notes.add(Text(note,
          key: pos == 0 ? _noteKey : null,
          style: const TextStyle(
            fontSize: 10,
          )));
      pos += 1;
    }
    setState(() {});

    //controller.animateTo(50, duration: Duration(milliseconds: 200), curve: Curves.easeInBack);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (buildNotes && !scrolledToNotes) {
      Scrollable.ensureVisible(_noteKey.currentContext!, duration: const Duration(milliseconds: 200), curve: Curves.ease);
      scrolledToNotes = true;
    }
  }

  late AssetImage img = AssetImages.random;
  late Lesson lesson;
  @override
  void initState() {
    super.initState();
    lesson = widget.lesson.state.lesson;
    WidgetsBinding.instance.addPostFrameCallback((_) => onAfterBuild(context));
  }

  @override
  void dispose() {
    super.dispose();
  }

  void onAfterBuild(BuildContext context) {
    if (!init) {
      double sheetPosition = ((_key.currentContext?.size?.height ?? 1) + (lesson.teacher.length > 2 ? 112 : 95)) /
              MediaQuery.of(context).size.height +
          _funcButtonHeight;
      _controller.animateTo(sheetPosition, duration: const Duration(milliseconds: 100), curve: Curves.ease);
      init = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ui.ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
      child: Stack(
        children: [
          NotificationListener<DraggableScrollableNotification>(
            onNotification: (DraggableScrollableNotification notification) {
              if (notification.extent == 1) {
                setState(() {
                  borderRadius = false;
                });
              } else if (notification.extent <= _sheetMaxHeight + _funcButtonHeight) {
                Navigator.of(context).pop();
              } else {
                if (borderRadius == false) {
                  setState(() {
                    borderRadius = true;
                  });
                }
              }
              return true;
            },
            child: DraggableScrollableSheet(
              controller: _controller,
              minChildSize: _sheetMaxHeight + _funcButtonHeight,
              initialChildSize: _sheetPosition,
              expand: false,
              builder: (BuildContext context, controller) {
                return ColoredBox(
                  color: MyColors.dark_1,
                  child: SingleChildScrollView(
                    controller: controller,
                    child: Column(
                      children: [
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 100),
                          decoration: BoxDecoration(
                            color: MyColors.dark_1,
                            borderRadius: BorderRadius.vertical(top: borderRadius ? const Radius.circular(32.0) : Radius.zero),
                          ),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: CardWithImage(
                            key: _key,
                            gradientColor: MyColors.dark_1,
                            image: _image,
                            child: Column(
                              children: [
                                Container(
                                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                                  width: 32.0,
                                  height: 4.0,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(bottom: 20, left: 16, right: 16, top: 0),
                                  child: Flex(
                                    direction: Axis.horizontal,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Flexible(
                                        flex: 3,
                                        child: Text(
                                          lesson.subject,
                                          textDirection: TextDirection.ltr,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineMedium!
                                              .copyWith(fontWeight: FontWeight.normal, fontSize: 24),
                                        ),
                                      ),
                                      Flexible(
                                        flex: 1,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(8),
                                            color: MyColors.dark_3,
                                          ),
                                          padding: const EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 8),
                                          child: Text(
                                            lesson.subjectType.shortName,
                                            textDirection: TextDirection.ltr,
                                            textAlign: TextAlign.center,
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineMedium!
                                                .copyWith(fontWeight: FontWeight.w300, fontSize: 16),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                    decoration: BoxDecoration(
                                      color: MyColors.dark_3,
                                      borderRadius: BorderRadius.circular(22),
                                    ),
                                    child: Row(
                                      children: [
                                        const Icon(FluentIcons.clock_16_regular, color: Colors.white, size: 28),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        Text("${lesson.time.start} - ${lesson.time.end}",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall!
                                                .copyWith(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w300)),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                    decoration: BoxDecoration(
                                      color: MyColors.dark_3,
                                      borderRadius: BorderRadius.circular(22),
                                    ),
                                    child: Row(
                                      children: [
                                        const Icon(FluentIcons.building_government_16_regular, color: MyColors.first, size: 28),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        Text(lesson.classroom,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall!
                                                .copyWith(color: MyColors.first, fontSize: 20, fontWeight: FontWeight.w300)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              if (lesson.teacher != " ")
                                Row(
                                  children: [
                                    const Icon(FluentIcons.people_16_regular, color: Colors.white, size: 22),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      lesson.teacher,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w300),
                                    ),
                                  ],
                                ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Text(
                                    "Заметки",
                                    textDirection: TextDirection.ltr,
                                    textAlign: TextAlign.left,
                                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                                          textBaseline: TextBaseline.ideographic,
                                          fontWeight: FontWeight.w300,
                                          fontSize: 16,
                                        ),
                                  ),
                                  ..._notes,
                                ],
                              ),
                              const SizedBox(height: 68),
                              VisibilityDetector(
                                key: const Key("unique key"),
                                onVisibilityChanged: (VisibilityInfo info) {
                                  if (info.visibleFraction > 0.5) {
                                    _getNotes(controller);
                                  }
                                },
                                child: const SizedBox(
                                  height: 1,
                                  width: 1,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: 60,
            child: DecoratedBox(
              decoration: const BoxDecoration(
                color: MyColors.dark_3,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BottomButton(
                    onPressed: () {
                      TimeService service = TimeService.instance;
                      int week = BlocProvider.of<WeekPageBloc>(context).state.weekNumber;
                      String month = service.getWeekName(week);
                      int day = service.getMonthDay(week, lesson.date.day);
                      Share.share(
                          "🗓${lesson.date.day.fullName}, $day $month. \n📘${lesson.subject}\n🥷${lesson.teacher} \n🏫${lesson.classroom} \n🕐${lesson.time.start}-${lesson.time.end}");
                    },
                    text: 'Поделиться',
                    icon: FluentIcons.share_20_regular,
                    width: 80,
                  ),
                  BottomButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      AutoRouter.of(context).push(EditLessonRoute(lesson: lesson));

                    },
                    text: 'Изменить',
                    icon: FluentIcons.edit_20_regular,
                    width: 80,
                  ),
                  BlocSelector<LessonBloc, LessonState, bool>(
                      bloc: widget.lesson,
                      selector: (state2) => state2.hidden,
                      builder: (context, state2) {
                        if (state2) {
                          return BottomButton(
                            onPressed: () {
                              BlocProvider.of<WeekPageBloc>(context)
                                  .add(WeekPageEventSelectLesson(lesson.id, lesson.date.day, !widget.lesson.state.selected));
                              BlocProvider.of<WeekPageBloc>(context).add(WeekPageEventHide());
                            },
                            text: 'Показать',
                            icon: FluentIcons.border_all_20_regular,
                            width: 80,
                          );
                        } else {
                          return BottomButton(
                            onPressed: () {
                              BlocProvider.of<WeekPageBloc>(context)
                                  .add(WeekPageEventSelectLesson(lesson.id, lesson.date.day, !widget.lesson.state.selected));
                              BlocProvider.of<WeekPageBloc>(context).add(WeekPageEventHide());
                            },
                            text: 'Скрыть',
                            icon: FluentIcons.border_none_20_regular,
                            width: 80,
                          );
                        }
                      })
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
