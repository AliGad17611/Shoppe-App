import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoppe_app/core/di/injection_container.dart';
import 'package:shoppe_app/core/utils/app_colors.dart';
import 'package:shoppe_app/core/utils/app_strings.dart';
import 'package:shoppe_app/features/auth/presentation/cubit/login_cubit.dart';
import 'package:shoppe_app/features/auth/presentation/cubit/login_state.dart';
import 'package:shoppe_app/features/auth/presentation/widgets/auth_header.dart';
import 'package:shoppe_app/features/auth/presentation/widgets/login_form.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<LoginCubit>(),
      child: const SignInViewBody(),
    );
  }
}

// make it stateless widget
class SignInViewBody extends StatelessWidget {
  const SignInViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              // Show success message
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Welcome back!'),
                  backgroundColor: Colors.green,
                ),
              );
              // Navigator.pushReplacementNamed(context, Routes.home);
            } else if (state is LoginError) {
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
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  AuthHeader(text: AppStrings.welcome),
                  Text(
                    AppStrings.signInDescription,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                  Spacer(flex: 1),
                  LoginForm(),
                  Spacer(flex: 4),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
