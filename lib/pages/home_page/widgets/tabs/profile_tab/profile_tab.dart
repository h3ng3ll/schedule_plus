import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

import '../../../../../resources/colors/app_color_scheme.dart';
import '../../../../../resources/text/app_text_theme.dart';
import '../../../../../widgets/app_background.dart';
import '../schedule_tab/widgets/app_bar/app_header.dart';
import 'bloc/profile_tab_bloc.dart';
import 'widget/build_user_avatar.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);
    final textTheme = AppTextTheme.of(context);
    return BlocProvider(
      create: (context) => ProfileTabBloc(),
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
                    image: state.avatarUrl,
                  ),
                  Text(
                    "${state.name} ${state.surname}",
                    style: textTheme.medium24.copyWith(
                      color: colorScheme.secondary,
                    ),
                  ),
                  Text(
                    "${state.department} year ${state.year}",
                    style: textTheme.medium14.copyWith(
                      color: colorScheme.secondary.withValues(
                        alpha: 0.4,
                      ),
                    ),
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
