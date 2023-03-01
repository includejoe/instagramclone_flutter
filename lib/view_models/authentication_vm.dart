import "dart:typed_data";
import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_auth/firebase_auth.dart";

class AuthenticationViewModel {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

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
        
        await _firestore.collection("users").doc(credentials.user!.uid).set({
          "username": username,
          "uid": credentials.user!.uid,
          "email": email,
          "bio": bio,
          "followers": [],
          "following": [],
        });

        response = "Success";
      }
    } catch(error) {
      response = error.toString();
    }
    return response;
  }

}