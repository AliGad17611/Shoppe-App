import 'package:flutter/material.dart';
import 'package:shoppe_app/core/utils/app_colors.dart';
import 'package:shoppe_app/core/utils/app_strings.dart';
import 'package:shoppe_app/core/widgets/custom_text_form_field.dart';

class EmailTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;

  const EmailTextFormField({
    super.key,
    this.controller,
    this.validator,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: controller,
      hintText: AppStrings.emailHint,
      labelText: AppStrings.email,
      keyboardType: TextInputType.emailAddress,
      prefixIcon: Icon(Icons.email_outlined, color: AppColors.textSecondary),
      onChanged: onChanged,
      validator:
          validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your email';
            }
            if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
              return 'Please enter a valid email';
            }
            return null;
          },
    );
  }
}

