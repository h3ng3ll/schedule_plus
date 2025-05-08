import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../resources/colors/app_color_scheme.dart';
import '../../../../../../../resources/colors/app_colors.dart';
import '../../../../../../../resources/text/app_text_theme.dart';
import '../../../../../../../routes/app_routes_paths.dart';
import '../../../../../../../widgets/padding/horizontal_padding.dart';
import '../../../../../bloc/settings_bloc/settings_bloc.dart';

class AppHeader extends StatefulWidget implements PreferredSizeWidget {
  const AppHeader({super.key});

  @override
  State<AppHeader> createState() => _AppHeaderState();

  @override
  Size get preferredSize => Size.fromHeight(kTextTabBarHeight);
}

class _AppHeaderState extends State<AppHeader>
    with SingleTickerProviderStateMixin {
  void onTapNotifications(BuildContext context) {
    context.pushNamed(
      AppRoutesPaths.notificationRoute,
    );
    // await NotificationService.instance.showNotifications();
  }

  // bool initializedShaders = false;
  //
  // late final AnimationController animationController;
  //
  // @override
  // void initState() {
  //   super.initState();
  //   initializeShader();
  //   animationController = AnimationController(
  //     vsync: this,
  //     duration: Duration(
  //       seconds: 5,
  //     ),
  //   );
  //   animationController
  //     ..addListener(() {
  //       setState(() {});
  //     })
  //     ..addStatusListener(
  //       (AnimationStatus status) {
  //         if (status.isCompleted) {
  //           animationController.reverse();
  //         } else if (status.isDismissed) {
  //           animationController.forward();
  //         }
  //       },
  //     )
  //     ..forward();
  // }
  //
  // @override
  // void dispose() {
  //   animationController.dispose();
  //
  //   super.dispose();
  // }
  //
  // void initializeShader() async {
  //   await FragmentProgramManager.initialize(
  //     AppShaders.notificationPulse,
  //   );
  //   initializedShaders = true;
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);
    final textTheme = AppTextTheme.of(context);

    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        final unReadNotifications = state.unReadNotifications;

        return HorizontalPadding(
          child: AppBar(
            actions: [
              Text(
                'Розклад+',
                style: TextStyle(
                  color: AppColors.majorelleBlue.value,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              Row(
                children: [
                  Stack(
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.notifications_outlined,
                        ),
                        onPressed: () => onTapNotifications(
                          context,
                        ),
                      ),
                      // if (initializedShaders)
                      if (unReadNotifications > 0)
                        Positioned(
                          right: 10,
                          top: 10,
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.red,
                            ),
                            width: 15.0,
                            height: 15.0,
                            child: Center(
                              child: Text(
                                unReadNotifications.toString(),
                                style: textTheme.regular10.copyWith(
                                  color: colorScheme.inactiveSecondary,
                                ),
                              ),
                            ),
                          ),
                          // child: CustomPaint(
                          //   painter: MyPainter(
                          //     color: Colors.red,
                          //     // shader: FragmentProgramManager.lookup(
                          //     //   AppShaders.notificationPulse,
                          //     // ).fragmentShader(),
                          //     animation: animationController,
                          //     radius: 7.5,
                          //   ),
                          // ),
                        ),
                    ],
                  ),
                  const CircleAvatar(
                    radius: 16,
                    // backgroundImage: NetworkImage('https://via.placeholder.com/150'),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class MyPainter extends CustomPainter {
  final Color color;
  final FragmentShader shader;
  final Animation<double> animation;
  final double radius;

  MyPainter({
    required this.radius,
    required this.animation,
    required this.color,
    required this.shader,
  }) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    // shader.setFloat(0, animation.value);
    //

    // Устанавливаем цвет как uColor (значения от 0.0 до 1.0)
    shader.setFloat(0, color.r);
    shader.setFloat(1, color.g);
    shader.setFloat(2, color.b);
    shader.setFloat(3, color.a); // alpha уже в диапазоне 0-1

    shader.setFloat(4, size.width);
    shader.setFloat(5, size.height);
    shader.setFloat(6, animation.value);

    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      radius,
      Paint()..shader = shader,
    );
  }

  @override
  bool shouldRepaint(MyPainter oldDelegate) => color != oldDelegate.color;
}
