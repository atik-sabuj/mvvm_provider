import 'dart:convert';

import 'package:http/http.dart';
import 'package:mvvm_provider/data/network/BaseApiServices.dart';
import 'package:mvvm_provider/data/network/NetworkApiServices.dart';
import 'package:mvvm_provider/res/app_url.dart';

class AuthRepository {

  BaseApiServices _apiServices = NetworkApiService();


  Future<dynamic> loginApi(dynamic data)async{

    try{

      dynamic response = await _apiServices.getPostApiResponse(AppUrl.loginEndPoint, data);
      return response;

    }catch(e){
      throw e;
    }
  }

  Future<dynamic> signUpApi(dynamic data)async{

    try{

      dynamic response = await _apiServices.getPostApiResponse(AppUrl.registerApiEndPoint, data);
      return response;

    }catch(e){
      throw e;
    }
  }

}