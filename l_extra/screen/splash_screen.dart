import 'package:flutter/material.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isDarkTheme = false;

  @override
  void initState() {
    super.initState();
    _navigateToLogin();
  }

  void _navigateToLogin() async {
    await Future.delayed(const Duration(seconds: 2));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => LoginScreen(
              isDarkTheme: isDarkTheme, onToggleTheme: _toggleTheme)),
    );
  }

  void _toggleTheme() {
    setState(() {
      isDarkTheme = !isDarkTheme;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/image/pregnancy.png",
            ),
            const SizedBox(height: 16.0),
            const Text(
              'A Journey to Motherhood',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                foregroundColor: Colors.black,
              ),
              onPressed: () {
                // Navigate to LoginScreen immediately
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => LoginScreen(
                          isDarkTheme: isDarkTheme,
                          onToggleTheme: _toggleTheme)),
                );
              },
              child: const Text('Get Started'),
            ),
          ],
        ),
      ),
    );
  }
}
