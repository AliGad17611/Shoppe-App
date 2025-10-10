import 'package:flutter/material.dart';
import 'package:shoppe_app/core/helper/spacing.dart';
import 'package:shoppe_app/core/routes/routes.dart';
import 'package:shoppe_app/core/utils/app_colors.dart';
import 'package:shoppe_app/core/utils/app_strings.dart';

class LoginFooter extends StatelessWidget {
  const LoginFooter({super.key,});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppStrings.dontHaveAccount,
          style: Theme.of(context).textTheme.bodyMedium,
        ),

        horizontalSpace(5),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, Routes.signUp);
          },
          child: Text(
            AppStrings.signUp,
            style: Theme.of(
              context,
            ).textTheme.titleMedium!.copyWith(color: AppColors.primary),
          ),
        ),
      ],
    );
  }
}
