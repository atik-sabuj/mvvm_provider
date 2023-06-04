
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm_provider/respository/auth_repository.dart';
import 'package:mvvm_provider/utils/utils.dart';


class AuthViewModel with ChangeNotifier {

  final _myRepo = AuthRepository();

  Future<void> loginApi(dynamic data, BuildContext context) async {

    _myRepo.loginApi(data).then((value){
      if(kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      if(kDebugMode) {
        Utils.flushBarErrorMessage(error.toString(), context);
        print(error.toString());
      }
    });

  }

}