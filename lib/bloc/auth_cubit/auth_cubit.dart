import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/repositories/base_repository.dart';
import '../../../data/repositories/user_repository.dart';
import '../../../model/user/user.dart';
import '../../data/repositories/notification_repository.dart';
import '../notification_bloc/notification_bloc.dart';

part 'auth_state.dart';

part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState> {
  final BaseRepository _baseRepository = BaseRepository.instance;
  final UserRepository _userRepo = UserRepository.instance;

  final NotificationBloc _notificationBloc;

  AuthCubit(
    this._notificationBloc,
  ) : super(const AuthState());

  Future<User?> getUser() async {
    try {
      emit(
        state.copyWith(
          status: AuthStatus.loading,
        ),
      );
      final user = await _userRepo.me();
      emit(
        state.copyWith(
          status: AuthStatus.initial,
          user: user,
        ),
      );
      return user;
    } catch (e) {
      emit(
        state.copyWith(
          status: AuthStatus.error,
          errorMessage: e.toString(),
        ),
      );
      return null;
    }
  }

  /// When authorization complete let know about it the  server
  /// and then register token if it didn't register yet.
  void updateUser(User user) {
    _notificationBloc.add(
      NotificationEvent.saveToken(),
    );
    emit(
      state.copyWith(
        user: user,
      ),
    );
  }

  Future<void> logOut() async {
    await _baseRepository.deleteToken();

    emit(
      state.copyWith(
        user: null,
      ),
    );
  }
}
