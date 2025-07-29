import 'package:flutter/material.dart';
import 'package:flutter_the_second/home_page.dart';
import 'package:flutter_the_second/register.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String _registeredUsername = "Galih";
  String _registeredPassword = "111";

  void _handleLogin() {
    final inputUsername = _usernameController.text;
    final inputPassword = _passwordController.text;

    if (inputUsername == _registeredUsername &&
        inputPassword == _registeredPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Login berhasil!"),
          backgroundColor: Colors.green,
        ),
      );
      _usernameController.clear();
      _passwordController.clear();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Username atau password salah!"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Future<void> _navigateToRegister() async {
    final result = await Navigator.push<Map<String, String>>(
      context,
      MaterialPageRoute(builder: (context) => Register()),
    );

    if (result != null &&
        result.containsKey('username') &&
        result.containsKey('password')) {
      setState(() {
        _registeredUsername = result['username']!;
        _registeredPassword = result['password']!;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Akun berhasil dibuat. Silakan login."),
          backgroundColor: Colors.blue,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login Page")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Masukkan Username dan Password",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _usernameController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Username",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 25),
            ElevatedButton(onPressed: _handleLogin, child: Text("Login")),
            SizedBox(height: 15),
            ElevatedButton(
              onPressed: _navigateToRegister,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey),
              child: Text("Belum punya akun? Daftar di sini"),
            ),
          ],
        ),
      ),
    );
  }
}
