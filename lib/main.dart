import 'package:car/appthemes/theme.dart' as appthemes;
import 'package:car/presentation/splash/pages/splashScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


void main()  async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkMode = false;
  void toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
   themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,

      darkTheme: appthemes.AppTheme.dark,
      theme: appthemes.AppTheme.light,
      home: SplashScreen(onThemeChanged: toggleTheme),
      
    );
  }
}