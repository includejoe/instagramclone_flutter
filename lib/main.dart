import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/responsive/mobile_screen_layout.dart';
import 'package:instagram_clone/responsive/responsive_layout_screen.dart';
import 'package:instagram_clone/responsive/web_screen_layout.dart';
import 'package:instagram_clone/utils/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if(kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyAkmhldI1lLoxELj8LmDFRkzzzXRKsNuYM",
        appId: "1:351885287458:web:959e2f476208d3df00aa7b",
        messagingSenderId: "351885287458",
        projectId: "instagram-clone-flutter-6f765",
        storageBucket: "instagram-clone-flutter-6f765.appspot.com",
      )
    );
  } else {
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Instagram Clone",
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: mobileBgColor
      ),
      home: const ResponsiveLayout(
        mobileScreenLayout: MobileScreenLayout(),
        webScreenLayout: WebScreenLayout(),
      )
    );
  }
}
