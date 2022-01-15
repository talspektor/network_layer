import 'package:network_layer/http_request.dart';
import 'package:network_layer/network_mappers.dart';

class PostRequest extends HttpRequest implements RequestMapable {
  final String userId;

  PostRequest(this.userId);

  @override
  String get baseUrl => 'https://jsonplaceholder.typicode.com';

  @override
  Map<String, dynamic>? get queryParameters => toJson();

  @override
  Map<String, dynamic> toJson() => {
        'userId': userId,
      };

  @override
  String get method => HttpMethod.get.value;

  @override
  String get path => '/posts';

  @override
  Map<String, String> get headers => {
        'content-type': 'application/x-www-fromurlencoded',
        'accept': 'application/json'
      };
}
