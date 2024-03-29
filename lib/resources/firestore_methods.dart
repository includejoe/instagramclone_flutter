import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram_clone/models/post.dart';
import 'package:instagram_clone/resources/storage_methods.dart';
import 'package:uuid/uuid.dart';

class FirestoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> uploadPost(
      String description,
      Uint8List image,
      String uid,
      String username,
      String profilePic
  ) async {
    String response = "An unexpected error occurred";
    try {
      String photoUrl = await StorageMethods().uploadImageToStorage(
          "posts",
          image,
          true
      );

      String postId = const Uuid().v1();

      Post post = Post(
        description: description,
        uid: uid,
        username: username,
        postId: postId,
        createdAt: DateTime.now(),
        postUrl: photoUrl,
        profilePic: profilePic,
        likes: []
      );

      _firestore.collection("posts").doc(postId).set(post.toJson());

      response = "success";
    } catch(e) {
      response = e.toString();
    }

    return response;
  }
}