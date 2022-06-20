import 'package:equatable/equatable.dart';

enum AuthNavigationStatus {
  loadConfig,
  unAuthorized,
  authorized,
  guestMode,
}

class AuthNavigationState extends Equatable {
  const AuthNavigationState._({
    this.status = AuthNavigationStatus.loadConfig,
    this.enableLoading = false,
    this.message = '',
    this.userName = '',
    this.password = '',
    this.token = '',
    this.accessToken = '',
  });

  const AuthNavigationState.initial() : this._();

  final AuthNavigationStatus status;
  final bool enableLoading;
  final String message;
  final String userName;
  final String password;
  final String token;
  final String accessToken;

  AuthNavigationState copyWith({
    AuthNavigationStatus? status,
    bool? enableLoading,
    String? message,
    String? userName,
    String? password,
    String? token,
    String? accessToken,
  }) =>
      AuthNavigationState._(
        status: status ?? this.status,
        enableLoading: enableLoading ?? this.enableLoading,
        message: message ?? this.message,
        userName: userName ?? this.userName,
        password: password ?? this.password,
        token: token ?? this.token,
        accessToken: accessToken ?? this.accessToken,
      );

  @override
  List<Object?> get props => [
        status,
        enableLoading,
        message,
        userName,
        password,
        token,
        accessToken,
      ];
}
