import 'package:flutter/material.dart';

import '../../../data/repositories/postgres_repository.dart';

class ScrollableList extends StatefulWidget {
   const ScrollableList({super.key,required this.text, required this.repository, required this.onChanged});
   final TextEditingController text;
  final GetSuggestionsRepository repository;
  final void Function(String)  onChanged;
  @override
  State<StatefulWidget> createState() => _ScrollableListState();
}

class _ScrollableListState extends State<ScrollableList> {
 late List<String> items = [];
  final ScrollController _scrollController = ScrollController();
  bool isLoading = false;
  bool allLoaded = false;

  @override
   initState() {
    super.initState();
    widget.repository.call(widget.text.value.text) .then((value) {return Future.value(value);}).then((value) => setState((){items = value;}));
    init();
    _scrollController.addListener(_onScroll); // Слушатель прокрутки
  }
  String lastText = '';
  void textListener() async {

    if(lastText == widget.text.text){
      return;
    }
    lastText = widget.text.text;
    allLoaded = false;
    isLoading = false;
    items = await widget.repository.call(widget.text.value.text) .then((value) {return Future.value(value);});
    setState(() {});
  }
   init() async {

     widget.text.addListener(textListener);
  }
  @override
  void dispose() {
    widget.text.removeListener(textListener);
    _scrollController.dispose();
    super.dispose();
  }

  // Метод, вызываемый при прокрутке списка
  void _onScroll() {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
      // Если достигнут конец списка
      _loadMoreItems();
    }
  }

  // Метод для загрузки дополнительных элементов
  Future<void> _loadMoreItems() async {
    if (!isLoading && !allLoaded) {
      setState(() {
        isLoading = true; // Устанавливаем флаг загрузки
      });

      // Загружаем следующие 10 элементов

      List<String> newItems = await widget.repository.call(widget.text.text, offset: items.length + 20) .then((value) {return Future.value(value);});
      setState(() {
        items.addAll(newItems); // Добавляем новые элементы в список
        isLoading = false; // Сбрасываем флаг загрузки
        if(newItems.length < 20) allLoaded = true;
      });
    }
  }
  onTapList(String text) {
    widget.text.removeListener(textListener);
    widget.onChanged(text);
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        controller: _scrollController, // Подключаем контроллер прокрутки
        itemCount: items.length + 1, // Увеличиваем количество элементов на 1 для индикатора загрузки
        itemBuilder: (context, index) {
          if (index < items.length) {
            return ListTile(
              title: Text(items[index]),
              onTap: () => onTapList(items[index]),
            );
          } else {
            return _buildProgressIndicator(); // Возвращаем индикатор загрузки в конце списка
          }
        },
    );
  }

  // Виджет индикатора загрузки
  Widget _buildProgressIndicator() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Opacity(
          opacity: isLoading ? 1.0 : 0.0, // Отображаем индикатор загрузки только если isLoading = true
          child: const CircularProgressIndicator(),
        ),
      ),
    );
  }
}