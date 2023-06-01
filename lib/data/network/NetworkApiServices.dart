
import 'dart:convert';
import 'dart:io';
import 'package:mvvm_provider/data/app_exceptions.dart';
import 'package:mvvm_provider/data/network/BaseApiServices.dart';
import 'package:http/http.dart' as http;

class NetworkApiService extends BaseApiServices {

  @override
  Future getGetApiResponse(String url) async {

    dynamic responseJson;
    try {
      final response = await http.get(Uri.parse(url)).timeout(Duration(seconds: 10));
    }on SocketException {

      throw FetchDataException('No Internet Connection');
    }

    return responseJson;

  }

  @override
  Future getPostApiResponse(String url) {
    // TODO: implement getPostApiResponse
    throw UnimplementedError();
  }

  dynamic returnResponse (http.Response response){

    switch(response.statusCode){
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
        default:
          throw FetchDataException('Error occurred while communication with server'+'with status code'+response.statusCode.toString());
    }
  }

}