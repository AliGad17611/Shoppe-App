import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shoppe_app/core/helper/spacing.dart';
import 'package:shoppe_app/core/routes/routes.dart';
import 'package:shoppe_app/core/utils/app_colors.dart';
import 'package:shoppe_app/core/utils/app_strings.dart';
import 'package:shoppe_app/features/auth/presentation/widgets/auth_footer.dart';
import 'package:shoppe_app/features/auth/presentation/widgets/auth_header.dart';
import 'package:shoppe_app/core/widgets/primary_button.dart';
import 'package:shoppe_app/features/auth/presentation/widgets/social_login_button.dart';

class AuthHomeView extends StatelessWidget {
  const AuthHomeView({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                AuthHeader(text: AppStrings.letsGetStarted),
                Spacer(flex: 1),
                SocialLoginButton(
                  text: AppStrings.facebook,
                  backgroundColor: const Color(0xFF4267B2),
                  textColor: AppColors.white,
                  icon: FontAwesomeIcons.facebook,
                  onTap: () {},
                ),
                verticalSpace(15),
                SocialLoginButton(
                  text: AppStrings.twitter,
                  backgroundColor: const Color(0xFF1DA1F2),
                  textColor: AppColors.white,
                  icon: FontAwesomeIcons.twitter,
                  onTap: () {},
                ),
                verticalSpace(15),
                SocialLoginButton(
                  text: AppStrings.google,
                  backgroundColor: const Color(0xFFDB4437),
                  textColor: AppColors.white,
                  icon: FontAwesomeIcons.google,
                  onTap: () {
                  },
                ),
                Spacer(flex: 1),
                AuthFooter(
                  onSignInTap: () {
                    Navigator.pushNamed(context, Routes.signIn);
                  },
                ),
                verticalSpace(15),
                PrimaryButton(
                  text: AppStrings.createAccount,
                  onTap: () {
                    Navigator.pushNamed(context, Routes.signUp);
                  },
                ),
                verticalSpace(30),
              ],
            ),
          ),
        ),
    );
  }
}
