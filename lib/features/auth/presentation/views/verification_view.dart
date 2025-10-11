import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe_app/core/di/injection_container.dart';
import 'package:shoppe_app/core/helper/spacing.dart';
import 'package:shoppe_app/core/routes/routes.dart';
import 'package:shoppe_app/core/utils/app_colors.dart';
import 'package:shoppe_app/core/utils/app_strings.dart';
import 'package:shoppe_app/features/auth/presentation/cubit/verification_cubit.dart';
import 'package:shoppe_app/features/auth/presentation/cubit/verification_state.dart';
import 'package:shoppe_app/features/auth/presentation/widgets/auth_header.dart';
import 'package:shoppe_app/features/auth/presentation/widgets/resend_timer_widget.dart';
import 'package:shoppe_app/features/auth/presentation/widgets/verification_code_input.dart';

enum VerificationType { email, resetPassword }

class VerificationView extends StatelessWidget {
  final VerificationType type;
  final String email;

  const VerificationView({super.key, required this.type, required this.email});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<VerificationCubit>(),
      child: VerificationViewBody(type: type, email: email),
    );
  }
}

class VerificationViewBody extends StatelessWidget {
  final VerificationType type;
  final String email;

  const VerificationViewBody({
    super.key,
    required this.type,
    required this.email,
  });

  String get _getTitle {
    switch (type) {
      case VerificationType.email:
        return AppStrings.verifyEmail;
      case VerificationType.resetPassword:
        return AppStrings.resetPassword;
    }
  }

  void onCompleted(BuildContext context, String value) {
    switch (type) {
      case VerificationType.email:
        context.read<VerificationCubit>().verifyCode(email: email, code: value);
        break;
      case VerificationType.resetPassword:
        context.read<VerificationCubit>().verifyCode(email: email, code: value);
        break;
    }
  }

  String get _getDescription {
    return '${AppStrings.verificationCodeSent}\n$email';
  }

  void _navigateToNextPage(BuildContext context) {
    switch (type) {
      case VerificationType.email:
        Navigator.of(context).pushNamed(Routes.signIn);
      case VerificationType.resetPassword:
        Navigator.of(context).pushNamed(Routes.resetPassword);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocListener<VerificationCubit, VerificationState>(
          listener: (context, state) {
            log('VerificationView: State changed to ${state.runtimeType}');
            if (state is VerificationSuccess) {
              log('VerificationView: Success - ${state.message}');
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  backgroundColor: AppColors.green,
                ),
              );
              _navigateToNextPage(context);
            } else if (state is VerificationError) {
              log('VerificationView: Error - ${state.apiErrorModel.message}');
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.apiErrorModel.message),
                  backgroundColor: AppColors.red,
                ),
              );
            } else if (state is VerificationResendSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  backgroundColor: AppColors.primary,
                ),
              );
            } else if (state is VerificationResendError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.apiErrorModel.message),
                  backgroundColor: AppColors.red,
                ),
              );
            }
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                AuthHeader(text: _getTitle),
                verticalSpace(40),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        AppStrings.enterVerificationCode,
                        style: Theme.of(context).textTheme.headlineSmall
                            ?.copyWith(
                              color: AppColors.textPrimary,
                              fontWeight: FontWeight.w600,
                            ),
                        textAlign: TextAlign.center,
                      ),
                      verticalSpace(12),
                      Text(
                        _getDescription,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.textSecondary,
                          height: 1.5,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      verticalSpace(40),
                      VerificationCodeInput(
                        onCompleted: (value) => onCompleted(context, value),
                      ),
                      verticalSpace(30),
                      ResendTimerWidget(email: email),
                    ],
                  ),
                ),
                verticalSpace(20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
