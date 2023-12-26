// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:event_app/features/user/data/models/category.dart';
import 'package:flutter/material.dart';

import 'package:event_app/features/user/data/models/event.dart';

class EventDetails extends StatefulWidget {
  const EventDetails({super.key});
  @override
  State<EventDetails> createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {
  static Event event = Event(
    name: '',
    description: '',
    location: '',
    time: DateTime.now().toString(),
    image: '',
    category: Category.other,
    id: '',
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    event = ModalRoute.of(context)!.settings.arguments as Event;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 10,
            left: 10,
            child: SizedBox(
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_ios))),
          ),
          Center(
            child: (event.name.isNotEmpty)
                ? Text(event.name.toString())
                : const Text('EventDetails'),
          ),
        ],
      ),
    );
  }
}
