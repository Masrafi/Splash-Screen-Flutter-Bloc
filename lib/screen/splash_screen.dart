import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splashbloc/bloc/splash_bloc.dart';
import 'package:splashbloc/bloc/splash_event.dart';
import 'package:splashbloc/bloc/splash_state.dart';
import 'package:splashbloc/screen/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<SplashBloc>(context).add(SetSplash());
    return Scaffold(
      body: BlocConsumer<SplashBloc, SplashState>(
        listener: (context, state) {
          if (state is SplashLoadedState) {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => HomeScreen()));
          }
        },
        builder: (context, state) {
          if (state is SplashLoadingState) {
            return Center(
              child: Image.asset('assets/webytor.png'),
            );
          }
          return Container();
        },
      ),
    );
  }
}
