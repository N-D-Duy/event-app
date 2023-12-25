import 'package:event_app/features/user/data/datasources/local/data.dart';
import 'package:event_app/features/user/data/models/event.dart';
import 'package:flutter/material.dart';

class MySearchDelegate extends SearchDelegate<String> {
  final List<Event> items = Data.eventList;

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final List<Event> results = items
        .where((item) => item.name.toUpperCase().contains(query.toUpperCase()))
        .toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(results[index].name),
          onTap: () {
            close(context, results[index].name);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<Event> suggestions = items
        .where((item) => item.name.toUpperCase().contains(query.toUpperCase()))
        .toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(suggestions[index].name),
          onTap: () {
            query = suggestions[index].name;
            close(context, query);
          },
        );
      },
    );
  }
}
