import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scheduleapp/core/constants/constants.dart';

import 'package:scheduleapp/presenter/bloc/day/day_bloc.dart';
import 'package:scheduleapp/presenter/bloc/day/day_event.dart';

import 'package:scheduleapp/presenter/bloc/day/day_state.dart';
import 'package:scheduleapp/presenter/bloc/lesson/lesson_state.dart';
import 'package:scheduleapp/presenter/widgets/lesson_widget.dart';

class DayWidget extends StatefulWidget {
  const DayWidget({Key? key, required this.day}) : super(key: key);

  final DayBloc day;

  @override
  State<StatefulWidget> createState() => _DayWidget();
}

class _DayWidget extends State<DayWidget> {
  late DayBloc day;

  @override
  void initState() {


    super.initState();
    day = widget.day;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DayBloc, DayState>(
      bloc: day,
      builder: (context, state) {
        if (state.status == DateStateStatus.initial) {

          return Container(
            margin: EdgeInsets.only(right: 80),
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 22, bottom: 10, top: 4),
                      child: Text(state.day.fullName, textAlign: TextAlign.left, style: Theme.of(context).textTheme.titleLarge),
                    ),
                    if(state.hiddenLessons>0)
                      GestureDetector(
                        onTap: ()=>{day.add(DayEventShowButton())},
                        child: Container(
                            child:
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [Text("скрыто ${state.hiddenLessons}",textAlign: TextAlign.left, style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white70)),
                                !state.displayHiddenLessons ?  Icon(Icons.keyboard_arrow_down)
                                    : Icon(Icons.keyboard_arrow_up)
                              ],
                            )

                        ),),
                  ],
                ),

                for (var i = 0; i< state.lessons.length;i++)
                  if ( state.lessons[i].state.hidden && !state.displayHiddenLessons)
                    const SizedBox()
                  else ...[
                    if(state.displayHiddenLessons || !state.lessons[i].state.hidden) LessonWidget(lesson:  state.lessons[i],key: GlobalKey(),),
                    if (i != state.lessons.lastIndexWhere((el) => !el.state.hidden) || state.displayHiddenLessons)
                      const SizedBox(
                        height: 16,
                      )
                  ]
              ],
            ),);
        }

        return const Text("загрузка");
      },
    );
  }
}
