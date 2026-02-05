import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:invtrack/core/routes/routes.dart';
import 'package:invtrack/features/auth/widgets/signin_header.dart';
import 'package:invtrack/features/auth/widgets/username_input_field.dart';
import 'package:invtrack/features/auth/widgets/password_input_field.dart';
import 'package:invtrack/features/auth/widgets/remember_me_checkbox.dart';
import 'package:invtrack/core/widget/signin_button.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  late TextEditingController usernameController;
  late TextEditingController passwordController;
  bool rememberMe = false;

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      //DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    usernameController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                SizedBox(height: 70),
                const SignInHeader(),
                UsernameInputField(controller: usernameController),
                const SizedBox(height: 20),
                PasswordInputField(controller: passwordController),
                const SizedBox(height: 16),
                RememberMeCheckbox(
                  onChanged: (value) {
                    setState(() {
                      rememberMe = value;
                    });
                  },
                ),
                const SizedBox(height: 32),
                SignInButton(
                  onPressed: () {
                    context.go(Routes.homeScreen);
                  },
                  text: 'تسجيل الدخول',
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
