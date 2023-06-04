
import 'package:flutter/cupertino.dart';
import 'package:mvvm_provider/respository/auth_repository.dart';

class AuthViewModel with ChangeNotifier {

  final _myRepo = AuthRepository();

  Future<void> loginApi(dynamic data, BuildContext context) async {

    _myRepo.loginApi(data).then((value){

    }).onError((error, stackTrace) {

    });
  }

}