import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String email;
  final String uid;
  final String profilePic;
  final String username;
  final String bio;
  final List followers;
  final List following;

  const User({
    required this.email,
    required this.uid,
    required this.profilePic,
    required this.username,
    required this.bio,
    required this.followers,
    required this.following
  });

  Map<String, dynamic> toJson() => {
    "username": username,
    "uid": uid,
    "email": email,
    "profilePic": profilePic,
    "bio": bio,
    "followers": followers,
    "following": following,
  };

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return User (
      username: snapshot["username"],
      uid: snapshot["uid"],
      email: snapshot["email"],
      profilePic: snapshot["profilePic"],
      bio: snapshot["bio"],
      followers: snapshot["followers"],
      following: snapshot["following"],
    );
  }
}