import 'dart:ui' as ui;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'bloc/auth_cubit/auth_cubit.dart';
import 'bloc/core/app_observer.dart';
import 'bloc/notification_bloc/notification_bloc.dart';
import 'firebase_options.dart';

import 'resources/app_theme.dart';
import 'routes/init_router.dart';
import 'services/firebase/firebase_messaging_service.dart';
import 'services/notification_service/notification_service.dart';

late ui.FragmentProgram fragmentProgram;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await FirebaseMessagingService.instance.init();
  await NotificationService.instance.init();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );

  Bloc.observer = AppObserver.instance();

  runApp(const MyHomePage());
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final NotificationBloc notificationBloc;
  late final AuthCubit authCubit;

  @override
  void initState() {
    notificationBloc = NotificationBloc();
    authCubit = AuthCubit(
      notificationBloc,
    );
    super.initState();
  }

  @override
  void dispose() {
    authCubit.close();
    notificationBloc.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //   // return AnimatedShader(
    //   //   program: fragmentProgram,
    //   //   duration: Duration(seconds: 2),
    //   //   size: Size(
    //   //     300,
    //   //     300,
    //   //   ),
    //   // );
    //   return CustomPaint(
    //     size: Size(500, 500),
    //     painter: MyPainter(
    //       color: Colors.green,
    //       shader: fragmentProgram.fragmentShader(),
    //     ),
    //   );
    // }
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>.value(
          value: authCubit,
        ),
        BlocProvider<NotificationBloc>.value(
          value: notificationBloc,
        ),
      ],
      child: MaterialApp.router(
        theme: AppThemeData.light,
        routerConfig: initRouter,
        builder: EasyLoading.init(),
      ),
    );
  }
}

class AnimatedShaderPainter extends CustomPainter {
  AnimatedShaderPainter(this.shader, this.animation)
      : super(repaint: animation);

  final ui.FragmentShader shader;
  final Animation<double> animation;

  @override
  void paint(Canvas canvas, Size size) {
    shader.setFloat(0, animation.value);
    canvas.drawRect(
      Offset.zero & size,
      Paint()..shader = shader,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class AnimatedShader extends StatefulWidget {
  const AnimatedShader({
    super.key,
    required this.program,
    required this.duration,
    required this.size,
  });

  final ui.FragmentProgram program;
  final Duration duration;
  final Size size;

  @override
  State<AnimatedShader> createState() => AnimatedShaderState();
}

class AnimatedShaderState extends State<AnimatedShader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late final ui.FragmentShader _shader;

  @override
  void initState() {
    super.initState();
    _shader = widget.program.fragmentShader()
      ..setFloat(0, 0.0)
      ..setFloat(1, widget.size.width.toDouble())
      ..setFloat(2, widget.size.height.toDouble());
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    )
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((AnimationStatus status) {
        switch (status) {
          case AnimationStatus.completed:
            _controller.reverse();
            break;
          case AnimationStatus.dismissed:
            _controller.forward();
            break;
          default:
            break;
        }
      })
      ..forward();
  }

  @override
  void didUpdateWidget(AnimatedShader oldWidget) {
    super.didUpdateWidget(oldWidget);
    _controller.duration = widget.duration;
  }

  @override
  void dispose() {
    _controller.dispose();
    _shader.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: AnimatedShaderPainter(_shader, _controller),
      size: widget.size,
    );
  }
}
