import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/auth_controller.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_google_button.dart';
import '../../widgets/custom_text_field.dart';

class SignupScreen extends StatelessWidget {
  final AuthController _authController = Get.find<AuthController>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                    child: Image(image: AssetImage('assets/images/logo.png'))),
                const SizedBox(height: 10),
                const Text(
                  'Login',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  controller: _emailController,
                  hintText: 'Email address',
                ),
                const SizedBox(height: 16.0),
                CustomTextField(
                  controller: _passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),
                const SizedBox(height: 16.0),
                const Align(
                    alignment: Alignment.topRight,
                    child: Text("Forgot Password ?",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.blue,
                        ))),
                const SizedBox(height: 15),
                CustomButton(
                  text: 'Login',
                  onPressed: () {
                    _authController.signUpWithEmailAndPassword(
                      email: _emailController.text,
                      password: _passwordController.text,
                    );
                  },
                ),
                const SizedBox(height: 10.0),
                Row(children: const <Widget>[
                  Expanded(child: Divider()),
                  Text("OR"),
                  Expanded(child: Divider()),
                ]),
                const SizedBox(height: 10),
                GoogleButton(
                  text: 'Signup with Google',
                  onPressed: () {
                    _authController.signInWithGoogle();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
