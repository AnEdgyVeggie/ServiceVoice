import 'package:cloud_firestore/cloud_firestore.dart';
import '/classes/user.dart';
import '/classes/post.dart';

class DatabaseHandler {

  static var db = FirebaseFirestore.instance;


  ///////////////////////////////////////////////////////////////////////////////////////////
  // USER FUNCTIONS ////////////////////////////////////////////////////////////////////////
  /////////////////////////////////////////////////////////////////////////////////////////

  static addUser(User newUser) {
    db.collection("users").add(newUser.toJson());
  }

  static Future<List<User>?> getUsers() async {
    List<User> users = [];

    await db.collection('users').get().then((event) {
      for (var doc in event.docs) {
        String id = doc.id;
        User newuser = User(
          userid: id,
          email: doc.data()['email'], 
          username: doc.data()['username'],
          firstName: doc.data()['first_name'],
          lastName: doc.data()['last_name'],
          phoneNumber: doc.data()['phone'],
          password: doc.data()['password'],
          friends: doc.data()['friends'],
          posts: doc.data()['posts_id']
        );
        newuser.setID(id);
        users.add(newuser);
      }

    });
    return users;
  }

  static Future<User?> getSingleUser(String userID) async {
    List<User>? users = await getUsers();
    if (users == null ){
      return null;      
    }

    for( User user in users) {
      if (userID == user.userid) {
        // print('IN SINGLE USER DB: ${user.toString()}');
        return user;
      }
    }
    return null;
  }


  ///////////////////////////////////////////////////////////////////////////////////////////
  // POST FUNCTIONS ////////////////////////////////////////////////////////////////////////
  /////////////////////////////////////////////////////////////////////////////////////////


  static bool addPost(Post newPost, String userID) {

    db.collection("posts").add(newPost.toJson()).then((DocumentReference doc) => 
    // updates users database to link posts to users
    FirebaseFirestore.instance.collection("users").doc(userID).update(
      {"posts_id": FieldValue.arrayUnion([doc.id])}));

    return true;
  }

  static Future<List<Post>> getPostsForDisplay(String? userID) async {
 
    List<Post> posts = [];
    if (userID == null) return posts;

    List<dynamic> ids = [];



    await db.collection('users').doc(userID).get().then((event) {
      ids = event['friends'];
    });
    ids.add(userID);
    print('FRIENDS $ids');

    await db.collection('posts').get().then((event) {
        for (var id in ids){
      for (var doc in event.docs) {
        if (doc.data()['user_id'] == id) {
          String postID = doc.id;
          Post newPost = Post(
            id: postID,
            body: doc.data()['body'],
            userID: doc.data()['user_id'],
            username: doc.data()['username'],
            comments: doc.data()['comments'],
            likes: doc.data()['likes'],
            postDate: doc.data()['post_date']
          );
          newPost.setId(postID);
          posts.add(newPost);
        }
        }
      }
    });
    posts.sort((a,b) => a.postDate.compareTo(b.postDate)); 
    return posts;
  }  













} // END OF CLASS


