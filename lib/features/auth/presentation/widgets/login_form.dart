import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppe_app/core/helper/spacing.dart';
import 'package:shoppe_app/core/routes/routes.dart';
import 'package:shoppe_app/core/utils/app_colors.dart';
import 'package:shoppe_app/core/utils/app_strings.dart';
import 'package:shoppe_app/core/widgets/primary_button.dart';
import 'package:shoppe_app/features/auth/presentation/cubit/login_cubit.dart';
import 'package:shoppe_app/features/auth/presentation/widgets/email_text_form_field.dart';
import 'package:shoppe_app/features/auth/presentation/widgets/login_footer.dart';
import 'package:shoppe_app/features/auth/presentation/widgets/password_text_form_field.dart';
import 'package:shoppe_app/features/auth/presentation/widgets/switcher_widget.dart';
import 'package:shoppe_app/features/auth/presentation/widgets/terms_and_conditions_text.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() {
    if (_formKey.currentState!.validate()) {
      context.read<LoginCubit>().login(
        email: _emailController.text.trim(),
        password: _passwordController.text,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          EmailTextFormField(controller: _emailController),
          verticalSpace(20),
          PasswordTextFormField(controller: _passwordController),
          verticalSpace(10),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                // Navigate to forgot password page
                Navigator.pushNamed(context, Routes.forgotPassword);
              },
              child: Text(
                AppStrings.forgotPassword,
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium!.copyWith(color: AppColors.primary),
              ),
            ),
          ),
          Row(
            children: [Text(AppStrings.rememberMe), Spacer(), SwitcherWidget()],
          ),

          verticalSpace(30),
          PrimaryButton(text: AppStrings.signIn, onTap: _handleLogin),
          verticalSpace(15),
          TermsAndConditionsText(),
          verticalSpace(30),
          LoginFooter(),
        ],
      ),
    );
  }
}
