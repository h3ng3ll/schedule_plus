import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../resources/colors/app_color_scheme.dart';
import '../../../resources/text/app_text_theme.dart';
import '../../../widgets/btn/action_btn.dart';

class AuthHeader extends StatelessWidget {
  final VoidCallback onGoSignIn;
  final VoidCallback onGoSignUp;

  const AuthHeader({
    super.key,
    required this.onGoSignIn,
    required this.onGoSignUp,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);
    final textTheme = AppTextTheme.of(context);

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 40),
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              color: colorScheme.primary.withValues(
                    alpha: 0.1,
                  ),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.lock_outline,
              size: 60,
              color: colorScheme.primary,
            ),
          ),
          const Gap( 16.0),
          Text(
            'Welcome',
            style: textTheme.bold24.copyWith(
              color: colorScheme.secondary
            ),
            textAlign: TextAlign.center,
          ),
          const Gap( 8.0),
           Text(
            'Sign in or create an account to continue',
            style: textTheme.medium14.copyWith(
                color: colorScheme.secondary
            ),
            textAlign: TextAlign.center,
          ),

          const Gap( 50.0),
          ActionBtn(
            onPressed: onGoSignIn,
            text: 'SIGN IN',
          ),
          const Gap( 16.0),
          ActionBtn(
            onPressed: onGoSignUp,
            text: 'SIGN UP',
          ),
        ],
      ),
    );
  }
}
