import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../../resources/colors/app_colors.dart';

class BuildUserAvatar extends StatelessWidget {
  final String? image;

  const BuildUserAvatar({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(
        8.0,
      ),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          // stops: [0.0, 0.5, 0.75 , 1],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            AppColors.majorelleBlue.value.withValues(
              alpha: 0.5,
            ),
            AppColors.majorelleBlue.value.withValues(
              alpha: 0.05,
            ),
          ],
        ),
      ),
      child: Container(
        width: 90,
        height: 90,
        decoration: BoxDecoration(
          image: image != null
              ? DecorationImage(
                  image: CachedNetworkImageProvider(
                    image!,
                  ),
                )
              : null,
          shape: BoxShape.circle,
        ),
        child: buildIcon(),
        // child: image == null
        //     ? Placeholder()
        //     : CachedNetworkImage(
        //         imageUrl: image!,
        //       ),
      ),
    );
  }

  Widget buildIcon() {
    return Align(
      alignment: Alignment(1.4, 1.4),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.majorelleBlue.value,
        ),
        width: 40.0,
        height: 40.0,
        child: Icon(
          Icons.camera_alt,
          color: AppColors.white.value,
        ),
      ),
    );
  }
}
