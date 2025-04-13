import 'package:flutter/material.dart';

import '../../../../../widgets/app_background.dart';
import '../schedule_tab/widgets/app_bar/app_header.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHeader(),
      body: AppBackground(
        child: Column(
          children: [
            Row(
              children: [
                Text('dfdsaf'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
