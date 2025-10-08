import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe_app/core/helper/spacing.dart';
import 'package:shoppe_app/core/routes/routes.dart';
import 'package:shoppe_app/core/utils/app_colors.dart';
import 'package:shoppe_app/core/utils/app_strings.dart';

class OnboardingButtons extends StatelessWidget {
  const OnboardingButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OnboardingButton(
              label: AppStrings.men,
              color: Theme.of(context).cardColor,
              textStyle: Theme.of(context).textTheme.bodyLarge!,
            ),
            horizontalSpace(10),
            OnboardingButton(
              label: AppStrings.women,
              color: AppColors.primary,
              textStyle: Theme.of(
                context,
              ).textTheme.bodyLarge!.copyWith(color: AppColors.white),
            ),
          ],
        ),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, Routes.authHome);
          },
          child: Text(
            AppStrings.skip,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ],
    );
  }
}

class OnboardingButton extends StatelessWidget {
  final String label;
  final Color color;
  final TextStyle textStyle;
  const OnboardingButton({
    super.key,
    required this.label,
    required this.color,
    required this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, Routes.authHome);
        },
        child: Container(
          height: 60.h,
          padding: EdgeInsets.symmetric(vertical: 10.h),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Center(
            child: Text(label, style: textStyle, textAlign: TextAlign.center),
          ),
        ),
      ),
    );
  }
}
