class AboutUsModel {
  final bool status;
  final String data;

  AboutUsModel({required this.status, required this.data});

  factory AboutUsModel.fromJson(Map<String, dynamic> json) {
    return AboutUsModel(
      status: json['status'] ?? false,
      data: json['data'] ?? '',
    );
  }
}
