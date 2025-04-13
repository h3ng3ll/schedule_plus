// import 'package:flutter/material.dart';
// import 'package:flutter_shaders/flutter_shaders.dart';
//
// import '../../../../../../../resources/app_shader.dart';
// import '../../../../../../../widgets/app_background.dart';
//
// class PulsingNotificationIcon extends StatefulWidget {
//   final double size;
//
//   const PulsingNotificationIcon({
//     super.key,
//     this.size = 24.0,
//   });
//
//   @override
//   State<PulsingNotificationIcon> createState() =>
//       _PulsingNotificationIconState();
// }
//
// class _PulsingNotificationIconState extends State<PulsingNotificationIcon>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   final int _startTime = DateTime.now().millisecondsSinceEpoch;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 1500),
//     )..repeat();
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//   double _elapsedTimeInSeconds() =>
//       (DateTime.now().millisecondsSinceEpoch - _startTime) / 1000;
//
//   @override
//   Widget build(BuildContext context) {
//     return ShaderBuilder(
//       assetKey: AppShaders.notificationPulse,
//       (context, shader, child) {
//         return AnimatedBuilder(
//           animation: _controller,
//           builder: (context, child) {
//
//             shader.setFloat(0, _elapsedTimeInSeconds());  // uTime
//             shader.setFloat(1, widget.size);             // uSize.x
//             shader.setFloat(2, widget.size);             // uSize.y
//             shader.setFloat(3, 1.0);                     // uColor.r
//             shader.setFloat(4, 0.0);                     // uColor.g
//             shader.setFloat(5, 0.0);                     // uColor.b
//             shader.setFloat(6, 1.0);                     // uColor.a
//
//             return SizedBox(
//               width: widget.size,
//               height: widget.size,
//               child: CustomPaint(
//                 painter: ShaderPainter(shader),
//                 size: Size(widget.size, widget.size),
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
// }
