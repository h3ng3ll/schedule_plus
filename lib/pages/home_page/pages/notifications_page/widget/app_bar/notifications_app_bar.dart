import 'dart:ui';

import 'package:flutter/material.dart';


import '../../../../../../../resources/colors/app_colors.dart';
import '../../../../../../../widgets/padding/horizontal_padding.dart';

class NotificationAppBar extends StatelessWidget implements PreferredSizeWidget {
  const NotificationAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return HorizontalPadding(
      child: AppBar(
        actions: [
          Spacer(),
          Text(
            'Уведомления',
            style: TextStyle(
              color: AppColors.majorelleBlue.value,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(),

        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kTextTabBarHeight);
}
