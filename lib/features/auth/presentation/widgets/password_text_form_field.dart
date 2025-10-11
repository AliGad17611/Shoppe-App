import 'package:flutter/material.dart';
import 'package:shoppe_app/core/utils/app_colors.dart';
import 'package:shoppe_app/core/utils/app_strings.dart';
import 'package:shoppe_app/core/widgets/custom_text_form_field.dart';

class PasswordTextFormField extends StatefulWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final String? hintText;
  final String? labelText;
  final int? minLength;

  const PasswordTextFormField({
    super.key,
    this.controller,
    this.validator,
    this.onChanged,
    this.hintText,
    this.labelText,
    this.minLength = 6,
  });

  @override
  State<PasswordTextFormField> createState() => _PasswordTextFormFieldState();
}

class _PasswordTextFormFieldState extends State<PasswordTextFormField> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: widget.controller,
      hintText: widget.hintText ?? AppStrings.passwordHint,
      labelText: widget.labelText ?? AppStrings.password,
      obscureText: _obscurePassword,
      keyboardType: TextInputType.visiblePassword,
      prefixIcon: Icon(Icons.lock_outline, color: AppColors.textSecondary),
      suffixIcon: IconButton(
        icon: Icon(
          _obscurePassword
              ? Icons.visibility_off_outlined
              : Icons.visibility_outlined,
          color: AppColors.textSecondary,
        ),
        onPressed: () {
          setState(() {
            _obscurePassword = !_obscurePassword;
          });
        },
      ),
      onChanged: widget.onChanged,
      validator:
          widget.validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your password';
            }
            if (value.length < (widget.minLength ?? 6)) {
              return 'Password must be at least ${widget.minLength ?? 6} characters';
            }
            return null;
          },
    );
  }
}

