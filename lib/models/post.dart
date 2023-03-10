import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String description;
  final String uid;
  final String username;
  final String postId;
  final String postUrl;
  final String profilePic;
  final List likes;
  final dynamic createdAt;

  const Post({
    required this.description,
    required this.uid,
    required this.username,
    required this.postId,
    required this.postUrl,
    required this.profilePic,
    required this.likes,
    required this.createdAt
  });

  Map<String, dynamic> toJson() => {
    "description": description,
    "uid": uid,
    "username": username,
    "postId": postId,
    "postUrl": postUrl,
    "profilePic": profilePic,
    "likes": likes,
    "createdAt": createdAt,
  };

  static Post fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Post (
      description: snapshot["description"],
      uid: snapshot["uid"],
      username: snapshot["username"],
      postId: snapshot["postId"],
      postUrl: snapshot["postUrl"],
      profilePic: snapshot["profilePic"],
      likes: snapshot["likes"],
      createdAt: snapshot["createdAt"],
    );
  }
}