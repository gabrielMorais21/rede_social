import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rede_social/api.dart';
import 'package:rede_social/comments.dart';
import 'package:rede_social/user.dart';



// 
void main() => runApp(MyApp());



class MyApp extends StatelessWidget{
  @override
  Widget build(context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'RobotoMono'),
      debugShowCheckedModeBanner: false,
      title: "Rede Social",
      home: BuildListView(),
    );
  }
}

class BuildListView extends StatefulWidget {

  @override
  _BuildListViewState createState() => _BuildListViewState();
}

class _BuildListViewState extends State<BuildListView> {
  var users = new List<User>();

  _getUsers(){
      API.getUsers().then((response){
          setState(() {
          Iterable list = json.decode(response.body);
          users = list.map((model) => User.fromJson(model)).toList();
          });
        });
    }


  _BuildListViewState(){
    _getUsers();
  
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.black,
        title: Text('Rede Social', style: TextStyle(color: Colors.white, fontFamily: 'Schyler')),

        ),
        
        body: listUser(),
    );
  }

  listUser(){
  return ListView.builder(
    itemCount: users.length,
    itemBuilder: (context, index){
      return new Padding(
        
        padding: new EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: new Card(
        
          elevation: 6.0,
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(16.0),
          ),
          child: new Column(  
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          
            children: <Widget>[
              new Padding(
              
                padding:
                
                  new  EdgeInsets.all(10.0),
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new SizedBox(height: 8.0),
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                      new Container(
                          height: 35.0, 
                          width: 35.0,
                            decoration: new BoxDecoration(
                              shape: BoxShape.circle,
                              image: new DecorationImage(
                                  fit: BoxFit.fill,
                                  image: new NetworkImage(users[index].person["profilePhotoUri"]),
                                  
                              )),
                          ),
                      new Text('   '),
                      new Text(
                      users[index].person['name'],
                      style: TextStyle(fontSize: 18.0, fontFamily: 'Raleway'),
                      ),
                    
                        ],
                      ),
                    ],
                  ),
                ),


              new ClipRRect(
                child:new Image.network(users[index].photoUri),
                borderRadius: BorderRadius.only(
                  topLeft: new Radius.circular(16.0),
                  topRight: new Radius.circular(16.0)
                ),

              ),


              new Padding(
                padding:
                  new  EdgeInsets.all(16.0),
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new SizedBox(height: 16.0),
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          new Text("Curtido por ${users[index].likes.toString()} pessoas"), 
                          RaisedButton(
                            onPressed: (){
                            Navigator.push(
                                context, MaterialPageRoute(
                                builder:(context) => comments(onSuccess: users[index],)));
                     
                          },
                          child:Text("${users[index].comments.length.toString()} comentarios"), 
                          color:Colors.white,
                          textColor: Colors.black,
                          
                          )
                        ],
                      ),
                    ],
                  ),
                )
            ],
          ),
        ),
        );
    }
    );
}
}
