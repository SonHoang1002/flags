import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:bloc_project_1/models/post_model.dart';

class DataService {
  final url = "jsonplaceholder.typicode.com";
  Future<List<Post>> getPosts() async {
    try {
      final uri = Uri.https(url, "/posts");
      final response = await http.get(uri);
      // print("response: $response");
      final json = jsonDecode(response.body) as List;
      final post = json.map((child) => Post.fromJson(child)).toList();
      // print("post:$post");
      return post;
    } catch (e) {
      throw (e);
    }
  }
}
