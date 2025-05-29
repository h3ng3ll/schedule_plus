import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../../bloc/auth_cubit/auth_cubit.dart';
import '../../../../../resources/colors/app_color_scheme.dart';
import '../../../../../resources/text/app_text_theme.dart';
import '../../../../../routes/app_routes_paths.dart';
import '../../../../../widgets/app_background.dart';
import '../../../../../widgets/btn/action_btn.dart';
import '../schedule_tab/widgets/app_bar/app_header.dart';
import 'bloc/profile_tab_bloc.dart';
import 'widget/build_user_avatar.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  Future<void> logOut(BuildContext context) async {
    await context.read<AuthCubit>().logOut();
    if (context.mounted) {
      context.pushReplacementNamed(
        AppRoutesPaths.initialLoaderRoute,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);
    final textTheme = AppTextTheme.of(context);
    return BlocProvider(
      create: (_) => ProfileTabBloc()..add(
          ProfileTabEvent.load(),
        ),
      child: Scaffold(
        appBar: AppHeader(),
        body: AppBackground(
          child: BlocBuilder<ProfileTabBloc, ProfileTabState>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Gap(20.0),
                  BuildUserAvatar(
                    image: state.user?.imgUrl,
                  ),
                  Text(
                    '${state.user?.name ?? ''} ${state.group?.name ?? ''}',
                    style: textTheme.medium24.copyWith(
                      color: colorScheme.secondary,
                    ),
                  ),
                  Text(
                    state.user?.email ?? '',
                    style: textTheme.medium14.copyWith(
                      color: colorScheme.secondary.withValues(
                        alpha: 0.4,
                      ),
                    ),
                  ),
                  Text(
                    state.user?.department.name ?? '',
                    style: textTheme.medium14.copyWith(
                      color: colorScheme.secondary.withValues(
                        alpha: 0.4,
                      ),
                    ),
                  ),
                  Spacer(),
                  ActionBtn(
                    onPressed: () => logOut(
                      context,
                    ),
                    text: 'logout',
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
