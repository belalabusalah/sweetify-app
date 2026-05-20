
class AddressListModel {
  final bool status;
  final List<AddressData> data;

  AddressListModel({
    required this.status,
    required this.data,
  });

  factory AddressListModel.fromJson(Map<String, dynamic> json) {
    return AddressListModel(
      status: json['status'] ?? false,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => AddressData.fromJson(e))
          .toList() ??
          [],
    );
  }
}


class AddressData {
  final int id;
  final int customerId;

  final String title;
  final String addressType;

  final String buildingName;
  final String recipientName;
  final String street;
  final String nearestLandmark;
  final String city;
  final String area;
  final String block;
  final String avenue;
  final String buildingNumber;
  final String postalCode;
  final String countryCode;
  final String mobile;
  final String specialInstructions;

  final String createdAt;
  final String updatedAt;

  final String? latitude;
  final String? longitude;

  final int isBilling;

  AddressData({
    required this.id,
    required this.customerId,
    required this.title,
    required this.addressType,
    required this.buildingName,
    required this.recipientName,
    required this.street,
    required this.nearestLandmark,
    required this.city,
    required this.area,
    required this.block,
    required this.avenue,
    required this.buildingNumber,
    required this.postalCode,
    required this.countryCode,
    required this.mobile,
    required this.specialInstructions,
    required this.createdAt,
    required this.updatedAt,
    required this.latitude,
    required this.longitude,
    required this.isBilling,
  });

  factory AddressData.fromJson(Map<String, dynamic> json) {
    return AddressData(
      id: json['id'] ?? 0,
      customerId: json['customer_id'] ?? 0,
      title: json['title'] ?? '',
      addressType: json['address_type'] ?? '',

      buildingName: json['building_name'] ?? '',
      recipientName: json['recipient_name'] ?? '',
      street: json['street'] ?? '',
      nearestLandmark: json['nearest_landmark'] ?? '',
      city: json['city'] ?? '',
      area: json['area'] ?? '',
      block: json['block'] ?? '',
      avenue: json['avenue'] ?? '',
      buildingNumber: json['building_number'] ?? '',
      postalCode: json['postal_code'] ?? '',
      countryCode: json['country_code'] ?? '',
      mobile: json['mobile'] ?? '',
      specialInstructions: json['special_instructions'] ?? '',

      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',

      latitude: json['latitude']?.toString(),
      longitude: json['longitude']?.toString(),

      isBilling: json['is_billing'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "address_type": addressType,
      "building_name": buildingName,
      "recipient_name": recipientName,
      "street": street,
      "nearest_landmark": nearestLandmark,
      "city": city,
      "area": area,
      "block": block,
      "avenue": avenue,
      "building_number": buildingNumber,
      "postal_code": postalCode,
      "country_code": countryCode,
      "mobile": mobile,
      "special_instructions": specialInstructions,
      "latitude": latitude,
      "longitude": longitude,
      "is_billing": isBilling,
    };
  }
}