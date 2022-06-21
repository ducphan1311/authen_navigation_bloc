import 'package:authen_navigation_bloc/bloc/auth_navigation_bloc.dart';
import 'package:authen_navigation_bloc/navigator/auth_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class SplashPage extends StatefulWidget {
  const SplashPage({Key? key, required this.initializeApp}) : super(key: key);

  final InitializeApp initializeApp;

}

abstract class SplashPageState<W extends SplashPage> extends State<W> {

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    widget.initializeApp(context).then((state) {
      if(mounted) {
        context.read<AuthNavigationBloc>().setState(state: state);
      }
    });
  }
}
