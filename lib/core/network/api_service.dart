import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;
  final String baseUrl = "https://api.jikan.moe/v4/";

  ApiService({required this.dio});

  get({required String endPoint}) async {
    var response = await dio.get("$baseUrl$endPoint");
    return response.data;
  }
}
