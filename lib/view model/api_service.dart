import 'package:dio/dio.dart';

class ApiService {
  final _baseURL = "https://mvmwebapp-freph8bvg6euapa3.uaenorth-01.azurewebsites.net/api/";
  final Dio _dio;
  ApiService(this._dio);
  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await _dio.get("$_baseURL$endPoint");
    return response.data;
  }
  Future<Map<String, dynamic>> post({required String endPoint, required Map<String, dynamic> data}) async {
    var response = await _dio.post("$_baseURL$endPoint", data: data);
    return response.data;
  }
  Future<Map<String, dynamic>> put({required String endPoint, required Map<String, dynamic> data}) async {
    var response = await _dio.put("$_baseURL$endPoint", data: data);
    return response.data;
  }
  Future<Map<String, dynamic>> delete({required String endPoint}) async {
    var response = await _dio.delete("$_baseURL$endPoint");
    return response.data;
  }
}

