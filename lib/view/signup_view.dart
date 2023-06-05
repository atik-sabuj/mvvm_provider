import 'package:flutter/material.dart';
import 'package:mvvm_provider/res/components/round_button.dart';
import 'package:mvvm_provider/utils/routes/routes_name.dart';
import 'package:mvvm_provider/utils/utils.dart';
import 'package:mvvm_provider/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {

    ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);

    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();

    FocusNode emailFocusNode = FocusNode();
    FocusNode passwordFocusNode = FocusNode();

    @override
    void dispose() {
      // TODO: implement dispose
      super.dispose();

      _emailController.dispose();
      _passwordController.dispose();

      emailFocusNode.dispose();
      passwordFocusNode.dispose();

      _obsecurePassword.dispose();

    }

    @override
    Widget build(BuildContext context) {

      final authViewModel = Provider.of<AuthViewModel>(context);

      final height = MediaQuery.of(context).size.height * 1;

      return Scaffold(
        appBar: AppBar(
          title: Text('Sign Up'),
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
                title: 'SignUp',
                loading: authViewModel.signUpLoading,
                onPress: (){
                  if(_emailController.text.isEmpty){
                    Utils.flushBarErrorMessage('Please Enter Valid Email', context);
                    //Utils.snackBar('Please Enter Valid Email', context);
                    //Utils.toastMessage('Please Enter Valid Email');

                  }else if(_passwordController.text.isEmpty){
                    Utils.flushBarErrorMessage('Please Enter Correct Password', context);

                  }else if(_passwordController.text.length < 6){
                    Utils.flushBarErrorMessage('Please Enter 6 Digit Password', context);

                  }else {
                    Map data = {
                      'email' : _emailController.text.toString(),
                      'password' : _passwordController.text.toString(),
                    };

                    authViewModel.signUpApi(data, context);
                    print('Api Hit');
                  }
                },
              ),
              SizedBox(height: height * .02,),
              InkWell(
                onTap: (){
                  Navigator.pushNamed(context, RoutesName.login);
                },
                  child: Text("Already Have an Account? Log In"))
            ],
          ),
        ),
      );
    }
  }

