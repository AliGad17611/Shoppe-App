import 'package:flutter/material.dart';
import 'package:shoppe_app/core/helper/spacing.dart';
import 'package:shoppe_app/core/utils/app_strings.dart';

class AuthFooter extends StatelessWidget {
  final VoidCallback onSignInTap;

  const AuthFooter({super.key, required this.onSignInTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppStrings.alreadyHaveAccount,
          style: Theme.of(context).textTheme.bodyMedium,
        ),

        horizontalSpace(5),
        GestureDetector(
          onTap: onSignInTap,
          child: Text(
            AppStrings.signIn,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
      ],
    );
  }
}
