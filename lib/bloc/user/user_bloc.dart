import 'package:to_do_list_flutter/bloc/user/user_event.dart';
import 'package:to_do_list_flutter/bloc/user/user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc()
      : super(const UserState(
            id: 0, firstname: '', lastname: '', identifiant: '')) {
    on<UserConnected>(_onUserConnected);
  }

  _onUserConnected(UserConnected event, Emitter<UserState> emit) {
    print('on user connected');
    print('event ${event.firstname}');

    emit(
      UserState(
        id: event.id,
        firstname: event.firstname,
        lastname: event.lastname,
        identifiant: event.identifiant,
      ),
    );
    print('UserState');
    print(UserState);
  }
}
