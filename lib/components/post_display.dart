import 'package:flutter/material.dart';
import '/classes/post.dart';

class PostDisplay extends StatefulWidget {

   final Post post;
   final String username;

  const PostDisplay({ super.key, required this.post, required this.username });

  @override
  State<PostDisplay> createState() => _PostDisplayState();

}

class _PostDisplayState extends State<PostDisplay> {
  

  @override
  Widget build(BuildContext context) {

    DateTime pdate = widget.post.postDate.toDate();

    Map<int, String> months = 
    {
      1: 'January',
      2: 'February',
      3: 'March',
      4: 'April',
      5: 'May',
      6: 'June',
      7: 'July',
      8: 'August',
      9: 'September',
      10: 'October',
      11: 'November',
      12: 'December',
    };
    
    String? month = months[pdate.month];

    return 
     Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.username,
              style: const TextStyle(
                fontSize: 15,

              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 40),
            child: Text(widget.post.body),
          ),
          
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              
              child: Text(
              '$month ${pdate.day}, ${pdate.hour}:${pdate.minute}',
              textAlign: TextAlign.end,
              style: const TextStyle(
                        fontSize: 10
              ),
            
            ),
            
            ),
          )

        ],
      )
    );
  }

// String getMonth() {

// }

}