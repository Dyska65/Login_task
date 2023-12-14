import 'package:dio/dio.dart';

class ApiManager {
  Future<String?> sendContact({
    required String name,
    required String email,
    required String message,
  }) async {
    final response = await Dio().post('https://api.byteplex.info/api/test/contact/', data: {
      "name": name,
      "email": email,
      "message": message,
    });

    if (response.statusCode != 201) {
      return "Error send request";
    }
    return null;
  }
}
