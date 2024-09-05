import 'package:auto_route/auto_route.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scheduleapp/core/constants/my_colors.dart';
import 'package:scheduleapp/presenter/bloc/week/week_bloc.dart';
import 'package:scheduleapp/presenter/widgets/icon_button.dart';

@RoutePage()
class RedactorScreen extends StatelessWidget {
  const RedactorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title:
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          CustomColorIconButton(
            onPressed: () {
              BlocProvider.of<WeekPageBloc>(context, listen: false)
                  .add(WeekPageEventUpdateSubgroup());

              AutoRouter.of(context).back();
            },
            iconData: FluentIcons.arrow_left_16_regular,
            background: MyColors.dark_1,
          ),
          const Text('Редактор расписания'),
          Container(
            width: 32,
          ),
        ]),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(22.0),
            child: Column(
              children: [

              ],
            )),
      ),
    );
  }


}