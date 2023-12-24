
class Ticket {
  final String id;
  final String name;
  final int price;
  final String eventId;

  Ticket(
      {required this.id,
      required this.name,
      required this.price,
      required this.eventId});

  factory Ticket.fromJson(Map<String, dynamic> json) {
    return Ticket(
        id: json['id'],
        name: json['name'],
        price: json['price'],
        eventId: json['event']);
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'price': price, 'event': eventId};
  }
}
