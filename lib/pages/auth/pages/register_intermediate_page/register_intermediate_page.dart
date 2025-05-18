import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../model/department/department.dart';
import '../../../../model/group/group.dart';
import '../../../../resources/colors/app_color_scheme.dart';
import '../../../../resources/text/app_text_theme.dart';
import '../../../../routes/app_routes_paths.dart';
import '../../../../widgets/btn/action_btn.dart';
import '../../../../widgets/custom_form_field.dart';
import '../../../../widgets/loading_widget.dart';
import '../../../../widgets/padding/horizontal_padding.dart';
import '../register_page/register_page.dart';
import 'bloc/register_intermediate_page_bloc.dart';

class RegisterIntermediatePageArgs {
  final RegisterIntermediatePageBloc registerIntermediatePageBloc;

  RegisterIntermediatePageArgs({
    required this.registerIntermediatePageBloc,
  });
}

class RegisterIntermediatePage extends StatefulWidget {
  final RegisterIntermediatePageArgs registerIntermediatePageArgs;

  const RegisterIntermediatePage({
    super.key,
    required this.registerIntermediatePageArgs,
  });

  @override
  State<RegisterIntermediatePage> createState() =>
      _RegisterIntermediatePageState();
}

class _RegisterIntermediatePageState extends State<RegisterIntermediatePage> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();

    super.dispose();
  }

  void onNext(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      final registerIntermediatePageBloc =
          context.read<RegisterIntermediatePageBloc>();
      context.pushNamed(
        AppRoutesPaths.registerRouter,
        extra: RegisterPageArgs(
          name: _nameController.text.trim(),
          group: registerIntermediatePageBloc.state.group!,
          department: registerIntermediatePageBloc.state.department!,
        ),
      );
    }
  }

  void onUpdateData(
    BuildContext context, {
    Group? group,
    Department? department,
  }) {
    context.read<RegisterIntermediatePageBloc>().add(
          RegisterIntermediatePageEvent.updateData(
            group: group,
            department: department,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);
    final textTheme = AppTextTheme.of(context);

    return MultiBlocProvider(
      providers: [
        BlocProvider<RegisterIntermediatePageBloc>.value(
          value:
              widget.registerIntermediatePageArgs.registerIntermediatePageBloc,
        ),
      ],
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
        body: BlocBuilder<RegisterIntermediatePageBloc,
            RegisterIntermediatePageState>(
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
                          CustomTextField(
                            controller: _nameController,
                            labelText: 'Full Name',
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your name';
                              }
                              return null;
                            },
                          ),
                          const Gap(16.0),
                          Row(
                            children: [
                              Text(
                                'Group',
                                style: textTheme.medium18
                                    .copyWith(color: colorScheme.secondary),
                              ),
                              Gap(12.0),
                              Expanded(
                                child: DropdownButton<Group>(
                                  isExpanded: true,
                                  value: state.group,
                                  items: state.groups
                                      .map(
                                        (e) => DropdownMenuItem<Group>(
                                          value: e,
                                          child: Text(
                                            e.name,
                                            style: textTheme.medium18.copyWith(
                                              color: colorScheme.secondary
                                                  .withValues(
                                                alpha: 0.4,
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                      .toList(),
                                  onChanged: (value) => onUpdateData(
                                    context,
                                    group: value,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'Department',
                                style: textTheme.medium18.copyWith(
                                  color: colorScheme.secondary,
                                ),
                              ),
                              Gap(12.0),
                              Expanded(
                                child: DropdownButton<Department>(
                                  value: state.department,
                                  isExpanded: true,
                                  items: state.departments
                                      .map(
                                        (e) => DropdownMenuItem<Department>(
                                          value: e,
                                          child: Text(
                                            e.name,
                                            style: textTheme.medium18.copyWith(
                                              color: colorScheme.secondary
                                                  .withValues(
                                                alpha: 0.4,
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                      .toList(),
                                  onChanged: (value) => onUpdateData(
                                    context,
                                    department: value,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          // CustomTextField(
                          //   controller: _emailController,
                          //   labelText: 'Email',
                          //   keyboardType: TextInputType.emailAddress,
                          //   validator: (value) {
                          //     if (value == null || value.isEmpty) {
                          //       return 'Please enter your email';
                          //     }
                          //     if (!value.contains('@')) {
                          //       return 'Please enter a valid email';
                          //     }
                          //     return null;
                          //   },
                          // ),
                          // const Gap(16.0),
                          // CustomTextField(
                          //   controller: _passwordController,
                          //   labelText: 'Password',
                          //   obscureText: true,
                          //   validator: (value) {
                          //     if (value == null || value.isEmpty) {
                          //       return 'Please enter a password';
                          //     }
                          //     if (value.length < 6) {
                          //       return 'Password must be at least 6 characters';
                          //     }
                          //     return null;
                          //   },
                          // ),
                          // const Gap(16.0),
                          // CustomTextField(
                          //   controller: _confirmPasswordController,
                          //   labelText: 'Confirm Password',
                          //   obscureText: true,
                          //   validator: (value) {
                          //     if (value == null || value.isEmpty) {
                          //       return 'Please confirm your password';
                          //     }
                          //     if (value != _passwordController.text) {
                          //       return 'Passwords do not match';
                          //     }
                          //     return null;
                          //   },
                          // ),
                          // const Gap(24.0),
                          // if (state.status == RegisterStatus.error)
                          //   ErrorMessageWidget(
                          //     message: state.errorMessage,
                          //   ),
                          const Gap(24.0),
                          ActionBtn(
                            onPressed: () => onNext(
                              context,
                            ),
                            text: 'NEXT',
                          ),
                          const Gap(16),
                        ],
                      ),
                    ),
                  ),
                ),
                if (state.status == RegisterIntermediatePageStatus.loading) LoadingWidget(),
              ],
            );
          },
        ),
      ),
    );
  }
}
