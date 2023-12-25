import 'package:event_app/features/user/data/models/account.dart';
import 'package:event_app/features/user/data/models/category.dart';
import 'package:event_app/features/user/data/models/event.dart';
import 'package:event_app/features/user/data/models/profile.dart';
import 'package:event_app/features/user/data/models/ticket.dart';
import 'package:event_app/features/user/data/models/user.dart';

class Data {
  static List<String> admin = ['tranvietbao', 'nguyenducduy', 'nguyenvanquyet'];
  static List<Event> eventList = [
    Event(
        name: 'Music Festival',
        description: 'Description 1',
        image: 'assets/images/event_1.jpeg',
        category: Category.music,
        time: 'Time 1',
        location: 'Location 1',
        id: '1'),
    Event(
        name: 'Sports Game',
        description: 'Description 2',
        image: 'assets/images/event_2.jpg',
        category: Category.sports,
        time: 'Time 2',
        location: 'Location 2',
        id: '2'),
    Event(
        name: 'Food and Wine Tasting',
        description: 'Description 3',
        image: 'assets/images/event_3.jpg',
        category: Category.food,
        time: 'Time 3',
        location: 'Location 3',
        id: '3'),
    Event(
        name: 'Art Exhibition',
        description: 'Description 4',
        image: 'assets/images/event_4.jpg',
        category: Category.art,
        time: 'Time 4',
        location: 'Location 4',
        id: '4'),
    Event(
        name: 'Book Signing',
        description: 'Description 5',
        image: 'assets/images/event_5.jpg',
        time: 'Time 5',
        category: Category.other,
        location: 'Location 5',
        id: '5'),
    Event(
        name: 'Wedding Ceremony',
        description: 'Description 6',
        image: 'assets/images/event_6.jpg',
        category: Category.wedding,
        time: 'Time 6',
        location: 'Location 6',
        id: '6'),
    Event(
        name: 'Birthday Party',
        description: 'Description 7',
        image: 'assets/images/event_7.jpg',
        category: Category.party,
        time: 'Time 7',
        location: 'Location 7',
        id: '7'),
    Event(
        name: 'Event 8',
        description: 'Description 8',
        image: 'assets/images/event_8.jpg',
        category: Category.music,
        time: 'Time 8',
        location: 'Location 8',
        id: '8'),
    Event(
        name: 'Event 9',
        description: 'Description 9',
        image: 'assets/images/event_9.jpeg',
        category: Category.sports,
        time: 'Time 9',
        location: 'Location 9',
        id: '9'),
    Event(
        name: 'Event 10',
        description: 'Description 10',
        image: 'assets/images/event_10.jpg',
        category: Category.food,
        time: 'Time 10',
        location: 'Location 10',
        id: '10'),
  ];

  static List<Account> accountList = [
    Account(
        email: 'admin',
        password: 'admin',
        name: 'admin',
        profile: profileList[0],
        role: 'admin'),
  ];

  static List<Ticket> ticketList = [
    Ticket(id: '1', name: 'Ticket 1', price: 100, eventId: '1'),
    Ticket(id: '2', name: 'Ticket 2', price: 200, eventId: '2'),
    Ticket(id: '3', name: 'Ticket 3', price: 300, eventId: '3'),
    Ticket(id: '4', name: 'Ticket 4', price: 400, eventId: '4'),
    Ticket(id: '5', name: 'Ticket 5', price: 500, eventId: '5'),
    Ticket(id: '6', name: 'Ticket 6', price: 600, eventId: '6'),
    Ticket(id: '7', name: 'Ticket 7', price: 700, eventId: '7'),
    Ticket(id: '8', name: 'Ticket 8', price: 800, eventId: '8'),
    Ticket(id: '9', name: 'Ticket 9', price: 900, eventId: '9'),
    Ticket(id: '10', name: 'Ticket 10', price: 1000, eventId: '10'),
    Ticket(id: '11', name: 'Ticket 11', price: 1100, eventId: '11'),
    Ticket(id: '12', name: 'Ticket 12', price: 1200, eventId: '12'),
  ];

  static List<Profile> profileList = [
    Profile(
        address: 'Ha Noi',
        email: 'admin',
        avatar: 'assets/images/profile_avatar.jpg',
        gender: 'male',
        name: 'nguyen duc duy',
        phone: '0123456789')
  ];

  static User user = User(
      name: 'John Doe',
      description: 'A Flutter Developer',
      birthday: '01/01/2000',
      gender: 'Male',
      address: '123 Main St, City',
      phone: '123-456-7890',
      email: 'johndoe@gmail.com');
}
