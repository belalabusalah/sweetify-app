import 'package:sweetify_app/model/get_product/category_model.dart';

import 'applied_filters_model.dart';
import 'pagination_model.dart';
import 'product_model.dart';

class CategoryProductsResponse {
  final bool status;
  final CategoryModel category;
  final List<ProductModel> data;
  final PaginationModel pagination;
  final AppliedFiltersModel appliedFilters;

  CategoryProductsResponse({
    required this.status,
    required this.category,
    required this.data,
    required this.pagination,
    required this.appliedFilters,
  });

  factory CategoryProductsResponse.fromJson(Map<String, dynamic> json) {
    return CategoryProductsResponse(
      status: json['status'],
      category: CategoryModel.fromJson(json['category']),
      data: List<ProductModel>.from(
        json['data'].map((x) => ProductModel.fromJson(x)),
      ),
      pagination: PaginationModel.fromJson(json['pagination']),
      appliedFilters: AppliedFiltersModel.fromJson(json['applied_filters']),
    );
  }
}