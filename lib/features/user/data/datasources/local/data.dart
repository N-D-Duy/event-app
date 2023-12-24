import 'package:event_app/features/user/data/models/account.dart';
import 'package:event_app/features/user/data/models/event.dart';
import 'package:event_app/features/user/data/models/ticket.dart';


class Data {
  static List<Event> eventList = [
    Event(
        name: 'Event 1',
        description: 'Description 1',
        time: 'Time 1',
        location: 'Location 1',
        id: '1'),
    Event(
        name: 'Event 2',
        description: 'Description 2',
        time: 'Time 2',
        location: 'Location 2',
        id: '2'),
    Event(
        name: 'Event 3',
        description: 'Description 3',
        time: 'Time 3',
        location: 'Location 3',
        id: '3'),
    Event(
        name: 'Event 4',
        description: 'Description 4',
        time: 'Time 4',
        location: 'Location 4',
        id: '4'),
    Event(
        name: 'Event 5',
        description: 'Description 5',
        time: 'Time 5',
        location: 'Location 5',
        id: '5'),
    Event(
        name: 'Event 6',
        description: 'Description 6',
        time: 'Time 6',
        location: 'Location 6',
        id: '6'),
    Event(
        name: 'Event 7',
        description: 'Description 7',
        time: 'Time 7',
        location: 'Location 7',
        id: '7'),
    Event(
        name: 'Event 8',
        description: 'Description 8',
        time: 'Time 8',
        location: 'Location 8',
        id: '8'),
    Event(
        name: 'Event 9',
        description: 'Description 9',
        time: 'Time 9',
        location: 'Location 9',
        id: '9'),
    Event(
        name: 'Event 10',
        description: 'Description 10',
        time: 'Time 10',
        location: 'Location 10',
        id: '10'),
    Event(
        name: 'Event 11',
        description: 'Description 11',
        time: 'Time 11',
        location: 'Location 11',
        id: '11'),
    Event(
        name: 'Event 12',
        description: 'Description 12',
        time: 'Time 12',
        location: 'Location 12',
        id: '12'),
  ];

  static List<Account> accountList = [
    Account(
        email: 'admin@gmail.com',
        password: 'admin',
        name: 'admin',
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

}
