import 'package:car/presentation/intro/pages/get_started.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  final void Function()? onThemeChanged;

  const SplashScreen({Key? key, this.onThemeChanged}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ExploreButton()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // Get current theme

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: widget.onThemeChanged,
        child: Icon(Icons.color_lens),
        backgroundColor:
            theme.colorScheme.secondary, // Theme-aware button color
      ),
      backgroundColor: theme.scaffoldBackgroundColor, // Use theme background
      body: Stack(
        children: [
          // Logo & App Name (Top Center)
          Positioned(
            top: MediaQuery.of(context).size.height * 0.10,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  height: 120,
                  width: 220,
                  color:
                      theme.brightness == Brightness.dark
                          ? Colors
                              .white // Light logo in dark mode
                          : null, // Original color in light mode
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),

          // GIF (Middle Center)
          Center(
            child: Image.asset(
              'assets/images/Car.gif',
              height: 150,
              width: 150,
              fit: BoxFit.contain,
              color:
                  theme.brightness == Brightness.dark
                      ? null // Keep original colors in dark mode
                      : null, // Or apply tint if needed
            ),
          ),
        ],
      ),
    );
  }
}