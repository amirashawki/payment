import 'package:dio/dio.dart';

class ApiServices {
  Dio dio = Dio();
  Future post({
    required String url,
    required body,
    required token,
    String? contentType,
    Map<String, dynamic>? headers,
  }) async {
    var response = await dio.post(
      url,
      data: body,
      options: Options(
        headers: headers ?? {'Authorization': 'Bearer $token'},
        contentType: contentType,
      ),
    );
    return response;
  }
}
