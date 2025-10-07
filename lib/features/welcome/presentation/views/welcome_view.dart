import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe_app/core/helper/spacing.dart';
import 'package:shoppe_app/core/utils/app_colors.dart';
import 'package:shoppe_app/features/welcome/presentation/widgets/background.dart';
import 'package:shoppe_app/features/welcome/presentation/widgets/onboarding_buttons.dart';
import 'package:shoppe_app/features/welcome/presentation/widgets/onboarding_image.dart';
import 'package:shoppe_app/features/welcome/presentation/widgets/onboarding_text_section.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Background(
      child: SafeArea(
        child: Stack(
          children: [
            OnboardingImage(),
            Positioned(
              bottom: 15.h,
              left: 15.w,
              right: 15.w,
              child: Container(
                width: double.infinity,
                height: 244.h,
                decoration: BoxDecoration(
                  color: Theme.of(context).brightness == Brightness.light
                      ? AppColors.white
                      : AppColors.lightBlack,
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                ),
                padding: EdgeInsets.only(
                  left: 15.w,
                  right: 15.w,
                  top: 25.h,
                  bottom: 10.h,
                ),
                child: Column(
                  children: [
                    OnboardingTextSection(),
                    verticalSpace(20),
                    OnboardingButtons(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
