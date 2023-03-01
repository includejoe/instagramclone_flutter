import "dart:typed_data";
import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:image_picker/image_picker.dart";
import "package:instagram_clone/utils/colors.dart";
import "package:instagram_clone/utils/utils.dart";
import "package:instagram_clone/view_models/authentication_vm.dart";
import "package:instagram_clone/widgets/text_input.dart";
import "package:instagram_clone/utils/dimensions.dart";

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final avatarImageUri = "https://www.pngall.com/wp-content/uploads/12/Avatar-Profile-PNG-Picture.png";
  Uint8List? image;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _bioController.dispose();
    _usernameController.dispose();
  }

  void selectImage () async {
    Uint8List _image = await pickImage(ImageSource.gallery);
    setState(() {
      image = _image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: SizedBox(
              height: screenHeight(context),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.max,
                children: [
                  // const SizedBox(height: 200,),
                  SvgPicture.asset(
                    "assets/ic_instagram.svg",
                    color: primaryColor,
                    height: 64,
                  ),
                  const SizedBox(height: 32,),
                  Stack(
                    children: [
                      image != null ? CircleAvatar(
                        radius: 60,
                        backgroundImage: MemoryImage(image!),
                      ) :
                      CircleAvatar(
                        radius: 60,
                        backgroundImage: NetworkImage(avatarImageUri),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 75,
                        child: GestureDetector(
                          onTap: selectImage,
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: blueColor,
                              border: Border.all(
                                color: mobileBgColor,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(50)
                            ),
                            child: const Icon(Icons.add_a_photo),
                          ),
                        )
                      )
                    ],
                  ),
                  const SizedBox(height: 32,),
                  TextInput(
                    controller: _emailController,
                    hintText: "Email",
                    inputType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 20,),
                  TextInput(
                    controller: _usernameController,
                    hintText: "Username",
                    inputType: TextInputType.text,
                  ),
                  const SizedBox(height: 20,),
                  TextInput(
                    controller: _bioController,
                    hintText: "Bio",
                    inputType: TextInputType.text,
                  ),
                  const SizedBox(height: 20,),
                  TextInput(
                    controller: _passwordController,
                    hintText: "Password",
                    inputType: TextInputType.text,
                    isPassword: true,
                  ),
                  const SizedBox(height: 20,),
                  InkWell(
                    onTap: () async {
                      String response = await AuthenticationViewModel().registerUser(
                          email: _emailController.text,
                          password: _passwordController.text,
                          username: _usernameController.text,
                          bio: _bioController.text,
                          image: image,
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      height: 45,
                      alignment: Alignment.center,
                      decoration: const ShapeDecoration(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(4))
                          ),
                          color: blueColor
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: const Text(
                        "SIGN UP",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18
                        ),
                      ),
                    ),
                  ),
                  const Divider(height: 50,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have an account ?"),
                      const SizedBox(width: 5,),
                      GestureDetector(
                        onTap: () {},
                        child: const Text(
                          "LOGIN",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: blueColor
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12,),
                ],
              ),
            ),
          )
        ),
      ),
    );
  }
}
