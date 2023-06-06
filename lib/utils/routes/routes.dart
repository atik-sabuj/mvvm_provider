
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_provider/utils/routes/routes_name.dart';
import 'package:mvvm_provider/view/home_screen.dart';
import 'package:mvvm_provider/view/login_view.dart';
import 'package:mvvm_provider/view/signup_view.dart';
import 'package:mvvm_provider/view/splash_view.dart';

class Routes {

  static Route<dynamic> generateRoute(RouteSettings settings){
    final arguments = settings.arguments;

    switch(settings.name){
      case RoutesName.splash:
        return MaterialPageRoute(builder: (BuildContext context) => const SplashView());

      case RoutesName.home:
        return MaterialPageRoute(builder: (BuildContext context) => const HomeScreen());

        case RoutesName.login:
            return MaterialPageRoute(builder: (BuildContext context) => const LoginView());

      case RoutesName.signup:
        return MaterialPageRoute(builder: (BuildContext context) => const SignUpView());
      default:
        return MaterialPageRoute(builder: (_){
          return Scaffold(
            body: Center(
              child: Text('No Route Defined'),
            ),
          );
        });
    }
  }
}