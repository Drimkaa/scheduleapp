import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scheduleapp/core/constants/constants.dart';
import 'package:scheduleapp/presenter/bloc/right_menu/right_menu_bloc.dart';
import 'package:scheduleapp/presenter/bloc/right_menu/right_menu_event.dart';
import 'package:scheduleapp/presenter/bloc/right_menu/right_menu_state.dart';

import '../../../core/constants/my_colors.dart';
import 'day_button.dart';

class RightMenu extends StatelessWidget {
  const RightMenu({super.key, required this.bloc});

  final RightMenuBloc bloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RightMenuBloc, RightMenuState>(
      bloc: bloc,
      builder: (_, state) {
        return SizedBox(
          height: MediaQuery.of(context).size.height - 112,
          child: Center(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
              height: state.days.length * 36 + (state.days.length - 1) * 10 + 24,
              width: 56,
              decoration: const BoxDecoration(
                color: MyColors.dark_3,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(28), bottomLeft: Radius.circular(28)),
              ),
              child: ListView.separated(
                itemCount: state.days.length,
                separatorBuilder: (_, __) => const SizedBox(height: 10),
                itemBuilder: (_, index) {
                  final day = state.days[index];
                  final isCurrentDay = state.currentDay == day.pos;
                  return DayWidgetButton(
                    currentDay: isCurrentDay,
                    selected: state.selected,
                    day: day,
                    position: index,
                    length: state.days.length,
                    onPressed: () => bloc.add(RightMenuEventMoveTo(day: index)),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
