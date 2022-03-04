import 'package:network_layer/network_decodable.dart';

class PostList extends ListDecodeAble<PostResponse> {
  PostList.empty() : super.empty();
  List<PostResponse> _list = [];

  @override
  DecodeAble fromJsonList(List<dynamic> json) {
    _list = json.map((e) => PostResponse.fromJson(e)).toList();
    return this;
  }

  @override
  List<PostResponse> get list => _list;
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
