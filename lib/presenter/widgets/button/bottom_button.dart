import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final IconData icon;
  final double width;
  final Widget? child;
  const BottomButton({
    super.key,
    required this.onPressed,
    this.text = "",
    this.icon = Icons.add,
    this.width = 100,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: TextButton.styleFrom(
        shape: const BeveledRectangleBorder(borderRadius: BorderRadius.zero),
      ),
      onPressed: onPressed,
      icon: SizedBox(
        width: width,
        child: child ??Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 24),

             Text(
              text,
              style:
                  Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w300),
            ),
          ],
        ),
      ),
    );
  }
}
