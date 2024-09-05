import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:scheduleapp/core/constants/my_colors.dart';


enum ValidatorType { text, number, name, date, time, list }

class DropdownList extends StatefulWidget {
  final String hintText;
  final ValidatorType type;
  final String value;
  final List<String> items;
  const DropdownList({
    super.key,
    this.value = "",
    required this.items,
    this.hintText = "Enter text",
    this.type = ValidatorType.text,
  });

  @override
  State<StatefulWidget> createState() => _TextInputWithPopupSuggestionsState();
}

class _TextInputWithPopupSuggestionsState extends State<DropdownList> {
  @override
  void initState() {
    if (widget.value.isNotEmpty) {
      textEditingController.text = widget.value;
    }
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    textEditingController.dispose();
  }

  SuggestionsController<String> suggestionsController = SuggestionsController<String>();
  String? errorText;

  bool isLoading = false;
  bool allLoaded = false;
  final TextEditingController textEditingController = TextEditingController();
  final SuggestionsController<String> suggestionController = SuggestionsController<String>();
  bool currentStatus = false;
  @override
  Widget build(BuildContext context) {
    return TypeAheadField<String>(
      controller: textEditingController,

      offset: const Offset(0, 1),
      suggestionsController: suggestionController,
      suggestionsCallback: (search) {
        allLoaded = false;
        isLoading = false;
        return widget.items;
      },
      autoFlipDirection: true,
      autoFlipMinHeight: 200,
      decorationBuilder: (context, child) {
        return Material(
          type: MaterialType.card,
          elevation: 0,
          color: MyColors.dark_3,
          borderRadius: BorderRadius.vertical(top: Radius.zero,bottom: Radius.circular(8)),
          child: child,
        );
      },
      builder: (context, _, focusNode) {
        return TextFormField(
          focusNode: focusNode,
          onTap: () => changeFocus(true),
          onTapOutside: (_) => changeFocus(false),
          onEditingComplete: () => changeFocus(false),
          onChanged: changeValue,
          controller: textEditingController,
          keyboardType: TextInputType.name,
          readOnly: true,
          textDirection: TextDirection.ltr,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w300,
            fontSize: 16,
          ),
          cursorColor: MyColors.first,
          textAlignVertical: TextAlignVertical.center,
          textAlign: TextAlign.left,
          maxLines: 1,
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.always,

            hintText: widget.hintText,
            hintStyle: const TextStyle(
              color: MyColors.dark_4,
              fontWeight: FontWeight.w300,
              fontSize: 16,
            ),
            errorStyle: const TextStyle(
              color: MyColors.red,
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
            prefix: const SizedBox(width: 12),
            alignLabelWithHint: false,
            errorBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: MyColors.red, width: 2),
            ),
            prefixStyle: const TextStyle(
              color: MyColors.dark_4,
            ),
            focusedErrorBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: MyColors.red, width: 2),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: MyColors.first, width: 2),
            ),
            border: const UnderlineInputBorder(
              borderSide: BorderSide(color: MyColors.first, width: 2),
            ),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: MyColors.dark_4, width: 2),
            ),
            disabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: MyColors.second, width: 2),
            ),
            focusColor: MyColors.first,
            hoverColor: MyColors.firstD,
          ),
        );
      },

      listBuilder: (context, cities) {

        return ListView.builder(
          itemCount: cities.length,
          shrinkWrap: true,
          // Подключаем контроллер прокрутки
          itemBuilder: (context, index) {
            return cities[index];
          },
        );
      },
      itemBuilder: (context, city) {
        return ListTile(
            title: RichText(
          text: TextSpan(
            text: city,
            style: DefaultTextStyle.of(context).style,
          ),
        ));
      },
      onSelected: (city) {
        changeValue(city, needController: true);
        changeFocus(false);
      },
    );
  }

  changeFocus(bool newStatus) async {
    if (currentStatus == false && newStatus == true) {
      currentStatus = true;
    } else if (currentStatus == true && newStatus == false) {
      currentStatus = false;
      FocusScope.of(context).unfocus();
    }
  }
  changeValue(String value, {bool needController = false}) {
    if (needController) {
      textEditingController.text = value;
    }
  }
}
