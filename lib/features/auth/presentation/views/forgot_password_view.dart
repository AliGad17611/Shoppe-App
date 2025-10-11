import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe_app/core/di/injection_container.dart';
import 'package:shoppe_app/core/helper/spacing.dart';
import 'package:shoppe_app/core/utils/app_colors.dart';
import 'package:shoppe_app/core/utils/app_strings.dart';
import 'package:shoppe_app/core/routes/routes.dart';
import 'package:shoppe_app/core/widgets/primary_button.dart';
import 'package:shoppe_app/features/auth/presentation/cubit/forgot_password_cubit.dart';
import 'package:shoppe_app/features/auth/presentation/cubit/forgot_password_state.dart';
import 'package:shoppe_app/features/auth/presentation/widgets/auth_header.dart';
import 'package:shoppe_app/features/auth/presentation/widgets/email_text_form_field.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ForgotPasswordCubit>(),
      child: const ForgotPasswordViewBody(),
    );
  }
}

class ForgotPasswordViewBody extends StatefulWidget {
  const ForgotPasswordViewBody({super.key});

  @override
  State<ForgotPasswordViewBody> createState() => _ForgotPasswordViewBodyState();
}

class _ForgotPasswordViewBodyState extends State<ForgotPasswordViewBody> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _sendResetCode() {
    if (!_formKey.currentState!.validate()) return;

    context.read<ForgotPasswordCubit>().sendResetOtp(
      email: _emailController.text.trim(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
          listener: (context, state) {
            if (state is ForgotPasswordSuccess) {
              // Show success message
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  backgroundColor: Colors.green,
                ),
              );
              // Navigate to email verification page
              Navigator.of(context).pushNamed(
                Routes.resetPassword,
                arguments: {'email': _emailController.text.trim()},
              );
            } else if (state is ForgotPasswordError) {
              // Show error message
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.apiErrorModel.message),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          builder: (context, state) {
            final isLoading = state is ForgotPasswordLoading;

            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    AuthHeader(text: AppStrings.forgotPassword),
                    verticalSpace(40),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            'Enter your email address and we\'ll send you a verification code to reset your password.',
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(
                                  color: AppColors.textSecondary,
                                  height: 1.5,
                                ),
                            textAlign: TextAlign.center,
                          ),
                          verticalSpace(40),
                          EmailTextFormField(controller: _emailController),
                          verticalSpace(40),
                          PrimaryButton(
                            text: 'Send Reset Code',
                            onTap: _sendResetCode,
                            isLoading: isLoading,
                          ),
                        ],
                      ),
                    ),
                    verticalSpace(20),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
