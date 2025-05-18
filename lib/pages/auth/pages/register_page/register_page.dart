import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../bloc/auth_cubit/auth_cubit.dart';
import '../../../../model/department/department.dart';
import '../../../../model/group/group.dart';
import '../../../../resources/colors/app_color_scheme.dart';
import '../../../../resources/text/app_text_theme.dart';
import '../../../../routes/app_routes_paths.dart';
import '../../../../widgets/btn/action_btn.dart';
import '../../../../widgets/custom_form_field.dart';
import '../../../../widgets/error_message_widget.dart';
import '../../../../widgets/loading_widget.dart';
import '../../../../widgets/padding/horizontal_padding.dart';
import 'bloc/register_bloc.dart';

class RegisterPageArgs {
  final String name;

  final Group group;

  final Department department;

  RegisterPageArgs({
    required this.name,
    required this.group,
    required this.department,
  });
}

class RegisterPage extends StatefulWidget {
  final RegisterPageArgs registerPageArgs;

  const RegisterPage({
    super.key,
    required this.registerPageArgs,
  });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> onRegister(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      context.read<RegisterBloc>().add(
            RegisterEvent.register(
              email: _emailController.text.trim(),
              password: _passwordController.text.trim(),
              registerPageArgs: widget.registerPageArgs,
              onCompleted: () {
                context.pushReplacementNamed(
                  AppRoutesPaths.scheduleRoute,
                );
              },
            ),
          );
    }
  }

  Future<void> updateData(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      context.read<RegisterBloc>().add(
            RegisterEvent.register(
              email: _emailController.text.trim(),
              password: _passwordController.text.trim(),
              // name: _nameController.text.trim(),
              onCompleted: () {
                context.pushReplacementNamed(
                  AppRoutesPaths.scheduleRoute,
                );
              },
              registerPageArgs: widget.registerPageArgs,
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);
    final textTheme = AppTextTheme.of(context);

    return BlocProvider<RegisterBloc>(
      create: (context) => RegisterBloc(
        context.read<AuthCubit>(),
      ),
      child: Scaffold(
        appBar: AppBar(
          actions: [
            Spacer(),
            Text(
              'Create Account',
              style: textTheme.medium24.copyWith(
                color: colorScheme.secondary,
              ),
            ),
            Spacer()
          ],
        ),
        body: BlocBuilder<RegisterBloc, RegisterState>(
          builder: (context, state) {
            return Stack(
              children: [
                HorizontalPadding(
                  child: Form(
                    key: _formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Gap(50.0),
                          const Gap(16.0),
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
                                return 'Please enter a password';
                              }
                              if (value.length < 6) {
                                return 'Password must be at least 6 characters';
                              }
                              return null;
                            },
                          ),
                          const Gap(16.0),
                          CustomTextField(
                            controller: _confirmPasswordController,
                            labelText: 'Confirm Password',
                            obscureText: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please confirm your password';
                              }
                              if (value != _passwordController.text) {
                                return 'Passwords do not match';
                              }
                              return null;
                            },
                          ),
                          const Gap(24.0),
                          if (state.status == RegisterStatus.error)
                            ErrorMessageWidget(
                              message: state.errorMessage,
                            ),
                          const Gap(24.0),
                          ActionBtn(
                            onPressed: () => onRegister(
                              context,
                            ),
                            text: 'REGISTER',
                          ),
                          const Gap(16),
                        ],
                      ),
                    ),
                  ),
                ),
                if (state.status == RegisterStatus.loading) LoadingWidget(),
              ],
            );
          },
        ),
      ),
    );
  }
}
