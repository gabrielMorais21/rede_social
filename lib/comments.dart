
import 'package:flutter/material.dart';
import 'package:rede_social/user.dart';


class comments extends StatelessWidget {
final User onSuccess;
const comments({Key key, this.onSuccess}) : super(key: key);
  

  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(title: Text(this.onSuccess.postId.toString())),
      body: listComments(),
    );
  }

  listComments(){
    return ListView.builder(
    itemCount: this.onSuccess.comments.length,
    itemBuilder: (context, index){
       return ListTile(title: Text(this.onSuccess.comments[index]['text']),);
    },

    );}
}



