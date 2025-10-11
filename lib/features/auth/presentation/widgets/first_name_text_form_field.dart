import 'package:flutter/material.dart';
import 'package:shoppe_app/core/utils/app_colors.dart';
import 'package:shoppe_app/core/widgets/custom_text_form_field.dart';

class FirstNameTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;

  const FirstNameTextFormField({
    super.key,
    this.controller,
    this.validator,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: controller,
      hintText: 'Enter your first name',
      labelText: 'First Name',
      keyboardType: TextInputType.name,
      prefixIcon: Icon(Icons.person_outline, color: AppColors.textSecondary),
      onChanged: onChanged,
      validator:
          validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your first name';
            }
            if (value.length < 2) {
              return 'First name must be at least 2 characters';
            }
            return null;
          },
    );
  }
}
