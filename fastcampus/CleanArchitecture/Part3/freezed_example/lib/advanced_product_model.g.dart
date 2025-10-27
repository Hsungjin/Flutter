// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'advanced_product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdvancedProductModel _$AdvancedProductModelFromJson(
  Map<String, dynamic> json,
) => AdvancedProductModel(
  id: (json['id'] as num?)?.toInt(),
  title: json['title'] as String?,
  description: json['description'] as String?,
  category: json['category'] as String?,
  price: json['price'] as num?,
  discountPercentage: json['discountPercentage'] as num?,
  rating: json['rating'] as num?,
  stock: (json['stock'] as num?)?.toInt(),
  tags: json['tags'] as List<dynamic>?,
  dimensions: json['dimensions'] == null
      ? null
      : AdvancedDimensionsModel.fromJson(
          json['dimensions'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$AdvancedProductModelToJson(
  AdvancedProductModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'description': instance.description,
  'category': instance.category,
  'price': instance.price,
  'discountPercentage': instance.discountPercentage,
  'rating': instance.rating,
  'stock': instance.stock,
  'tags': instance.tags,
  'dimensions': instance.dimensions,
};
