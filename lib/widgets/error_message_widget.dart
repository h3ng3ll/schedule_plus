import 'package:flutter/material.dart';

import '../resources/colors/app_color_scheme.dart';
import '../resources/text/app_text_theme.dart';

class ErrorMessageWidget extends StatelessWidget {
  final String message;

  const ErrorMessageWidget({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);
    final textTheme = AppTextTheme.of(context);
    return Text(
      message,
      style: textTheme.medium12.copyWith(
        color: colorScheme.error,
      ),
    );
  }
}
