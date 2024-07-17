class CouncilCreationModel {
  final String title;
  final String timeAndDate;
  final int location;

  CouncilCreationModel(
      {required this.title, required this.timeAndDate, required this.location});

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'date': timeAndDate,
      'hallId': location,
    };
  }
}

class CreateCouncilReturnModel {
  final int id;
  final int typeCouncilId;

  CreateCouncilReturnModel({
    required this.id,
    required this.typeCouncilId,
  });

  factory CreateCouncilReturnModel.fromJson(Map<String, dynamic> json) {
    return CreateCouncilReturnModel(
      id: json['councilName'],
      typeCouncilId: json['date'],
    );
  }
}

class SearchCouncilModel {
  final String id;
  final String title;
  final String date;
  final String? hall;

  SearchCouncilModel({
    required this.id,
    required this.title,
    required this.date,
    this.hall,
  });

  factory SearchCouncilModel.fromJson(Map<String, dynamic> json) {
    return SearchCouncilModel(
      id: json['\$id'] ?? '',
      title: json['councilName'] ?? '',
      date: json['date'] ?? '',
      hall: json['hall'],
    );
  }
}
