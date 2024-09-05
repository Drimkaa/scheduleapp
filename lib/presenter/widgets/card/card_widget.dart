import 'package:flutter/material.dart';
import 'package:scheduleapp/core/constants/my_colors.dart';

class CardWithImage extends StatelessWidget {
  final Widget child;
  final AssetImage image;
  final Color gradientColor;

  const CardWithImage({
    super.key,
    required this.child,
    required this.image,
    this.gradientColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: [
        Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: MyColors.dark_3,
              image: DecorationImage(
                image: ResizeImage(
                  image,
                  width: 640,  // ширина, с которой будет декодироваться изображение
                  height: 640,  // высота, с которой будет декодироваться изображение
                ),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          top: 0,
          bottom: -1,
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter,
                colors: [
                  gradientColor.withOpacity(0.5),
                  gradientColor.withOpacity(0.9),
                  gradientColor.withOpacity(1),
                ],
                stops: const [0.0, 0.7, 1.0],
              ),
            ),
          ),
        ),
        child
      ],
    );
  }
}
