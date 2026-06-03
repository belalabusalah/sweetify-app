class AppliedFiltersModel {
  final String singleCategoryId;

  AppliedFiltersModel({
    required this.singleCategoryId,
  });

  factory AppliedFiltersModel.fromJson(Map<String, dynamic> json) {
    return AppliedFiltersModel(
      singleCategoryId: json['single_category_id'],
    );
  }
}