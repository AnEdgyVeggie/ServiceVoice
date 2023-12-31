import 'package:cloud_firestore/cloud_firestore.dart';
import '/classes/user.dart';
import '/classes/post.dart';

class DatabaseHandler {

  static var db = FirebaseFirestore.instance;
  ///////////////////////////////////////////////////////////////////////////////////////////
  // USER FUNCTIONS ////////////////////////////////////////////////////////////////////////
  /////////////////////////////////////////////////////////////////////////////////////////

  addUser(User newUser) {
    db.collection("users").add(newUser.toJson()).then((DocumentReference doc) =>
    print('DocumentSnapshot added with ID: ${doc.id}'));
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
        );
        newuser.setID(id);
        users.add(newuser);
      }

    });
    return users;
  }

  static Future<User?> getSingleUser(User singleUser) async {
    List<User>? users = await getUsers();
    if (users == null ){
      return null;      
    }

    for( User user in users) {
      if (singleUser.userid == user.userid) {
        // print('IN SINGLE USER DB: ${user.toString()}');
        return user;
      }
    }
    return null;
  }


  // addUser(User newUser) {
  //   db.collection("users").add(newUser.toJson()).then((DocumentReference doc) =>
  //   print('DocumentSnapshot added with ID: ${doc.id}'));
  // }



  ///////////////////////////////////////////////////////////////////////////////////////////
  // POST FUNCTIONS ////////////////////////////////////////////////////////////////////////
  /////////////////////////////////////////////////////////////////////////////////////////


  static addPost(Post newPost) {
    db.collection("posts").add(newPost.toJson()).then((DocumentReference doc) =>
    print('DocumentSnapshot added with ID: ${doc.id}'));
  }

  













} // END OF CLASS


