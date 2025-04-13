import 'package:flutter/material.dart';
import 'package:flutter_shaders/flutter_shaders.dart';

import '../resources/colors/app_colors.dart';

class AppBackground extends StatefulWidget {
  final Widget child;

  const AppBackground({
    super.key,
    required this.child,
  });

  @override
  State<AppBackground> createState() => _AppBackgroundState();
}

class _AppBackgroundState extends State<AppBackground>
    with SingleTickerProviderStateMixin {
  // late AnimationController _controller;
  //
  // @override
  // void initState() {
  //   _controller = AnimationController(
  //     vsync: this,
  //     duration: Duration(
  //       seconds: 5,
  //     ),
  //   )..repeat();
  //   _controller
  //     ..addListener(() {
  //       print(_controller.value);
  //       setState(() {});
  //     })
  //     ..addStatusListener(
  //           (AnimationStatus status) {
  //         if (status.isCompleted) {
  //           _controller.reverse();
  //         } else if (status.isDismissed) {
  //           _controller.forward();
  //         }
  //       },
  //     )
  //     ..forward();
  //
  //   super.initState();
  // }
  //
  // @override
  // void dispose() {
  //   _controller.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    // return ShaderBuilder(
    //   assetKey: AppShaders.backgroundGradient,
    //   (context, shader, child) {
    //     return AnimatedBuilder(
    //       animation: _controller,
    //       builder: (
    //         context,
    //         child,
    //       ) {
    //         final size = MediaQuery.of(context).size;
    //         shader
    //           ..setFloat(0, _controller.value)
    //           ..setFloat(1, size.width)
    //           ..setFloat(1, size.height);
    //
    //         return CustomPaint(
    //           painter: ShaderPainter(
    //             shader,
    //             _controller,
    //           ),
    //           child: widget.child,
    //         );
    //       },
    //     );
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.magnolia.value,
                AppColors.ghostWhite.value,
              ],
            ),
          ),
          child: widget.child,
        );
  //     },
  //   );
  }
}

class ShaderPainter extends CustomPainter {
  final FragmentShader shader;
  final Animation<double> animation;

  ShaderPainter(this.shader, this.animation)
      : super(
          repaint: animation,
        );

  @override
  void paint(Canvas canvas, Size size) {
    shader.setFloat(0, animation.value,);
    shader.setFloat(1, size.width,);
    shader.setFloat(2, size.height,);
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint()..shader = shader,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
