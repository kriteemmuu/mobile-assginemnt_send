import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register Now"),
        foregroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Name:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Enter your name',
                  prefixIcon: Icon(Icons.edit),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Email:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Enter your email',
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Phone Number:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Enter your phone number',
                  prefixIcon: Icon(Icons.phone),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Date of Birth:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Enter your date of birth',
                  prefixIcon: Icon(Icons.calendar_today),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Password:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'Enter your password',
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Confirm Password:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'Confirm your password',
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
              const SizedBox(height: 24),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    // Handle sign up
                  },
                  child: const Text('Sign Up'),
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: TextButton(
                  onPressed: () {
                    // Navigate to login screen
                    Navigator.pop(
                        context); // Assuming the login screen is the previous route
                  },
                  child: const Text(
                    'Already have an account?',
                    style: TextStyle(
                      fontFamily: "OpenSans Bold",
                      color: Colors.black,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
