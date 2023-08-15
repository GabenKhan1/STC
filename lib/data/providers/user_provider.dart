import 'dart:developer';
import 'package:dio/dio.dart';
import '../../core/api_url.dart';
import '../models/signin_model.dart';

class UserProvider {
  final dio = Dio();

  Future<dynamic> signInCall(
      {required String username, required String password}) async {
    try {
      final response = await dio.post(ApiUrl.userloginUrl,
          options: Options(headers: <String, dynamic>{
            "Content-Type": "application/json; Charset=UTF-8 ",
            "Authorization": "Bearer  ",
          }),
          data: {
            "username": username,
            "password": password,
          });
      if (response.statusCode == 200) {
        return SignInModel.fromJson(response.data);
      } else {
        return response.data["message"];
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        return "username or password is incorrect";
      } else {
        log(e.response.toString());
        rethrow;
      }
    }
  }

  getProducts() async {
    try {
      final response = await dio.get(
        ApiUrl.getProducts,
        options: Options(headers: <String, dynamic>{
          "Content-Type": "application/json; Charset=UTF-8 ",
          "Authorization": "Bearer  ",
        }),
      );
      if (response.statusCode == 200) {
        //log(response.data.toString());
        return response.data;
      } else {
        return [];
      }
    } on DioException catch (e) {
      log(e.response.toString());
      rethrow;
    }
  }
}
