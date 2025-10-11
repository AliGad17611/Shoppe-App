import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe_app/core/di/injection_container.dart';
import 'package:shoppe_app/core/helper/spacing.dart';
import 'package:shoppe_app/core/routes/routes.dart';
import 'package:shoppe_app/core/utils/app_colors.dart';
import 'package:shoppe_app/core/widgets/primary_button.dart';
import 'package:shoppe_app/features/auth/presentation/cubit/reset_password_cubit.dart';
import 'package:shoppe_app/features/auth/presentation/cubit/reset_password_state.dart';
import 'package:shoppe_app/features/auth/presentation/widgets/auth_header.dart';
import 'package:shoppe_app/features/auth/presentation/widgets/password_text_form_field.dart';
import 'package:shoppe_app/features/auth/presentation/widgets/verification_code_input.dart';

class ResetPasswordView extends StatelessWidget {
  final String email;

  const ResetPasswordView({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ResetPasswordCubit>(),
      child: ResetPasswordViewBody(email: email),
    );
  }
}

class ResetPasswordViewBody extends StatefulWidget {
  final String email;

  const ResetPasswordViewBody({super.key, required this.email});

  @override
  State<ResetPasswordViewBody> createState() => _ResetPasswordViewBodyState();
}

class _ResetPasswordViewBodyState extends State<ResetPasswordViewBody> {
  final _formKey = GlobalKey<FormState>();
  final _otpController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  String _otpCode = '';

  @override
  void dispose() {
    _otpController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _onOtpCompleted(String code) {
    setState(() {
      _otpCode = code;
    });
  }

  void _resetPassword() {
    if (!_formKey.currentState!.validate()) return;
    if (_otpCode.isEmpty || _otpCode.length != 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter the 6-digit OTP code'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    context.read<ResetPasswordCubit>().resetPassword(
      email: widget.email,
      otp: _otpCode,
      newPassword: _newPasswordController.text.trim(),
      confirmPassword: _confirmPasswordController.text.trim(),
    );
  }

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    if (value != _newPasswordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocListener<ResetPasswordCubit, ResetPasswordState>(
          listener: (context, state) {
            if (state is ResetPasswordSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  backgroundColor: AppColors.green,
                ),
              );
              // Navigate to sign in
              Navigator.of(
                context,
              ).pushNamedAndRemoveUntil(Routes.signIn, (route) => false);
            } else if (state is ResetPasswordError) {
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
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  AuthHeader(text: 'Reset Password'),
                  verticalSpace(40),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Enter OTP Code',
                            style: Theme.of(context).textTheme.titleMedium
                                ?.copyWith(
                                  color: AppColors.textPrimary,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          verticalSpace(8),
                          Text(
                            'Enter the 6-digit code sent to ${widget.email}',
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(color: AppColors.textSecondary),
                          ),
                          verticalSpace(20),
                          VerificationCodeInput(onCompleted: _onOtpCompleted),
                          verticalSpace(30),
                          Text(
                            'New Password',
                            style: Theme.of(context).textTheme.titleMedium
                                ?.copyWith(
                                  color: AppColors.textPrimary,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          verticalSpace(8),
                          PasswordTextFormField(
                            controller: _newPasswordController,
                            hintText: 'Enter new password',
                          ),
                          verticalSpace(20),
                          Text(
                            'Confirm Password',
                            style: Theme.of(context).textTheme.titleMedium
                                ?.copyWith(
                                  color: AppColors.textPrimary,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          verticalSpace(8),
                          PasswordTextFormField(
                            controller: _confirmPasswordController,
                            hintText: 'Confirm new password',
                            validator: _validateConfirmPassword,
                          ),
                          verticalSpace(40),
                          BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
                            builder: (context, state) {
                              final isLoading = state is ResetPasswordLoading;
                              return PrimaryButton(
                                text: 'Reset Password',
                                onTap: _resetPassword,
                                isLoading: isLoading,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  verticalSpace(20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
