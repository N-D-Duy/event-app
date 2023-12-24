
import 'package:event_app/features/user/presentation/pages/main/main_screen.dart';
import 'package:event_app/features/user/presentation/pages/splash/splash_screen.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  /* await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ); */
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/home': (context) => const MainScreen(),
      },
    );
  }
}