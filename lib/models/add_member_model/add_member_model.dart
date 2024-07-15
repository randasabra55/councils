class AddMemberModel {
  final String fullName;
  final String email;

  AddMemberModel({
    required this.fullName,
    required this.email,
  });

  factory AddMemberModel.fromJson(Map<String, dynamic> json) {
    return AddMemberModel(
      fullName: json['fullName'] ?? '',
      email: json['email'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'email': email,
    };
  }
}
