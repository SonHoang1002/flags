class Post {
  int userId;
  int id;
  String title;
  String body;
  Post(
      {required this.userId,
      required this.id,
      required this.title,
      required this.body});

  factory Post.fromJson(Map<String, dynamic> map) {
    return Post(
      userId: map["userId"],
      id: map["id"],
      title: map["title"],
      body: map["body"],
    );
  }
}
