import 'package:event_app/features/user/data/models/event.dart';
// import 'package:event_app/features/user/presentation/widgets/author.dart';
// import 'package:event_app/features/user/presentation/widgets/timeline.dart';
import 'package:flutter/material.dart';

import 'package:event_app/features/user/data/models/event.dart';

class EventDetails extends StatefulWidget {
  final Event _event;
  EventDetails(this._event);
  @override
  State<EventDetails> createState() => _EventDetailsState(_event);
}

class _EventDetailsState extends State<EventDetails> {
  final Event _event;

  _EventDetailsState(this._event);

  void _onButtonPressed() {
    // Thực hiện thao tác đặt vé
    print('Book Ticket');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Event Details',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Event Details'),
        ),
        body: Stack(
          children: [
            Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    _event.image,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Center(
                      child: Text(
                        _event.name,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Icon(Icons.location_on),
                        Text(
                          _event.location,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Icon(Icons.timelapse),
                        Text(
                          _event.time,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Container(
                      child: Column(
                        children: [
                          Text(
                            'Description:',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            height: 10,
                          ),
                          Text(
                            _event.description,
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Views: 300',
                        ),
                        Text(
                          '\$50.05',
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: ElevatedButton(
                      child: Text('Buy Ticket'),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text(_event.name),
  //     ),
  //     body: SingleChildScrollView(
  //       child: Column(
  //         children: [
  //           // Ảnh nổi bật
  //           Image.asset(
  //             _event.image,
  //             fit: BoxFit.cover,
  //           ),
  //           // Các thông tin chi tiết khác
  //           Container(
  //             padding: EdgeInsets.all(16),
  //             child: Column(
  //               children: [
  //                 Text(_event.name),
  //                 Text(_event.location),
  //                 Text(_event.time),
  //                 Text(_event.description),
  //                 Author(),
  //                 Timeline(),
  //               ],
  //             ),
  //           ),
  //           // Button đặt vé
  //           ElevatedButton(
  //             child: Text("Đặt vé"),
  //             onPressed: _onButtonPressed,
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
