import 'package:car/presentation/home/pages/homePage.dart';
import 'package:car/presentation/auth/loginPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// Ensure that the HomePage widget is defined in homePage.dart as below:
// class HomePage extends StatelessWidget { ... }

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: StreamBuilder(
  stream: FirebaseAuth.instance.authStateChanges(),
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const Center(child: CircularProgressIndicator());
    }
    if (snapshot.hasError) {
      return Center(child: Text('Error: ${snapshot.error}'));
    }
    if (snapshot.hasData) {
      return homePage();
    }
    return LoginPage();
  },
)
    );
  }
}