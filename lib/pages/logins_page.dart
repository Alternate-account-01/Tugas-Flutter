import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_the_second/routes/routes.dart'; // <-- for AppRoutes

class LoginsPage extends StatefulWidget {
  const LoginsPage({super.key});

  @override
  State<LoginsPage> createState() => _LoginsPageState();
}

class _LoginsPageState extends State<LoginsPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final String _setUsername = "admin";
  final String _setPassword = "111";

  void _handleLogin() {
    final inputUsername = _usernameController.text.trim();
    final inputPassword = _passwordController.text.trim();

    if (inputUsername == _setUsername && inputPassword == _setPassword) {
      // ✅ Redirect to BottomNavPage (starts in Calculator tab)
      Get.offAllNamed(AppRoutes.bottomnav);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Username or Password is incorrect!"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login Page")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Enter Username and Password",
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),

            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: "Username",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _handleLogin,
                child: const Text("Login"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
