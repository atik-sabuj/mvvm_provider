
import 'package:mvvm_provider/model/user_model.dart';
import 'package:mvvm_provider/view_model/user_view_model.dart';

class SplashServices {

  Future<UserModel> getUserData() => UserViewModel().getUser();
}