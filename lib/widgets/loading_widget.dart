import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // final colorScheme = AppColorScheme.of(context);
    // final textTheme = AppTextTheme.of(context);
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
