class Post {

  late String id;
  late String userID;
  late String body;
  late int likes;
  List<String> comments = [];
  DateTime postDate = DateTime.now();

  Post ({ 
    required this.id, 
    required this.userID, 
    required this.body,
    required this.likes, 
    required comments,
    required postDate
  });

  // factory Post.fromJson(Map<String, dynamic> json) => Post(
  //   id: json['id'],
  //   username: json['username'],
  //   body: json['body'],
  //   likes: json['likes']
  // );

  Map<String, dynamic> toJson() => {
    'id': id,
    'user_id': userID,
    'body': body,
    'likes': likes,
    'comments': comments,
    'post_date': postDate
  };

  @override
  String toString() {
    return 'ID: ${id.toString()} \nUSER: $userID \n BODY: $body \nLIKES: ${likes.toString()}';
  }

  setId(String newId) {
    id = newId;
  }
}