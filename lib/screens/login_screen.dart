import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:instagram_clone/screens/signup_screen.dart";
import "package:instagram_clone/utils/colors.dart";
import "package:instagram_clone/utils/utils.dart";
import "package:instagram_clone/view_models/authentication_vm.dart";
import "package:instagram_clone/widgets/text_input.dart";

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void loginUser(context) async {
    setState(() {
      _isLoading = true;
    });

    String response = await AuthenticationViewModel().loginUser(
      email: _emailController.text,
      password: _passwordController.text
    );

    setState(() {
      _isLoading = false;
    });

    if(response == "success") {
      // navigate to homeScreen
    } else {
      showSnackBar(context, response);
    }
  }

  void navigateToSignup() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const SignupScreen())
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SvgPicture.asset(
                "assets/ic_instagram.svg",
                color: primaryColor,
                height: 64,
              ),
              const SizedBox(height: 64,),
              TextInput(
                controller: _emailController,
                hintText: "Email",
                inputType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 12,),
              TextInput(
                controller: _passwordController,
                hintText: "Password",
                inputType: TextInputType.text,
                isPassword: true,
              ),
              const SizedBox(height: 12,),
              _isLoading ? const SizedBox(
                height: 24,
                width: 24,
                child: Center(child: CircularProgressIndicator(
                  strokeWidth: 3,
                ),),
              ) :
              InkWell(
                onTap: () {
                  loginUser(context);
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
                    "LOGIN",
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
                  const Text("Don't have an account ?"),
                  const SizedBox(width: 5,),
                  GestureDetector(
                    onTap: navigateToSignup,
                    child: const Text(
                      "SIGN UP",
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
      ),
    );
  }
}
