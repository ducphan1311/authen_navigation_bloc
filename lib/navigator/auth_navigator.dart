import 'package:authen_navigation_bloc/bloc/auth_navigation_bloc.dart';
import 'package:authen_navigation_bloc/bloc/auth_navigation_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthNavigator extends StatefulWidget {
  const AuthNavigator({
    Key? key,
    required this.splashPage,
    required this.unAuthorized,
    required this.authorized,
    this.guestMode,
  }) : super(key: key);
  final Widget splashPage;
  final WidgetBuilder unAuthorized;
  final WidgetBuilder authorized;
  final WidgetBuilder? guestMode;

  @override
  State<AuthNavigator> createState() => _AuthNavigatorState();
}

class _AuthNavigatorState extends State<AuthNavigator> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthNavigtionBloc, AuthNavigationState>(
      builder: (context, state) {
        switch (state.status) {
          case AuthNavigationStatus.loadConfig:
            return widget.splashPage;
          case AuthNavigationStatus.unAuthorized:
            return widget.unAuthorized(context);
          case AuthNavigationStatus.authorized:
            return widget.authorized(context);
          case AuthNavigationStatus.guestMode:
            return widget.guestMode != null
                ? widget.guestMode!(context)
                : Container();
          default:
            return Container();
        }
      },
      buildWhen: (oldState, currentState) {
        return oldState.status != currentState.status;
      },
    );
  }
}
