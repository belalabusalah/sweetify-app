import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/get_product/category_products_response.dart';

class ProductService {
  final String baseUrl = "https://tullana.toldpath.com/api";

  Future<CategoryProductsResponse> getProducts() async {
    final response = await http.get(
      Uri.parse("$baseUrl/customer/categories/products/147"),
    );

    if (response.statusCode == 200) {
      return CategoryProductsResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load products");
    }
  }
}