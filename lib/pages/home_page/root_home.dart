import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../bloc/auth_cubit/auth_cubit.dart';
import 'bloc/settings_bloc/settings_bloc.dart';

class RootHome extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const RootHome({
    super.key,
    required this.navigationShell,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SettingsBloc>(
      create: (_) => SettingsBloc(
        context.read<AuthCubit>().state.user!,
      ),
      child: Scaffold(
        body: navigationShell,
      ),
    );
  }
}
