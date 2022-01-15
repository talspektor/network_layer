import 'package:network_layer/network_decodable.dart';

class PostList extends ListDicodable {
  late final List<PostResponse> posts;

  @override
  Decodable fromJsonList(List json) {
    posts = json.map((e) => PostResponse.fromJson(e)).toList();
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
