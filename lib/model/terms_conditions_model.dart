
class TermsConditionsModel {
  final bool status;
  final String data;

  TermsConditionsModel({required this.status, required this.data});

  factory TermsConditionsModel.fromJson(Map<String, dynamic> json) {
    return TermsConditionsModel(
      status: json['status'] ?? false,
      data: json['data'] ?? '',
    );
  }
}
