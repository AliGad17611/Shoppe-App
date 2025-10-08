import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe_app/core/utils/app_strings.dart';
import 'package:shoppe_app/features/auth/presentation/widgets/auth_header.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            AuthHeader(text: AppStrings.welcome),
            Spacer(flex: 1),
          ],
        ),
      ),
    );
  }
}