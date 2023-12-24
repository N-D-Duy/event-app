import 'package:event_app/features/user/presentation/widgets/event_list.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

late final List<Widget> _buttons = [
    ElevatedButton(
      onPressed: () {
        onClick('Button1');
      },
      child: Text('Comming Event'),
    ),
    ElevatedButton(
      onPressed: () {
        onClick('Button2');
      },
      child: Text('All Event'),
    ),
    ElevatedButton(
      onPressed: () {
        onClick('Button3');
      },
      child: Text('My Event'),
    ),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    onClick('Button1');
  }

  void onClick(String name){
    setState(() {
      switch(name){
        case 'Button1':
        {
          _mcontent.setWidget('Button1');
          break;
        }
        case 'Button2':{
          _mcontent.setWidget('Button2');
          break;
        }
        case 'Button3':{
          _mcontent.setWidget('Button3');
          break;
        }
        default:{
          _mcontent.setWidget('Button1');
          print('Out of content Button');
          break;
        }
      }
    });
  }

  late EventList _mcontent = EventList();
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
      title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {},
            ),
            Text('Home',
              style: TextStyle(color: Colors.black,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ..._buttons,
              ],
            ),
            Expanded(
              child : _mcontent,
            )
          ],
        )
      )
    );
  }
}


