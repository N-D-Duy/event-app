class Event {
  final String name;
  final String description;
  final String time;
  final String location;
  final String id;

  Event(
      {required this.name,
      required this.description,
      required this.time,
      required this.location,
      required this.id});

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
        name: json['name'],
        description: json['description'],
        time: json['time'],
        location: json['location'],
        id: json['id']);
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'time': time,
      'location': location,
      'id': id
    };
  }
}
