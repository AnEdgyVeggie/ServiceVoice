import 'package:flutter/material.dart';
import 'package:service_voice/constants/fonts.dart';
import 'package:service_voice/database/database_handler.dart';
import '/components/bottom-nav-bar.dart';
import '/classes/post.dart';
import '/classes/user.dart';

class CreatePost extends StatefulWidget{

  final User? loggedInAs;

  CreatePost({ super.key, required this.loggedInAs });


  @override
  State<CreatePost> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePost> {

  TextEditingController postControl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return
     Scaffold(
      appBar: AppBar(
        title: const Text('Create A Post',
          style: appBartitle,
        ),
      ),
      body: ListView(
          children:  <Widget>[
            const Padding(
              padding: EdgeInsets.only(top: 15.0, left: 20),
              child: Text("What's on your mind?",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 24
              )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
              child: TextField(
                controller: postControl,
                decoration: const  InputDecoration(
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Start typing here.',
                  hintStyle: TextStyle(
                    color: Colors.grey
                  )
                ),
                minLines: 15, 
                maxLines: 30,
                style: TextStyle(color: Colors.black),
              ),
            ),
            Padding(
              padding: EdgeInsets.zero,
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (postControl.text.isEmpty){
                      return;
                    } 
                    String userID = widget.loggedInAs!.userid!;
                    String postBody = postControl.text;

    
                    Post newPost = Post(id: "", body: postBody, userID: userID, likes: 0, comments: [], postDate: DateTime.now());
                    if (DatabaseHandler.addPost(newPost, userID)) {
                      postControl.text = "";
                    }

                  },
                  child: const Text('Post',
                  )
                ),
              ),
            )
          ],
      ),



      bottomNavigationBar: BottomNavBar(),
    );
  }
}