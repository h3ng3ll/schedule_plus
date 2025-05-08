import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../bloc/auth_cubit/auth_cubit.dart';
import '../../../../resources/colors/app_color_scheme.dart';
import '../../../../resources/text/app_text_theme.dart';
import '../../../../routes/app_routes_paths.dart';
import '../../../../widgets/btn/action_btn.dart';
import '../../../../widgets/custom_form_field.dart';
import '../../../../widgets/error_message_widget.dart';
import '../../../../widgets/loading_widget.dart';
import '../../../../widgets/padding/horizontal_padding.dart';
import 'bloc/login_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> onLogin(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      context
          .read<LoginBloc>()
          .add(
        LoginEvent.login(
            email: _emailController.text.trim(),
            password: _passwordController.text.trim(),
            onCompleted: () {
              context.pushReplacementNamed(
                AppRoutesPaths.scheduleRoute,
              );
            }
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);
    final textTheme = AppTextTheme.of(context);
    return BlocProvider<LoginBloc>(
      create: (_) => LoginBloc(
        context.read<AuthCubit>(),
      ),
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              actions: [
                Spacer(),
                Text(
                  'Sign In to account',
                  style: textTheme.medium24.copyWith(
                    color: colorScheme.secondary,
                  ),
                ),
                Spacer()
              ],
            ),
            body: Stack(
              children: [
                HorizontalPadding(
                  child: Form(
                    key: _formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Gap(50.0),
                          CustomTextField(
                            controller: _emailController,
                            labelText: 'Email',
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              }
                              if (!value.contains('@')) {
                                return 'Please enter a valid email';
                              }
                              return null;
                            },
                          ),
                          const Gap(16.0),
                          CustomTextField(
                            controller: _passwordController,
                            labelText: 'Password',
                            obscureText: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              }
                              return null;
                            },
                          ),
                          const Gap(24.0),
                          if (state.status == LoginStatus.error)
                            ErrorMessageWidget(
                              message: state.errorMessage,
                            ),
                          const Gap(24.0),
                          ActionBtn(
                            onPressed: () => onLogin(
                              context,
                            ),
                            text: 'SIGN IN',
                          ),
                          const Gap(16.0),
                        ],
                      ),
                    ),
                  ),
                ),
                if (state.status == LoginStatus.loading) LoadingWidget(),
              ],
            ),
          );
        },
      ),
    );
  }
}
