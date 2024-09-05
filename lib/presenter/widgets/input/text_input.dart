

import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:scheduleapp/core/constants/my_colors.dart';

import '../../../data/repositories/postgres_repository.dart';
enum ValidatorType { text, number, name, date, time, list }

class TextInputWithPopupSuggestions extends StatefulWidget {
  final String hintText;
  final ValidatorType type;

  final String value;
  final GetSuggestionsRepository repository;
  const TextInputWithPopupSuggestions({
    super.key,
    this.value = "",

    required this.repository,
    this.hintText = "Введите текст",
    this.type = ValidatorType.text,
  });
  @override
  State<StatefulWidget> createState() => _TextInputWithPopupSuggestionsState();
}

class _TextInputWithPopupSuggestionsState extends State<TextInputWithPopupSuggestions> {


  @override
  void initState() {
    if (widget.value.isNotEmpty) {
      textEditingController.text = widget.value;
    }
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    super.dispose();
    textEditingController.dispose();
  }

  donePressed() {

    validate(value: textEditingController.text, type: ValidatorType.text);
  }

  SuggestionsController<String> suggestionsController = SuggestionsController<String>();
  String _search = "";
  String? errorText;

  bool isLoading = false;
  bool allLoaded = false;
  final TextEditingController textEditingController = TextEditingController();
  final SuggestionsController<String> suggestionController = SuggestionsController<String>();
  final ScrollController _scrollController = ScrollController();
  bool currentStatus = false;
  @override
  Widget build(BuildContext context) {
    return TypeAheadField<String>(

          constraints: const BoxConstraints(maxHeight: 300),
      controller: textEditingController,
      offset: const Offset(0, 1),
      autoFlipDirection: true,
      hideOnUnfocus: true,
      hideOnSelect: true,
      hideKeyboardOnDrag: true,
      decorationBuilder: (context, child) {
        return Material(
          type: MaterialType.card,
          elevation: 0,
          color: MyColors.dark_3,
          borderRadius: BorderRadius.vertical(top: Radius.zero,bottom: Radius.circular(8)),
          child: child,
        );
      },
      suggestionsController: suggestionController,
      suggestionsCallback: (search) {
        allLoaded = false;
        isLoading = false;

        widget.repository
            .call(search, offset: 0)
            .then((value) {
              return Future.value(value);
            })
            .then((value) => suggestionController.suggestions = value)
            .then((value) => {_search = search, allLoaded = suggestionController.suggestions!.length < 20});
        return null;
      },
      builder: (context, _, focusNode) {
        return TextFormField(

          validator: (value) {
            validate(value: value ?? "", type: widget.type);
            return null;
          },
          focusNode: focusNode,

          onChanged: changeValue,
          controller: textEditingController,
          keyboardType: TextInputType.name,
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
            suffixIcon: errorText == null && currentStatus

                    ? IconButton(
                        onPressed: donePressed,
                        icon: const Icon(
                          Icons.done_rounded,
                          color: Colors.greenAccent,
                          size: 28,
                        ),
                        padding: const EdgeInsets.all(0.0),
                      )
                : null,
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
            error: errorText == null ? null : const SizedBox(),

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
        return
          TapRegion(
        onTapOutside: (t) {
          FocusScope.of(context).requestFocus(FocusNode());
        },
              child:


          Container(
            child:

          ListView.builder(
          shrinkWrap: true,
          controller: _scrollController,
          // Подключаем контроллер прокрутки
          itemCount:
              (suggestionController.suggestions!.length) + 1, // Увеличиваем количество элементов на 1 для индикатора загрузки
          itemBuilder: (context, index) {
            if (index < suggestionController.suggestions!.length) {
              return cities[index];
            } else {
              if (allLoaded) return const SizedBox();
              return _buildProgressIndicator(); // Возвращаем индикатор загрузки в конце списка
            }
          },
        )));
      },
      itemBuilder: (context, city) {
        int id = city.toLowerCase().indexOf(_search.toLowerCase());
        int textLength = _search.length;
        return ListTile(
            title: RichText(
          text: TextSpan(
            text: city.substring(0, id),
            style: DefaultTextStyle.of(context).style,
            children: <TextSpan>[
              TextSpan(text: city.substring(id, id + textLength), style: const TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(text: city.substring(id + textLength), style: DefaultTextStyle.of(context).style),
            ],
          ),
        ));
      },
      emptyBuilder: (context) {
        return const SizedBox(
          height: 32,
          child: Center(
            child: Text("Ничего не найдено"),
          ),
        );
      },
      onSelected: (city) {
        changeValue(city, needController: true);
      },
    );
  }



  changeValue(String value, {bool needController = false}) {
    if (needController) {
      textEditingController.text = value;
    }
    validate(value: value, type: widget.type);
  }

  validate({required String value, required ValidatorType type}) {
    if (value.isEmpty) {
      errorText = "пусто";
    } else {
      errorText = null;
    }
    setState(() {});
  }

  void _onScroll() {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
      _loadMoreItems();
    }
  }

  Future<void> _loadMoreItems() async {
    if (!isLoading && !allLoaded) {
      setState(() {
        isLoading = true;
      });
      List<String> newItems =
          await widget.repository.call(_search, offset: suggestionController.suggestions!.length + 20).then((value) {
        return Future.value(value);
      });
      setState(() {
        suggestionController.suggestions = [...suggestionController.suggestions!, ...newItems];
        isLoading = false;
        if (newItems.length < 20) allLoaded = true;
      });
    }
  }

  Widget _buildProgressIndicator() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
