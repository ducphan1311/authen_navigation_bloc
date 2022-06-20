import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth_navigation_state.dart';

class AuthNavigtionBloc extends Cubit<AuthNavigationState> {
  AuthNavigtionBloc() : super(AuthNavigationState.initial());

  void setState({required AuthNavigationState state}) {
    emit(state);
  }

  void setAuthoried({required bool isAuthoried}) {
    emit(state.copyWith(
        status: isAuthoried
            ? AuthNavigationStatus.authorized
            : AuthNavigationStatus.unAuthorized));
  }
}
