import 'package:flutter/material.dart';
import 'package:mvvm_provider/res/components/round_button.dart';
import 'package:mvvm_provider/utils/utils.dart';
import 'package:mvvm_provider/view/home_screen.dart';
import '../utils/routes/routes_name.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;

    return Scaffold(
      appBar: AppBar(
        title: Text('Log In'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              focusNode: emailFocusNode,
              decoration: const InputDecoration(
                hintText: 'Email',
                labelText: 'Email',
                prefixIcon: Icon(Icons.alternate_email)
              ),
              onFieldSubmitted: (value){
                Utils.fieldFocusChange(context, emailFocusNode, passwordFocusNode);
              },
            ),

            ValueListenableBuilder(
                valueListenable: _obsecurePassword,
                builder: (context, value, child) {
                  return TextFormField(
                    controller: _passwordController,
                    obscureText: _obsecurePassword.value,
                    focusNode: passwordFocusNode,
                    obscuringCharacter: "*",
                    decoration: InputDecoration(
                      hintText: 'Password',
                      labelText: 'Password',
                      prefixIcon: Icon(Icons.lock_open_rounded),
                      suffixIcon: InkWell(
                          onTap: (){
                            _obsecurePassword.value = !_obsecurePassword.value;
                          },
                          child: Icon(
                              _obsecurePassword.value ? Icons.visibility_off_outlined :
                                  Icons.visibility
                          )),
                    ),
                  );
                }
            ),

            SizedBox(height: height * .085,),
            RoundButton(
              title: 'Login',
              onPress: (){
                if(_emailController.text.isEmpty){
                  Utils.flushBarErrorMessage('Please Enter Valid Email', context);

                }else if(_passwordController.text.isEmpty){
                  Utils.flushBarErrorMessage('Please Enter Correct Password', context);

                }else if(_passwordController.text.length < 6){
                  Utils.flushBarErrorMessage('Please Enter 6 Digit Password', context);

                }else {
                  print('Api Hit');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
