import "package:flutter/material.dart";
import "package:instagram_clone/providers/user_provider.dart";
import "package:instagram_clone/utils/constants.dart";
import "package:provider/provider.dart";

class ResponsiveLayout extends StatefulWidget {
  final Widget webScreenLayout;
  final Widget mobileScreenLayout;

  const ResponsiveLayout({
    Key? key,
    required this.webScreenLayout,
    required this.mobileScreenLayout
  }) : super(key: key);

  @override
  State<ResponsiveLayout> createState() => _ResponsiveLayoutState();
}

class _ResponsiveLayoutState extends State<ResponsiveLayout> {
  @override
  void initState() {
    super.initState();
    addData();
  }

  addData() async {
    UserProvider userProvider = Provider.of(context, listen: false);
    await userProvider.refreshUser();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (contexts, constraints){
          if(constraints.maxWidth > Constants.WEB_SCREEN_SIZE) {
            return widget.webScreenLayout;
          }

          return widget.mobileScreenLayout;
        }
    );
  }
}
