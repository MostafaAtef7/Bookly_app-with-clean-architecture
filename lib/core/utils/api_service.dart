import 'package:dio/dio.dart';

class ApiService {
  final String _baseUrl = "https://www.googleapis.com/books/v1/";
  final Dio _dio = Dio();

  Future<Map<String, dynamic>> get({required url}) async {
    Response response = await _dio.get("$_baseUrl$url");
    return response.data;
  }
}
