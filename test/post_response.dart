import 'package:network_layer/network_decodable.dart';

class PostList implements ListDecodeAble<PostResponse> {
  @override
  late final List<PostResponse> list;

  @override
  DecodeAble fromJsonList(List json) {
    list = json.map((e) => PostResponse.fromJson(e)).toList();
    return this;
  }
}

class PostResponse {
  final int userId;
  final int id;
  final String title;
  final String body;

  PostResponse(
      {required this.userId,
      required this.id,
      required this.title,
      required this.body});

  factory PostResponse.fromJson(Map<String, dynamic> json) => PostResponse(
        userId: json['userId'],
        id: json['id'],
        title: json['title'],
        body: json['body'],
      );
}
