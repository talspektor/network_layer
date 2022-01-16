import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_layer/http_session.dart';

import 'post_request.dart';
import 'post_response.dart';

void main() {
  test('', () async {
    final postRequest = PostRequest('1');

    final session = HttpSession(Dio());

    final postList = PostList();

    try {
      final response = await session.request<PostList>(
          httpRequest: postRequest, responseType: postList);

      print(response.list.toString());
    } catch (e) {
      print(e);
    }
  });
}
