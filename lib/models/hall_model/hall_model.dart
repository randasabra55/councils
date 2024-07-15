class HallModel {
  final int id;
  final String name;
  final String location;
  final int numberOfSeats;

  HallModel({
    required this.id,
    required this.name,
    required this.location,
    required this.numberOfSeats,
  });

  factory HallModel.fromJson(Map<String, dynamic> json) {
    return HallModel(
      id: json['id'] is int ? json['id'] : int.parse(json['id'].toString()),
      name: json['name'],
      location: json['location'],
      numberOfSeats: json['numberOfSeats'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'location': location,
      'numberOfSeats': numberOfSeats,
    };
  }
}
