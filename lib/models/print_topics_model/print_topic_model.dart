class PrintTopicModel {
  final String title;
  final String type;
  final String notes;
  final String result;

  PrintTopicModel({
    required this.title,
    required this.type,
    required this.notes,
    required this.result,
  });

  factory PrintTopicModel.fromJson(Map<String, dynamic> json) {
    return PrintTopicModel(
      title: json['title'] ?? '',
      type: json['type'] ?? '',
      notes: json['notes'] ?? '',
      result: json['result'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'type': type,
      'notes': notes,
      'result': result,
    };
  }
}
