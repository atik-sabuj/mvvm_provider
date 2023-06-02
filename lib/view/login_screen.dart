import 'package:flutter/material.dart';
import 'package:mvvm_provider/utils/utils.dart';
import 'package:mvvm_provider/view/home_screen.dart';
import '../utils/routes/routes_name.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Screen'),
      ),
      body: Center(
        child: InkWell(
          onTap: (){
            Utils.toastMessage('No Internet Connection');
          },
          child: Text('Click')),
      ),
    );
  }
}
