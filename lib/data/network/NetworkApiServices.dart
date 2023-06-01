
import 'dart:io';
import 'package:mvvm_provider/data/app_exceptions.dart';
import 'package:mvvm_provider/data/network/BaseApiServices.dart';
import 'package:http/http.dart' as http;

class NetworkApiService extends BaseApiServices {

  @override
  Future getGetApiResponse(String url) async {

    try {
      final response = await http.get(Uri.parse(uri)).timeout(Duration(seconds: 10));
    }on SocketException {

      throw FetchDataException('No Internet Connection');
    }

  }

  @override
  Future getPostApiResponse(String url) {
    // TODO: implement getPostApiResponse
    throw UnimplementedError();
  }

}