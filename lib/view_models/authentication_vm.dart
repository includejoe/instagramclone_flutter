import "dart:typed_data";
import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:instagram_clone/models/user.dart" as model;
import "package:instagram_clone/resources/storage_methods.dart";

class AuthenticationViewModel {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<model.User> getUserDetails() async {
    User currentUser = _auth.currentUser!;

    DocumentSnapshot snapshot = await _firestore
      .collection("users")
      .doc(currentUser.uid)
      .get();

    return model.User.fromSnap(snapshot);
  }

  // sign up user
  Future<String> registerUser({
    required String email,
    required String password,
    required String username,
    required String bio,
    Uint8List? image,
  }) async {
    String response = "Some error occurred";

    try {
      if(
        email.isNotEmpty ||
        password.isNotEmpty ||
        username.isNotEmpty ||
        bio.isNotEmpty ||
        image != null
      ) {
        UserCredential credentials = await _auth.createUserWithEmailAndPassword(
            email: email,
            password: password
        );

        String imageUrl = await StorageMethods().uploadImageToStorage("profilePics", image!, false);
        
        model.User user = model.User(
          email: email,
          uid: credentials.user!.uid,
          profilePic: imageUrl,
          username: username,
          bio: bio,
          followers: [],
          following: []
        );

        await _firestore.collection("users").doc(credentials.user!.uid).set(user.toJson());

        response = "success";
      }
    } on FirebaseAuthException catch(error) {
      if(error.code == "invalid-email") {
        response = "Your email is not a valid email";
      } else if(error.code == "weak-password") {
        response = "Your password must be 6 characters or more";
      }
    } catch(error) {
      response = error.toString();
    }
    return response;
  }

  Future<String> loginUser({
    required String email,
    required String password,
}) async {
    String response = "Some error occurred";

    try {
      if(email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(email: email, password: password);
        response = "success";
      }
    } on FirebaseAuthException catch(error) {
      if(error.code == "wrong-password") {
        response = "Invalid Credentials";
      } else if(error.code == "user-not-found") {
        response = "Invalid Credentials";
      }
    } catch (error) {
      response = error.toString();
    }

    return response;
  }

}