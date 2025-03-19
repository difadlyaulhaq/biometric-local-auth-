import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:biometric/pages/homepage.dart';

class Loginpage extends StatelessWidget {
  Loginpage({super.key});
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final LocalAuthentication auth = LocalAuthentication();

  Future<void> _authenticate(BuildContext context) async {
    try {
      bool isAuthenticated = await auth.authenticate(
        localizedReason: 'Scan fingerprint to authenticate',
        options: const AuthenticationOptions(
          biometricOnly: true,
        ),
      );

      if (isAuthenticated) {
        Navigator.pushReplacement(
          context,MaterialPageRoute(builder: (context) => const Homepage()),
        );
      }
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Authentication Failed'),
            content: Text(e.toString()),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Close'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Login',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextField(
                  controller: usernameController,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.blueAccent,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: 'Username',
                    labelStyle: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.blueAccent,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: 'Password',
                    labelStyle: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (usernameController.text == 'admin' &&
                      passwordController.text == 'admin') {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const Homepage()),
                    );
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Error'),
                          content: const Text('Invalid credentials'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('Close'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.purpleAccent,
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text('Login'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _authenticate(context),
                style: ElevatedButton.styleFrom(
                  primary: Colors.purpleAccent,
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(20),
                ),
                child: const Icon(Icons.fingerprint, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
