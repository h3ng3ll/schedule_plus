import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../bloc/auth_cubit/auth_cubit.dart';
import '../../../../../data/repositories/auth_repository.dart';

part 'login_event.dart';

part 'login_state.dart';

part 'login_bloc.freezed.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository _authRepository = AuthRepository.instance;
  final AuthCubit _authCubit;

  LoginBloc(
    this._authCubit,
  ) : super(LoginState()) {
    on<_Login>(login);
  }

  Future<void> login(event, emit) async {
    try {
      emit(
        state.copyWith(
          status: LoginStatus.loading,
        ),
      );
      final String email = event.email;
      final String password = event.password;
      final VoidCallback onCompleted = event.onCompleted;

      final user = await _authRepository.login(
        email,
        password,
      );

      emit(
        state.copyWith(
          status: LoginStatus.initial,
        ),
      );

      _authCubit.updateUser(
        user,
      );
      onCompleted();
    } on DioException catch (e) {
      emit(
        state.copyWith(
          status: LoginStatus.error,
          errorMessage: e.error?.toString() ?? '',
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: LoginStatus.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
