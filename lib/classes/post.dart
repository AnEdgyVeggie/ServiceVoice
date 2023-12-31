class Post {

  late String id;
  late String userID;
  late String body;
  late int likes;
  List<String> comments = [];

  Post ({ required this.id, 
  required this.userID, 
  required this.body,
  required this.likes, 
  required comments });

  // factory Post.fromJson(Map<String, dynamic> json) => Post(
  //   id: json['id'],
  //   username: json['username'],
  //   body: json['body'],
  //   likes: json['likes']
  // );

  Map<String, dynamic> toJson() => {
    'id': id,
    'userID': userID,
    'body': body,
    'likes': likes,
    'comments': comments,
  };

  @override
  String toString() {
    return 'ID: ${id.toString()} \nUSER: $userID \n BODY: $body \nLIKES: ${likes.toString()}';
  }

  setId(String newId) {
    id = newId;
  }
}