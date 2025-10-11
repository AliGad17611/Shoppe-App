import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:shoppe_app/core/utils/app_colors.dart';

class VerificationCodeInput extends StatelessWidget {
  final Function(String) onCompleted;

  const VerificationCodeInput({
    super.key,
    required this.onCompleted,
  });

 

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 45.w,
      height: 50.h,
      textStyle: Theme.of(context).textTheme.headlineSmall?.copyWith(
        color: AppColors.textPrimary,
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        color: AppColors.lightGrey,
        borderRadius: BorderRadius.circular(12.r),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        border: Border.all(color: AppColors.primary, width: 2.w),
      ),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: AppColors.lightGrey,
      ),
    );

    return Pinput(
      length: 6,
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      submittedPinTheme: submittedPinTheme,
      keyboardType: TextInputType.number,
      onCompleted: (value) => onCompleted(value),
      showCursor: true,
      cursor: Container(width: 2.w, height: 20.h, color: AppColors.primary),
    );
  }
}
