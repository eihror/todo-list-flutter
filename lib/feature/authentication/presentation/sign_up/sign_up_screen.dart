import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({
    super.key,
    required this.email,
  });

  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      body: Center(
        child: Text("E-mail recebido: $email"),
      ),
    );
  }
}
