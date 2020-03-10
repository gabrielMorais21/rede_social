class User{
  int postId;
  int personId;
  dynamic created;
  String photoUri;
  int likes;
  dynamic person;
  dynamic comments;


  User(postId, personId, created, photoUri, likes, person, comments){
    this.postId = postId;
    this.personId = personId;
    this.created = created;
    this.photoUri = photoUri;
    this.likes = likes;
    this.person = person;
    this.comments = comments;
  }

  User.fromJson(Map json)
          : postId = json['postId'],
            personId = json['personId'],
            created = json['created'],
            photoUri = json['photoUri'],
            likes = json['likes'],
            person = json['person'],
            comments = json['comments'];

}