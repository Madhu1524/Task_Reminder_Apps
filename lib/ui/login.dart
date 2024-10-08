import 'package:flutter/material.dart';
import 'package:todo_apps/ui/admin/view/adminUI.dart';

class LoginUI extends StatefulWidget {
  const LoginUI({super.key});

  @override
  State<LoginUI> createState() => _LoginUIState();
}

class _LoginUIState extends State<LoginUI> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Sign up"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AdminUI()),
                );
                // Navigate back to first route when tapped.
              },
              child: const Text('Go back!'),
            )
          ],
        ),
      ),
    );
  }
}
