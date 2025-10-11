import 'package:flutter/material.dart';
import 'package:shoppe_app/core/helper/spacing.dart';
import 'package:shoppe_app/core/widgets/icon_back.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        verticalSpace(20),
        IconBack(),
        verticalSpace(15),
        Text(text, style: Theme.of(context).textTheme.headlineLarge),
      ],
    );
  }
}
