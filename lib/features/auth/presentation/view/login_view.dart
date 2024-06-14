import 'package:final_assignment/features/auth/presentation/view/register_view.dart';
import 'package:final_assignment/features/auth/presentation/viewmodel/auth_view_model.dart';
import 'package:final_assignment/features/home/presentation/view/home_view.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 223, 233, 241),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            CustomPaint(
              painter: ZigZagPainter(),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.35,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50.0),
                    child: Image.asset(
                      'assets/images/logo.png',
                      height: 100,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 260.0, 16.0, 0),
              child: Center(
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Log In',
                          style: TextStyle(
                            fontSize: 32.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue[800],
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 24.0),
                        _buildTextField(
                          controller: _emailController,
                          label: 'Email',
                          icon: Icons.email,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                .hasMatch(value)) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16.0),
                        _buildTextField(
                          controller: _passwordController,
                          label: 'Password',
                          icon: Icons.lock,
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            if (value.length < 6) {
                              return 'Password must be at least 6 characters';
                            }
                            return null;
                          },
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              // Handle forgot password
                            },
                            child: const Text(
                              'Forgot Password?',
                              style: TextStyle(
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 24.0),
                        _buildMainLoginButton(
                          'Log In',
                          Colors.blue[800]!,
                          () {
                            if (_formKey.currentState!.validate()) {
                              ref
                                  .read(authViewModelProvider.notifier)
                                  .loginStudent(_emailController.text,
                                      _passwordController.text);
                            }
                          },
                        ),
                        const SizedBox(height: 24.0),
                        Text(
                          'Or log in with',
                          style: TextStyle(
                            color: Colors.blue[800],
                            fontSize: 16.0,
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        _buildSocialLoginButton(
                          'Log In with Facebook',
                          'assets/images/fb_logo.png',
                          Colors.blue[800]!,
                          () {
                            // Perform Facebook login action
                          },
                        ),
                        const SizedBox(height: 16.0),
                        _buildSocialLoginButton(
                          'Log In with Google',
                          'assets/images/google_logo.png',
                          Colors.red,
                          () {
                            // Perform Google login action
                          },
                        ),
                        const SizedBox(height: 16.0),
                        _buildSocialLoginButton(
                          'Log In with Apple',
                          'assets/images/mac_logo.png',
                          Colors.black,
                          () {
                            // Perform Apple login action here
                          },
                        ),
                        const SizedBox(height: 24.0),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const RegisterView()),
                            );
                          },
                          child: RichText(
                            text: const TextSpan(
                              text: "Don't have an account? ",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,
                              ),
                              children: [
                                TextSpan(
                                  text: 'Sign up',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 16.0,
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
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: Colors.blue[800]),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
      obscureText: obscureText,
      keyboardType: keyboardType,
      validator: validator,
    );
  }

  Widget _buildMainLoginButton(
      String text, Color color, VoidCallback onPressed) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 100.0),
        textStyle: const TextStyle(fontSize: 16.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      onPressed: onPressed,
      child: Text(text),
    );
  }

  Widget _buildSocialLoginButton(
      String text, String asset, Color color, VoidCallback onPressed) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: color,
        backgroundColor: Colors.white,
        side: BorderSide(color: color),
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 30.0),
        textStyle: TextStyle(fontSize: 16.0, color: color),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            asset,
            height: 24.0,
            width: 24.0,
          ),
          const SizedBox(width: 8.0),
          Text(
            text,
            style: TextStyle(color: color),
          ),
        ],
      ),
    );
  }
}
