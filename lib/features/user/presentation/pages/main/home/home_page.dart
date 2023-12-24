
import 'package:event_app/features/user/presentation/widgets/background.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(children: [
        Background(),
        Center(
          child: Text('Home Screen',
              style: TextStyle(fontSize: 30, color: Colors.white)),
        )
      ]),
    );
  }
}
