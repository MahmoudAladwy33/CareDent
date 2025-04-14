import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/user_model.dart';

class UserState {
  final UserModel? user;
  final bool isLoading;

  UserState({this.user, this.isLoading = false});

  UserState copyWith({UserModel? user, bool? isLoading}) {
    return UserState(
      user: user ?? this.user,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserState());

  void setUser(UserModel user) {
    emit(state.copyWith(user: user));
    log('User set: ${user.name}');
  }

  void clearUser() {
    emit(UserState());
  }
}
