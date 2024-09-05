
import 'package:flutter/material.dart';
import 'package:scheduleapp/data/entities/lesson_time_entity.dart';
import 'package:intl/intl.dart';
import 'package:wheel_picker/wheel_picker.dart';

import 'scroll_input.dart';

class TimeInput extends StatefulWidget {
  const TimeInput({super.key, required this.lessonTime});
  final LessonTime lessonTime;
  @override
  State<StatefulWidget> createState() => _TimeInputState();
}

class _TimeInputState extends State<TimeInput> {
  late LessonTime lessonTime;
  @override
  void initState() {
    lessonTime = widget.lessonTime;
    calculateLesson();

    super.initState();
  }

  NumberFormat formatter =  NumberFormat("00");
  List<int> lessonStart = [0, 0];
  List<int> lessonEnd = [0, 0];
  int lessonLength = 0;
  calculateLesson() {
    calculateLessonNumbers(type:"start");
    calculateLessonNumbers(type:"end");
    calculateLessonLength();

  }

  calculateLessonNumbers({String type = "start"}) {
    if (type == "start") {
      List<String> time = lessonTime.start.split(":");
      lessonStart = [int.parse(time[0]), int.parse(time[1])];
    } else {
      List<String> time = lessonTime.end.split(":");
      lessonEnd = [int.parse(time[0]) % 24, int.parse(time[1])];
    }
  }
  calculateLessonLength() {
    int time = (lessonEnd[0]*60 + lessonEnd[1]) - (lessonStart[0]*60 + lessonStart[1]) ;
    lessonLength = time;


  }
  calculateLessonEnd() {
    int time = (lessonStart[0]*60 + lessonStart[1]) + lessonLength;
    lessonEnd = [time ~/ 60 % 24, time % 60];
  }

  final secondsWheel = WheelPickerController(itemCount: 10);

 final List<int> startLessonHours = [7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22];
  final List<int> startLessonMinutes = [0, 5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55];
  final List<int> lessonLengthValues = [30, 35, 40, 45, 50, 55,60, 65, 70, 75, 80, 85, 90, 95, 100];
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(),
        Column(
          children: [
            const Text("Начало"),
            const SizedBox(height: 8),
            Row(
              children: [
                 SizedBox(
                   width: 32,
                  height: 60,
                  child: ScrollInput(
                    startPos:  startLessonHours.indexOf(lessonStart[0]),
                    values:  startLessonHours,
                    onChanged: (index) {
                      setState(() {
                        lessonStart[0] = startLessonHours[index];
                        calculateLessonEnd();
                      });
                    },
                  ),
                ),
                SizedBox(

                  child: Center(
                    child: Text(":", style: Theme.of(context).textTheme.displayMedium?.copyWith(fontSize: 20)),
                  ),
                ),
                 SizedBox(
                   width: 32,
                  height: 60,
                  child: ScrollInput(
                    startPos:  startLessonMinutes.indexOf(lessonStart[1]),
                    values: startLessonMinutes,
                    onChanged: (index) {
                      setState(() {
                        lessonStart[1] = startLessonMinutes[index];
                        calculateLessonEnd();
                      });
                    },
                  ),
                ),
              ],
            ),

          ],
        ),
        Column(
          children: [
            const Text("Длина"),
            const SizedBox(height: 8),
                 SizedBox(
                  width: 70,
                  height: 60,
                  child: ScrollInput(
                    values: lessonLengthValues,
                    startPos: lessonLengthValues.indexOf(lessonLength),
                    onChanged: (index) {
                      setState(() {
                        lessonLength = lessonLengthValues[index];
                        calculateLessonEnd();
                      });
                    },
                  ),
                ),

          ],
        ),
        Column(
          children: [
            const Text("Конец"),
            const SizedBox(height: 8),
            SizedBox(
             height: 60,
              child:
              Center(
                child: Text("${formatter.format(lessonEnd[0])}:${formatter.format(lessonEnd[1])}", style: Theme.of(context).textTheme.displaySmall?.copyWith(fontSize: 20)),

              )
              )

          ],
        ),
        const SizedBox(),
      ],
    );
  }
}
