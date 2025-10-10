import 'package:flutter/material.dart';
import 'package:shoppe_app/core/utils/app_colors.dart';

class SwitcherWidget extends StatefulWidget {
  const SwitcherWidget({super.key});

  @override
  State<SwitcherWidget> createState() => _SwitcherWidgetState();
}

class _SwitcherWidgetState extends State<SwitcherWidget> {
  bool _isSwitched = true;

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: _isSwitched,
      onChanged: (value) {
        setState(() {
          _isSwitched = value;
        });
      },
      activeThumbColor: AppColors.white,
      activeTrackColor: AppColors.green,
      inactiveThumbColor: AppColors.textSecondary,
      trackOutlineColor: WidgetStateProperty.all(AppColors.grey),
    );
  }
}
