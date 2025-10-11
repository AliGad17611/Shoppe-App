import 'package:flutter/material.dart';
import 'package:shoppe_app/core/utils/app_colors.dart';
import 'package:shoppe_app/core/utils/app_strings.dart';

class TermsAndConditionsText extends StatelessWidget {
  const TermsAndConditionsText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      textAlign: TextAlign.center,
      TextSpan(
        children: [
          TextSpan(
            text: AppStrings.byLogin,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          TextSpan(
            text: AppStrings.termAndCondition,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium!.copyWith(color: AppColors.textPrimary),
          ),
        ],
      ),
    );
  }
}
