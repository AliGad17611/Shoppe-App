import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe_app/core/utils/app_colors.dart';
import 'package:shoppe_app/features/welcome/presentation/widgets/glowing_circle.dart';

class Background extends StatelessWidget {
  const Background({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.primaryGradientStart,
              AppColors.primaryGradientEnd,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Stack(
          children: [
            Positioned(top: -81.h, left: -42.w, child: GlowingCircle()),
            Positioned(top: 503.h, left: 194.w, child: GlowingCircle()),
            Positioned(
              top: 381.h,
              left: -74.w,
              height: 148.h,
              width: 148.w,
              child: GlowingCircle(),
            ),
            child,
          ],
        ),
      ),
    );
  }
}
