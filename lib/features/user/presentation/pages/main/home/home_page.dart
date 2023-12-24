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
      body: 
      Stack(
        children: [
          Background(),
          _bodySection(),
        ],
      ),);
  }
}

// ignore: camel_case_types
class _bodySection extends StatefulWidget {
  const _bodySection({super.key});

  @override
  State<_bodySection> createState() => __bodySectionState();
}

// ignore: camel_case_types
class __bodySectionState extends State<_bodySection> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Home Screen'),
    );
  }
}
