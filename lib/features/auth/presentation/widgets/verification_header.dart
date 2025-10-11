import 'package:flutter/material.dart';
import 'package:shoppe_app/core/helper/spacing.dart';
import 'package:shoppe_app/core/utils/app_colors.dart';
import 'package:shoppe_app/core/utils/app_strings.dart';

class VerificationHeader extends StatelessWidget {
  final String description;
  final double descriptionSpacing;

  const VerificationHeader({
    super.key,
    required this.description,
    this.descriptionSpacing = 12.0,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          AppStrings.enterVerificationCode,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
        verticalSpace(descriptionSpacing),
        Text(
          description,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: AppColors.textSecondary,
            height: 1.5,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
