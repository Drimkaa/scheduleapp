import 'dart:math';

import 'package:flutter/material.dart';



@immutable
class AssetImages {
  const AssetImages();
  static final List<AssetImage> _list = [
    const AssetImage("assets/images/card1.jpg"),
    const AssetImage("assets/images/card2.jpg"),
    const AssetImage("assets/images/card3.jpg"),
    const AssetImage("assets/images/card4.jpg"),
    const AssetImage("assets/images/card5.jpg"),
  ];

  static AssetImage get random => _list[Random().nextInt(_list.length)];
}