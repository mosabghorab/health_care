import 'package:flutter/material.dart';
import 'package:health_care/src/features/auth/presentation/sign_in_screen/sign_in_screen_controller.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  // controller.
  late final SignInScreenController _signInScreenController =
      context.read<SignInScreenController>();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Sign In Screen'),
      ),
    );
  }
}
