import 'package:flutter/material.dart';

import '../../resources/colors/app_color_scheme.dart';
import '../../resources/text/app_text_theme.dart';

class ActionBtn extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const ActionBtn({
    super.key,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);
    final textTheme = AppTextTheme.of(context);
    return ElevatedButton(
      onPressed: onPressed,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 12.0,
        ),
        child: Text(
          text,
          style: textTheme.medium16.copyWith(
            color: colorScheme.onPrimary,
          ),
        ),
      ),
    );
  }
}
