import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../bloc/auth_cubit/auth_cubit.dart';
import '../../routes/app_routes_paths.dart';
import 'widgets/auth_header.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  void onLogin(BuildContext context) {
    context.pushNamed(
      AppRoutesPaths.loginRouter,
    );
  }

  void onRegister(BuildContext context) {
    context.pushNamed(
      AppRoutesPaths.registerRouter,
    );
  }

  @override
  void initState() {
    context.read<AuthCubit>().getUser().then(
      (user) {
        if (user != null && mounted) {
          context.goNamed(
            AppRoutesPaths.scheduleRoute,
          );
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AuthHeader(
            onGoSignIn: () => onLogin(
              context,
            ),
            onGoSignUp: () => onRegister(
              context,
            ),
          ),
        ],
      ),
    );
  }
}
