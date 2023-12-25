import 'package:event_app/features/user/data/datasources/local/data.dart';
import 'package:event_app/features/user/data/models/event.dart';
import 'package:event_app/features/user/presentation/pages/main/search/event_details.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class EventList extends StatefulWidget {
  final _EventListState _eventListState = _EventListState();

  void setWidget(String type) {
    _eventListState.setWidget(type);
  }

  @override
  State<StatefulWidget> createState() => _eventListState;
}

class _EventListState extends State<EventList> {
  void setWidget(String buttonType) {
    if (mounted) {
      setState(() {
        print('Change State');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GridView.builder(
      itemCount: Data.eventList.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(10),
          child: AspectRatio(
              aspectRatio: 2 / 3,
              child: GestureDetector(
                child: Container(
                  child: Column(children: [
                    Expanded(
                      child: Container(
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            clipBehavior: Clip.hardEdge,
                            child: Image.asset(
                              Data.eventList[index].image,
                              fit: BoxFit.cover,
                            )),
                        width: 250,
                        height: 250,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30)),
                      ),
                    ),
                    Text(Data.eventList[index].name),
                  ]),
                ),
                onTap: () {
                  _onPressButton(Data.eventList[index]);
                },
              )),
        );
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
    ));
  }

  void _onPressButton(Event event) {
    //Navigation to other widget
     Navigator.push(context, MaterialPageRoute(builder: (context) => EventDetails(event)));
  }
}
