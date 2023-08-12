import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'firebase_provider.dart';
import 'home.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text("Sign Up"),
        ),
        body: Column(
          children: [
            const Text("Sign Up"),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
              ),
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Confirm Password',
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  authProvider.login(
                      emailController.text, passwordController.text);
                  if (authProvider.user != null) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const HomePage()));
                  }
                },
                child: const Text("Sign Up"))
          ],
        ));
  }
}
