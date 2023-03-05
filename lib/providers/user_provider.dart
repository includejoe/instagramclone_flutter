import 'package:flutter/material.dart';
import 'package:instagram_clone/models/user.dart';
import 'package:instagram_clone/view_models/authentication_vm.dart';

class UserProvider with ChangeNotifier {
  User? _user;
  final AuthenticationViewModel _authViewModel = AuthenticationViewModel();

  User get getUser => _user!;

  Future<void> refreshUser() async {
    User user = await _authViewModel.getUserDetails();
    _user = user;
    notifyListeners();
  }
}