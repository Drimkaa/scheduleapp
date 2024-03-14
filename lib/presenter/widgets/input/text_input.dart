import 'package:flutter/material.dart';

import 'list.dart';

class TextInputWithPopupSuggestions extends StatefulWidget {
  @override
  State<TextInputWithPopupSuggestions> createState() => _TextInputWithPopupSuggestionsState();
}

class _TextInputWithPopupSuggestionsState extends State<TextInputWithPopupSuggestions> {
  final TextEditingController _textEditingController = TextEditingController();
  bool overlayIsOpened = false;
  OverlayEntry? _overlayEntry;
  late bool _isOverlayAbove;
  void onTapList(String text) {
    _textEditingController.value = TextEditingValue(text: text);
    _closeOverlay();
  }

  late ScrollableList list = ScrollableList(
  key: GlobalKey(),
    text: _textEditingController,
    onChanged: onTapList,
  );
  final FocusNode _focusNode = FocusNode();
  int offset = 0;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    _overlayEntry?.remove();
    _focusNode.removeListener(_onFocusChange);
    super.dispose();
  }

  void _onFocusChange() {
    print("click outside");
    if (!_focusNode.hasFocus && !overlayIsOpened) {
      _closeOverlay();
    } else if (_focusNode.hasFocus) {
      _showOverlay(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: TextField(
      focusNode: _focusNode,
      controller: _textEditingController,
      onChanged: (value) {
        setState(() {
          if (value.isNotEmpty) {
            if (_textEditingController.text != value) {
              _textEditingController.text = value;
              _showOverlay(context);
            }
          } else {
            _closeOverlay();
          }
        });
      },
      decoration: const InputDecoration(
        hintText: 'Enter text',
      ),
    ));
  }

  Future<void> _showOverlay(BuildContext context) async {

    if (_overlayEntry == null) {
      final RenderBox textFieldRenderBox = context.findRenderObject() as RenderBox;
      final size = textFieldRenderBox.size;

      final offset = textFieldRenderBox.localToGlobal(Offset.zero);
      final offsetTop = offset.dy - 56;
      final offsetBottom = MediaQuery.of(context).size.height - offset.dy - size.height;
      double listHeight = 300;
      if (offset.dy + size.height + listHeight < MediaQuery.of(context).size.height) {
        _isOverlayAbove = false;
      } else {
        _isOverlayAbove = true;
      }
      overlayIsOpened = true;
      _overlayEntry = OverlayEntry(
        builder: (context) => Positioned(
          left: offset.dx,
          top: _isOverlayAbove ? offset.dy - (offsetTop > listHeight ? listHeight : offsetTop) : offset.dy + size.height,
          width: size.width,
          height: _isOverlayAbove
              ? (offsetTop > listHeight ? listHeight : offsetTop)
              : offsetBottom > listHeight
                  ? listHeight
                  : offsetBottom,
          child: Material(
            elevation: 4.0,
            child: TapRegion(
                child: list,
                onTapOutside: (e) => {
                      setState(() {
                        overlayIsOpened = false;
                        if(!_focusNode.hasFocus)
                        _closeOverlay();

                      })
                    }),
          ),
        ),
      );
      Overlay.of(context).insert(_overlayEntry!);
    } else {
      _overlayEntry!.markNeedsBuild();
    }
  }

  void _closeOverlay() {
    overlayIsOpened = false;

    _overlayEntry?.remove();
    _overlayEntry = null;
    setState(() {});
  }
}
