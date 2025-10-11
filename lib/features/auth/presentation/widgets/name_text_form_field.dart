import 'package:flutter/material.dart';
import 'package:shoppe_app/core/utils/app_colors.dart';
import 'package:shoppe_app/core/utils/app_strings.dart';
import 'package:shoppe_app/core/widgets/custom_text_form_field.dart';

class NameTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;

  const NameTextFormField({
    super.key,
    this.controller,
    this.validator,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: controller,
      hintText: AppStrings.nameHint,
      labelText: AppStrings.name,
      keyboardType: TextInputType.name,
      prefixIcon: Icon(Icons.person_outline, color: AppColors.textSecondary),
      onChanged: onChanged,
      validator:
          validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your name';
            }
            if (value.trim().split(' ').length < 2) {
              return 'Please enter both first and last name';
            }
            if (value.length < 6) {
              return 'Name must be at least 6 characters';
            }
            return null;
          },
    );
  }
}
