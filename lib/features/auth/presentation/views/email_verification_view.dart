import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe_app/core/di/injection_container.dart';
import 'package:shoppe_app/core/helper/spacing.dart';
import 'package:shoppe_app/core/routes/routes.dart';
import 'package:shoppe_app/core/utils/app_colors.dart';
import 'package:shoppe_app/features/auth/presentation/cubit/verification_cubit.dart';
import 'package:shoppe_app/features/auth/presentation/cubit/verification_state.dart';
import 'package:shoppe_app/features/auth/presentation/widgets/auth_header.dart';
import 'package:shoppe_app/features/auth/presentation/widgets/resend_timer_widget.dart';
import 'package:shoppe_app/features/auth/presentation/widgets/verification_code_input.dart';

class EmailVerificationView extends StatelessWidget {
  final String email;

  const EmailVerificationView({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<VerificationCubit>(),
      child: EmailVerificationViewBody(email: email),
    );
  }
}

class EmailVerificationViewBody extends StatelessWidget {
  final String email;

  const EmailVerificationViewBody({super.key, required this.email});

  void _onCodeCompleted(BuildContext context, String code) {
    context.read<VerificationCubit>().verifyCode(email: email, code: code);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocListener<VerificationCubit, VerificationState>(
          listener: (context, state) {
            if (state is VerificationSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  backgroundColor: AppColors.green,
                ),
              );
              // Navigate to reset password view
              Navigator.of(context).pushReplacementNamed(
                Routes.resetPassword,
                arguments: {'email': email},
              );
            } else if (state is VerificationError) {
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
                AuthHeader(text: 'Verify Email'),
                verticalSpace(40),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        'Enter Verification Code',
                        style: Theme.of(context).textTheme.headlineSmall
                            ?.copyWith(
                              color: AppColors.textPrimary,
                              fontWeight: FontWeight.w600,
                            ),
                        textAlign: TextAlign.center,
                      ),
                      verticalSpace(12),
                      Text(
                        'We\'ve sent a verification code to\n$email',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.textSecondary,
                          height: 1.5,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      verticalSpace(40),
                      VerificationCodeInput(
                        onCompleted: (code) => _onCodeCompleted(context, code),
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
