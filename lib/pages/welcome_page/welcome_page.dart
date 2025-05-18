import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../bloc/auth_cubit/auth_cubit.dart';
import '../../routes/app_routes_paths.dart';
import '../auth/pages/register_intermediate_page/bloc/register_intermediate_page_bloc.dart';
import '../auth/pages/register_intermediate_page/register_intermediate_page.dart';
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
      AppRoutesPaths.registerIntermediateRouter,
      extra: RegisterIntermediatePageArgs(
        registerIntermediatePageBloc:
            context.read<RegisterIntermediatePageBloc>(),
      ),
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
    return MultiBlocProvider(
      providers: [
        BlocProvider<RegisterIntermediatePageBloc>(
          create: (_) => RegisterIntermediatePageBloc()
            ..add(
              RegisterIntermediatePageEvent.fetchGroups(),
            )
            ..add(
              RegisterIntermediatePageEvent.fetchDepartments(),
            ),
        ),
      ],
      child: Scaffold(
        body: Builder(
          builder: (context) {
            return Stack(
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
            );
          }
        ),
      ),
    );
  }
}
