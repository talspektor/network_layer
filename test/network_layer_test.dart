import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_layer/failure.dart';
import 'package:network_layer/http_session.dart';
import 'package:network_layer/result.dart';

import 'post_request.dart';
import 'post_response.dart';

void main() {
  test('', () async {
    final postRequest = PostRequest('1');

    final session = HttpSession(Dio());

    final postList = PostList.empty();
    final post = PostResponse.empty();

    try {
      final response = await session.request<PostList>(
          httpRequest: postRequest, responseType: postList);
      switch (response.resultEnum) {
        case ResultEnum.success:
          final PostList posts = response.resultEnum.value<PostList>(response);
          // final posts = response.success!.list;
          print(posts.list);
          break;
        case ResultEnum.failure:
          final Failure failure = response.resultEnum.value<PostList>(response);
          print(failure.message);
          break;
      }
    } catch (e) {
      print(e);
    }
  });
}
