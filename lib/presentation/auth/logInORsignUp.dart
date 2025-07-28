import 'package:car/presentation/auth/loginPage.dart';
import 'package:car/presentation/auth/signupPage.dart';
import 'package:flutter/material.dart';

class SignuporLoginPage extends StatelessWidget {
  const SignuporLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final outlinedButtonStyle = ElevatedButton.styleFrom(
      backgroundColor: Colors.transparent,
      foregroundColor: Theme.of(context).colorScheme.primary,
      elevation: 0,
      side: BorderSide(
        color: Theme.of(context).colorScheme.primary,
      ),
    );

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0),
          child: Column(
            children: [
              // Logo positioned with more balanced spacing
              const Spacer(flex: 2),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Image.asset(
                  'assets/images/Car.png',
                  height: 80,
                ),
              ),
              
              // Centered buttons with remaining space
              const Spacer(flex: 1),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 14),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: outlinedButtonStyle,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ),
                        );
                      },
                      child: const Text('LOG IN'),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Create an account to get started.',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: outlinedButtonStyle,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignupPage(),
                          ),
                        );
                      },
                      child: const Text('SIGN UP'),
                    ),
                  ),
                ],
              ),
              const Spacer(flex: 3),
            ],
          ),
        ),
      ),
    );
  }
}