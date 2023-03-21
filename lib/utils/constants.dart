import 'package:flutter/material.dart';
import 'package:instagram_clone/screens/add_post_screen.dart';
import 'package:instagram_clone/screens/feeds_screen.dart';

class Constants {
  static const int WEB_SCREEN_SIZE = 600;

  static const screens = [
    FeedScreen(),
    Center(child: Text("search")),
    AddPostScreen(),
    Center(child: Text("notifications")),
    Center(child: Text("profile")),
  ];
}