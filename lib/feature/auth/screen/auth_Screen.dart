// ignore: file_names
import 'package:ec/constants/global_variable.dart';
import 'package:ec/feature/auth/services/auth_services.dart';
import 'package:ec/feature/auth/widgets/common/custom_button.dart';
import 'package:ec/feature/auth/widgets/common/custom_textfield.dart';
import 'package:flutter/material.dart';

enum Auth {
  signup,
  signin,
}

final _signupFormKey = GlobalKey<FormState>();
final _signinFormKey = GlobalKey<FormState>();

class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth-screen';

  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final AuthService authService = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwirdController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwirdController.dispose();
    _nameController.dispose();
  }

  void _signupUser() {
    authService.signupUser(
        context: context,
        email: _emailController.text,
        name: _nameController.text,
        password: _passwirdController.text);
  }

  void _signInUser() {
    authService.signin(
        context: context,
        email: _emailController.text,
        password: _passwirdController.text);
  }

  Auth _auth = Auth.signup;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariable.greyBackgroundCOlor,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Welcome",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            ListTile(
              tileColor: _auth == Auth.signup
                  ? GlobalVariable.backgroundColor
                  : GlobalVariable.greyBackgroundCOlor,
              title: const Text(
                "Create Account",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              leading: Radio(
                activeColor: GlobalVariable.secondaryColor,
                value: Auth.signup,
                groupValue: _auth,
                onChanged: (Auth? val) {
                  setState(() {
                    _auth = val!;
                  });
                },
              ),
            ),
            if (_auth == Auth.signup)
              Container(
                padding: EdgeInsets.all(8),
                color: GlobalVariable.backgroundColor,
                child: Form(
                  key: _signupFormKey,
                  child: Column(children: [
                    CustomTextField(
                      controller: _nameController,
                      txt: "Name",
                    ),
                    CustomTextField(
                      controller: _emailController,
                      txt: "Email",
                    ),
                    CustomTextField(
                      controller: _passwirdController,
                      txt: "Password",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomButton(
                        text: "Signup",
                        onTap: () {
                          if (_signupFormKey.currentState!.validate()) {
                            _signupUser();
                          }
                        }),
                  ]),
                ),
              ),
            ListTile(
              tileColor: _auth == Auth.signin
                  ? GlobalVariable.backgroundColor
                  : GlobalVariable.greyBackgroundCOlor,
              title: const Text(
                "Signin",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              leading: Radio(
                activeColor: GlobalVariable.secondaryColor,
                value: Auth.signin,
                groupValue: _auth,
                onChanged: (Auth? val) {
                  setState(() {
                    _auth = val!;
                  });
                },
              ),
            ),
            if (_auth == Auth.signin)
              Container(
                padding: EdgeInsets.all(8),
                color: GlobalVariable.backgroundColor,
                child: Form(
                  key: _signinFormKey,
                  child: Column(children: [
                    CustomTextField(
                      controller: _emailController,
                      txt: "Email",
                    ),
                    CustomTextField(
                      controller: _passwirdController,
                      txt: "Password",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomButton(
                        text: "SignIn",
                        onTap: () {
                          if (_signinFormKey.currentState!.validate()) {
                            _signInUser();
                          }
                        }),
                  ]),
                ),
              ),
          ],
        ),
      )),
    );
  }
}
