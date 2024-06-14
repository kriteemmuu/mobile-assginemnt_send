import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'sign_up_screen.dart'; // Import the SignUpScreen
import 'dashboard_screen.dart'; // Import the DashboardScreen

class LoginScreen extends StatefulWidget {
  const LoginScreen(
      {Key? key,
      required bool isDarkTheme,
      required void Function() onToggleTheme})
      : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    final String email = _emailController.text;
    final String password = _passwordController.text;

    if (email == 'kritimakhatri123@gmail.com' && password == 'kritima') {
      // Credentials match, navigate to DashboardScreen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => DashboardScreen()),
      );
    } else {
      // Show error message or handle invalid credentials
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid email or password')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Screen'),
        titleTextStyle: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
        foregroundColor: Colors.black,
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 231, 125, 160),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset('assets/image/welcome.png'),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Email or Phone number',
                  hintStyle: TextStyle(color: Colors.black),
                ),
              ),
              const SizedBox(height: 8.0),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Password:',
                  hintStyle: TextStyle(color: Colors.black),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  foregroundColor: Colors.black,
                ),
                onPressed: _login,
                child: const SizedBox(
                  height: 40,
                  child: Center(
                    child: Text(
                      'Login',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8.0),
              TextButton(
                onPressed: () {
                  // Handle forgot password action
                },
                child: const Text(
                  'Forgot Your Password?',
                  style: TextStyle(
                    color: Colors.deepOrangeAccent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 8.0),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SignInButton(
                      Buttons.Google,
                      text: "Sign in with Google",
                      onPressed: () {
                        // Handle Google sign-in
                      },
                    ),
                    const SizedBox(height: 16),
                    SignInButton(
                      Buttons.Apple,
                      text: "Sign in with Apple ID",
                      onPressed: () {
                        // Handle Apple sign-in
                      },
                    ),
                    const SizedBox(height: 16),
                    SignInButton(
                      Buttons.Facebook,
                      text: "Sign in with Facebook",
                      onPressed: () {
                        // Handle Facebook sign-in
                      },
                    ),
                    const SizedBox(height: 8),
                    GestureDetector(
                      onTap: () {
                        // Navigate to SignUpScreen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpScreen()),
                        );
                      },
                      child: RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: "Don't have an account? ",
                              style: TextStyle(
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            TextSpan(
                              text: "Register now",
                              style: TextStyle(
                                color: Colors.red,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
