import 'package:auto_route/auto_route.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scheduleapp/core/constants/app_themes.dart';
import 'package:scheduleapp/core/constants/my_colors.dart';
import 'package:scheduleapp/presenter/bloc/week/week_bloc.dart';
import 'package:scheduleapp/presenter/widgets/group_selector/group_selector.dart';
import 'package:scheduleapp/presenter/widgets/icon_button.dart';

@RoutePage()
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

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
          const Text('Настройки'),
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
                const GroupSelectorWidget(),
                const SizedBox(height: 22),
                OpenRedactorPage(context),
              ],
            )),
      ),
    );
  }

  Widget OpenRedactorPage(BuildContext context) {
    return
      GestureDetector(
        onTap: () async {
          context.router.pushNamed('/redactor');
          

        },

        child:  Container(

          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color:  MyColors.first ,
            borderRadius: BorderRadius.circular(22),
          ),
          child:
          Text(
            textAlign: TextAlign.center,
            "Редактор расписания",
            style: Theme.of(context).textTheme.bodySmallWith(
              color:   MyColors.dark_3 ,
              fontWeight: FontWeight.w400,
            ),
          ),

        ),

      );
  }
}
