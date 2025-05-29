import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../bloc/auth_cubit/auth_cubit.dart';
import '../../../../../data/repositories/auth_repository.dart';
import '../../../../../services/notification_service/notification_service.dart';
import '../register_page.dart';

part 'register_event.dart';

part 'register_state.dart';

part 'register_bloc.freezed.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthRepository _authRepository = AuthRepository.instance;
  final AuthCubit _authCubit;

  final NotificationService _notificationService = NotificationService.instance;

  RegisterBloc(
    this._authCubit,
  ) : super(const RegisterState()) {
    on<_Register>(_register);
  }

  Future<void> _register(event, emit) async {
    try {
      emit(
        state.copyWith(
          status: RegisterStatus.loading,
        ),
      );
      final String email = event.email;
      final String password = event.password;
      final RegisterPageArgs registerPageArgs = event.registerPageArgs;

      final VoidCallback onCompleted = event.onCompleted;

      final user = await _authRepository.register(
        email,
        password,
        registerPageArgs.name,
        registerPageArgs.department.id,
        registerPageArgs.group.id,
      );

      await _notificationService.saveToken();
      emit(
        state.copyWith(
          status: RegisterStatus.initial,
        ),
      );
      _authCubit.updateUser(
        user,
      );
      onCompleted();
    } on DioException catch (e) {
      emit(
        state.copyWith(
          status: RegisterStatus.error,
          errorMessage: e.error?.toString() ?? '',
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: RegisterStatus.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
