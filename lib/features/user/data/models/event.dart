// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:event_app/features/user/data/models/category.dart';

class Event {
  final String name;
  final String description;
  final String time;
  final String image;
  final Category category;
  final String location;
  final String id;
  Event({
    required this.name,
    required this.description,
    required this.time,
    required this.image,
    required this.category,
    required this.location,
    required this.id,
  });

  Event copyWith({
    String? name,
    String? description,
    String? time,
    String? image,
    Category? category,
    String? location,
    String? id,
  }) {
    return Event(
      name: name ?? this.name,
      description: description ?? this.description,
      time: time ?? this.time,
      image: image ?? this.image,
      category: category ?? this.category,
      location: location ?? this.location,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'description': description,
      'time': time,
      'image': image,
      'category': category.index,
      'location': location,
      'id': id,
    };
  }

  factory Event.fromMap(Map<String, dynamic> map) {
    return Event(
      name: map['name'] as String,
      description: map['description'] as String,
      time: map['time'] as String,
      image: map['image'] as String,
      category: Category.values[json.decode('category')],
      location: map['location'] as String,
      id: map['id'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Event.fromJson(String source) =>
      Event.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Event(name: $name, description: $description, time: $time, image: $image, category: $category, location: $location, id: $id)';
  }

  @override
  bool operator ==(covariant Event other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.description == description &&
        other.time == time &&
        other.image == image &&
        other.category == category &&
        other.location == location &&
        other.id == id;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        description.hashCode ^
        time.hashCode ^
        image.hashCode ^
        category.hashCode ^
        location.hashCode ^
        id.hashCode;
  }
}
