class PrivacyPolicyModel {
  final bool status;
  final String data;

  PrivacyPolicyModel({required this.status, required this.data});

  factory PrivacyPolicyModel.fromJson(Map<String, dynamic> json) {
    return PrivacyPolicyModel(
      status: json['status'] ?? false,
      data: json['data'] ?? '',
    );
  }
}
