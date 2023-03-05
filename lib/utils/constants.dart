import 'package:flutter/material.dart';
import 'package:instagram_clone/screens/add_post_screen.dart';

class Constants {
  static const int WEB_SCREEN_SIZE = 600;

  static const screens = [
    Center(child: Text("feed")),
    Center(child: Text("search")),
    AddPostScreen(),
    Center(child: Text("notifications")),
    Center(child: Text("profile")),
  ];
}