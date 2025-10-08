import 'package:flutter/material.dart';

class GlowingCircle extends StatelessWidget {
  const GlowingCircle({super.key, this.width = 250, this.height = 250});
  final double width;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.white.withValues(alpha: 0.6),
              blurRadius: 120, // same as your Figma layer blur
              spreadRadius: 0,
            ),
          ],
        ),
      ),
    );
  }
}
