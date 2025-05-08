import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../model/user/user.dart';

part 'settings_event.dart';

part 'settings_state.dart';

part 'settings_bloc.freezed.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc(User user)
      : super(
          SettingsState(
            user: user,
          ),
        ) {
    on<_Update>(update);
  }
  void update(event, emit) {

  }
}
