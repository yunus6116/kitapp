import 'package:dio/dio.dart';

extension DioErrorExtensions on DioError{
  String get errorMessage{
    final responseData = response?.data;
    if(responseData != null){
      return "${responseData["message"]}";
    }
    return "Something went wrong";
  }
}