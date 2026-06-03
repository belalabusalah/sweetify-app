import 'brand_model.dart';

class ProductModel {
  final int id;
  final String code;
  final String name;
  final String slug;
  final String shortDescription;
  final String details;
  final String shop;
  final BrandModel brand;
  final String unit;
  final int minQty;
  final double finalUnitPrice;
  final int currentStock;
  final int totalStock;
  final String availability;
  final String thumbnail;
  final List<String> images;
  final bool hasVariations;
  final List<String> sizes;
  final double rating;

  ProductModel({
    required this.id,
    required this.code,
    required this.name,
    required this.slug,
    required this.shortDescription,
    required this.details,
    required this.shop,
    required this.brand,
    required this.unit,
    required this.minQty,
    required this.finalUnitPrice,
    required this.currentStock,
    required this.totalStock,
    required this.availability,
    required this.thumbnail,
    required this.images,
    required this.hasVariations,
    required this.sizes,
    required this.rating,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      code: json['code'],
      name: json['name'],
      slug: json['slug'],
      shortDescription: json['short_description'] ?? '',
      details: json['details'] ?? '',
      shop: json['shop'] ?? '',
      brand: BrandModel.fromJson(json['brand']),
      unit: json['unit'] ?? '',
      minQty: json['min_qty'] ?? 1,
      finalUnitPrice: (json['final_unit_price'] as num).toDouble(),
      currentStock: json['current_stock'] ?? 0,
      totalStock: json['total_stock'] ?? 0,
      availability: json['availability_instock'] ?? '',
      thumbnail: json['thumbnail'] ?? '',
      images: List<String>.from(json['images'] ?? []),
      hasVariations: json['has_variations'] ?? false,
      sizes: List<String>.from(json['sizes'] ?? []),
      rating: (json['rating'] ?? 0).toDouble(),
    );
  }
}