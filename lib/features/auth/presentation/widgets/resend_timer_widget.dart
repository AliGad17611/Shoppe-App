import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppe_app/core/helper/spacing.dart';
import 'package:shoppe_app/core/utils/app_colors.dart';
import 'package:shoppe_app/core/utils/app_strings.dart';
import 'package:shoppe_app/features/auth/presentation/cubit/verification_cubit.dart';
import 'package:shoppe_app/features/auth/presentation/cubit/verification_state.dart';

class ResendTimerWidget extends StatefulWidget {
  final String email;

  const ResendTimerWidget({super.key, required this.email});

  @override
  State<ResendTimerWidget> createState() => _ResendTimerWidgetState();
}

class _ResendTimerWidgetState extends State<ResendTimerWidget> {
  Timer? _timer;
  int _remainingTime = 60;
  bool _canResend = false;
  bool _isResendLoading = false;

  @override
  void initState() {
    super.initState();
    _startResendTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startResendTimer() {
    setState(() {
      _remainingTime = 60;
      _canResend = false;
    });

    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingTime > 0) {
        setState(() {
          _remainingTime--;
        });
      } else {
        timer.cancel();
        setState(() {
          _canResend = true;
        });
      }
    });
  }

  void _restartResendTimer() {
    _startResendTimer();
  }

  void _resendCode() {
    if (_canResend && !_isResendLoading) {
      context.read<VerificationCubit>().resendCode(email: widget.email);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<VerificationCubit, VerificationState>(
      listener: (context, state) {
        if (state is VerificationResendLoading) {
          setState(() {
            _isResendLoading = true;
          });
        } else if (state is VerificationResendSuccess) {
          setState(() {
            _isResendLoading = false;
          });
          _restartResendTimer();
        } else if (state is VerificationResendError) {
          setState(() {
            _isResendLoading = false;
          });
        }
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            AppStrings.didntReceiveCode,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: AppColors.textSecondary),
          ),
          horizontalSpace(5),
          GestureDetector(
            onTap: _canResend && !_isResendLoading ? _resendCode : null,
            child: Text(
              _isResendLoading
                  ? 'Sending...'
                  : _canResend
                  ? AppStrings.resendCode
                  : '${AppStrings.resendCode} (${_remainingTime}s)',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: _canResend && !_isResendLoading
                    ? AppColors.primary
                    : AppColors.textSecondary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
