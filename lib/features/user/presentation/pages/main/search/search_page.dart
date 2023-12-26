import 'package:event_app/features/user/data/datasources/local/data.dart';
import 'package:event_app/features/user/data/models/category.dart';
import 'package:event_app/features/user/data/models/event.dart';
import 'package:event_app/features/user/presentation/widgets/my_search_delegate.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Event> showList = Data.eventList;
  RegExp pattern = RegExp(r'Category\.(\w+)');
  List<String> categories = [];

  @override
  void initState() {
    super.initState();
    categories = Category.values
        .map((e) => pattern.firstMatch(e.toString())?.group(1) ?? '')
        .toList();


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SizedBox(
              height: 70,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SearchBar(
                  leading: Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: const Icon(Icons.search)),
                  hintText: 'Search',
                  hintStyle: MaterialStateProperty.resolveWith<TextStyle?>(
                    (states) => const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  onTap: () {
                    showSearch(context: context, delegate: MySearchDelegate());
                  },
                ),
              ),
            )),
        Positioned(
          top: 80,
          left: 0,
          right: 0,
          child: SizedBox(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  categories.length,
                  (index) => Container(
                    width: categories[index].length * 10.0 + 50,
                    margin: const EdgeInsets.symmetric(horizontal: 6),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: ListTile(
                        title: Text(
                          categories[index],
                          style: const TextStyle(color: Colors.blue),
                          textAlign: TextAlign.center,
                        ),
                        onTap: () {
                          setState(() {
                            showList = (categories[index] == 'all')
                                ? Data.eventList
                                : Data.eventList
                                    .where((element) =>
                                        element.category.toString() ==
                                        'Category.${categories[index]}')
                                    .toList();
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
            top: 150,
            left: 0,
            right: 0,
            bottom: 0,
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: showList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text(showList[index].name),
                        onTap: () {
                          Navigator.pushNamed(context, '/event_details',
                              arguments: showList[index]);
                        },
                      );
                    },
                  ),
                ),
              ],
            ))
      ]),
    );
  }
}
