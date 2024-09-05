
import 'package:flutter/material.dart';
import 'package:scheduleapp/core/constants/my_colors.dart';
import 'package:intl/intl.dart';

@immutable
class ScrollInput extends StatefulWidget {
   const ScrollInput({super.key, required this.values, this.startPos = 0, required this.onChanged});
  final int startPos;
  final List values;
  final Function(int) onChanged;
  @override
  State<StatefulWidget> createState() => _ScrollInput();
}
NumberFormat formatter =  NumberFormat("00");
class _ScrollInput extends State<ScrollInput> {
  late List values;
  late final ScrollController _controller;
  int _selectedIndex = 0;

  @override
  void initState() {
    values = widget.values;
    _controller = FixedExtentScrollController(initialItem: widget.startPos);
    _selectedIndex = widget.startPos;
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      height: 30,
      child: ListWheelScrollView.useDelegate(
        controller: _controller,
        physics: const FixedExtentScrollPhysics(),
        diameterRatio: 1.4,
        perspective: 0.01,
        itemExtent: 25,
        onSelectedItemChanged: (index) {
          setState(() {
            _selectedIndex = index;
            widget.onChanged(index);
          });
        },
        childDelegate: ListWheelChildLoopingListDelegate(
          children:
          values.map((e) => Text(
            formatter.format(e),
            style: Theme.of(context)
                .textTheme
                .displaySmall
                ?.copyWith(color: _selectedIndex == values.indexOf(e) ? Colors.white : MyColors.dark_4, fontSize: 20),
          )).toList(),

        ),
      ),
    );
  }
}
