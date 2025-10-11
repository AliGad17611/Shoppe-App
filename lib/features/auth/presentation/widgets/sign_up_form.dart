import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppe_app/core/di/injection_container.dart';
import 'package:shoppe_app/core/helper/spacing.dart';
import 'package:shoppe_app/core/routes/routes.dart';
import 'package:shoppe_app/core/utils/app_colors.dart';
import 'package:shoppe_app/core/utils/app_strings.dart';
import 'package:shoppe_app/core/widgets/primary_button.dart';
import 'package:shoppe_app/features/auth/presentation/cubit/register_cubit.dart';
import 'package:shoppe_app/features/auth/presentation/cubit/register_state.dart';
import 'package:shoppe_app/features/auth/presentation/widgets/email_text_form_field.dart';
import 'package:shoppe_app/features/auth/presentation/widgets/first_name_text_form_field.dart';
import 'package:shoppe_app/features/auth/presentation/widgets/last_name_text_form_field.dart';
import 'package:shoppe_app/features/auth/presentation/widgets/password_text_form_field.dart';
import 'package:shoppe_app/features/auth/presentation/views/verification_view.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<RegisterCubit>(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterSuccess) {
            // Navigate to verification page
            Navigator.of(context).pushNamed(
              Routes.verification,
              arguments: {
                'type': VerificationType.email,
                'email': _emailController.text.trim(),
              },
            );
          } else if (state is RegisterError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.apiErrorModel.message),
                backgroundColor: AppColors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          return Form(
            key: _formKey,
            child: Column(
              children: [
                FirstNameTextFormField(controller: _firstNameController),
                verticalSpace(20),
                LastNameTextFormField(controller: _lastNameController),
                verticalSpace(20),
                EmailTextFormField(controller: _emailController),
                verticalSpace(20),
                PasswordTextFormField(controller: _passwordController),
                verticalSpace(20),
                PasswordTextFormField(
                  labelText: AppStrings.confirmPassword,
                  controller: _confirmPasswordController,
                ),
                verticalSpace(50),
                PrimaryButton(
                  text: AppStrings.signUp,
                  isLoading: state is RegisterLoading,
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      if (_passwordController.text !=
                          _confirmPasswordController.text) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Passwords do not match'),
                            backgroundColor: AppColors.red,
                          ),
                        );
                        return;
                      }

                      context.read<RegisterCubit>().register(
                        email: _emailController.text.trim(),
                        password: _passwordController.text,
                        firstName: _firstNameController.text.trim(),
                        lastName: _lastNameController.text.trim(),
                      );
                    }
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
