
import 'package:flutter/material.dart';
import 'package:rede_social/user.dart';


class comments extends StatelessWidget {
final User onSuccess;
const comments({Key key, this.onSuccess}) : super(key: key);
  

  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
     
      appBar: AppBar(

        title: Text('Comentarios', style: TextStyle(color: Colors.white, fontFamily: 'Schyler')),
        backgroundColor: Colors.black, 
        	
        ),
      body: listComments(),
    );
  }

  listComments(){
    return ListView.builder(
    itemCount: this.onSuccess.comments.length,
    itemBuilder: (context, index){
        return ListTile(
          title: Text(this.onSuccess.comments[index]['person']['name']),
          subtitle: Text(this.onSuccess.comments[index]['text']),

          leading: Container(
            height: 35.0, 
            width: 35.0,
            decoration: new BoxDecoration(
              shape: BoxShape.circle,
              image: new DecorationImage(
                fit: BoxFit.fill,
                image: new NetworkImage(this.onSuccess.comments[index]['person']['profilePhotoUri'])
              )
            )
          ),
        );
    }
    );}
}

