class PostResponse {
  int id;
  String title;
  String body;
  int userId;

  PostResponse({
    required this.id,
    required this.title,
    required this.body,
    required this.userId,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'title': this.title,
      'body': this.body,
      'userId': this.userId,
    };
  }

  factory PostResponse.fromMap(Map<String, dynamic> map) {
    return PostResponse(
      id: 0,
      title: "",
      body: "",
      userId: 0
    );
  }
}
