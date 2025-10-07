import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe_app/core/helper/spacing.dart';
import 'package:shoppe_app/core/utils/app_strings.dart';

class OnboardingTextSection extends StatelessWidget {
  const OnboardingTextSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Column(
        children: [
          Text(
            AppStrings.welcomeTitle,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          verticalSpace(10),
          Text(
            AppStrings.welcomeSubtitle,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
