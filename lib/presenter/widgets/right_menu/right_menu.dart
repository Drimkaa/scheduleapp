import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:scheduleapp/core/constants/constants.dart';
import 'package:scheduleapp/presenter/bloc/right_menu/right_menu_bloc.dart';
import 'package:scheduleapp/presenter/bloc/right_menu/right_menu_event.dart';
import 'package:scheduleapp/presenter/bloc/right_menu/right_menu_state.dart';

import '../../../core/constants/my_colors.dart';
import 'day_button.dart';

class RightMenu extends StatelessWidget {
  const RightMenu({Key? key, required this.bloc}) : super(key: key);

  final RightMenuBloc bloc;

  @override
  Widget build(BuildContext context) {

    return   BlocBuilder<RightMenuBloc, RightMenuState>(
        bloc: bloc,
        builder: (_, state) {
          return
          SizedBox(
            height: MediaQuery
                .of(context)
                .size
                .height - 112,
            child: Center(
              child:

              Container(
                padding: const EdgeInsets.only(top: 12, bottom: 12),
                height: state.days.length * 36 + (state.days.length - 1) * 10 + 24,
                width: 56,
                decoration: BoxDecoration(
                  color: const MyColors().dark_3,
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(28), bottomLeft: Radius.circular(28)),
                ),
                child: Column(
                  children: [
                    for (var i = 0; i < state.days.length; i++) ...[


                      DayWidgetButton(
                        currentDay: state.currentDay == state.days[i].pos,
                        selected: state.selected,
                        day: state.days[i],
                        position: i,
                        length: state.days.length,
                        onPressed: () => bloc.add(RightMenuEventMoveTo(day: i)),
                      ),
                      if (i < state.days.length - 1) const SizedBox(height: 10)
                    ]
                  ],
                ),
              ),
            ),
          )
          ;
        });
  }
}
