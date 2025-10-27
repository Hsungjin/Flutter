import 'package:freezed_example/advanced_dimensions_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'advanced_product_model.g.dart';

@JsonSerializable()
class AdvancedProductModel {
  int? id;
  String? title;
  String? description;
  String? category;
  num? price;
  num? discountPercentage;
  num? rating;
  int? stock;
  List<dynamic>? tags;
  AdvancedDimensionsModel? dimensions;

  AdvancedProductModel({
    this.id,
    this.title,
    this.description,
    this.category,
    this.price,
    this.discountPercentage,
    this.rating,
    this.stock,
    this.tags,
    this.dimensions,
  });

  factory AdvancedProductModel.fromJson(Map<String, dynamic> json) {
    return _$AdvancedProductModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AdvancedProductModelToJson(this);
  }

  @override
  String toString() {
    return 'AdvancedProductModel(id: $id, title: $title, description: $description, category: $category, price: $price, discountPercentage: $discountPercentage, rating: $rating, stock: $stock, tags: $tags, dimensions: ${dimensions?.width}x${dimensions?.height}x${dimensions?.depth})';
  }
}
