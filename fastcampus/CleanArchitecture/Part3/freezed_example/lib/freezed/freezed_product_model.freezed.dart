// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'freezed_product_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FreezedProductModel {

 int? get id; String? get title; String? get description; String? get category; num? get price; num? get discountPercentage; num? get rating; int? get stock; List<dynamic>? get tags; FreezedDimensionsModel? get dimensions;
/// Create a copy of FreezedProductModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FreezedProductModelCopyWith<FreezedProductModel> get copyWith => _$FreezedProductModelCopyWithImpl<FreezedProductModel>(this as FreezedProductModel, _$identity);

  /// Serializes this FreezedProductModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FreezedProductModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.category, category) || other.category == category)&&(identical(other.price, price) || other.price == price)&&(identical(other.discountPercentage, discountPercentage) || other.discountPercentage == discountPercentage)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.stock, stock) || other.stock == stock)&&const DeepCollectionEquality().equals(other.tags, tags)&&(identical(other.dimensions, dimensions) || other.dimensions == dimensions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,category,price,discountPercentage,rating,stock,const DeepCollectionEquality().hash(tags),dimensions);

@override
String toString() {
  return 'FreezedProductModel(id: $id, title: $title, description: $description, category: $category, price: $price, discountPercentage: $discountPercentage, rating: $rating, stock: $stock, tags: $tags, dimensions: $dimensions)';
}


}

/// @nodoc
abstract mixin class $FreezedProductModelCopyWith<$Res>  {
  factory $FreezedProductModelCopyWith(FreezedProductModel value, $Res Function(FreezedProductModel) _then) = _$FreezedProductModelCopyWithImpl;
@useResult
$Res call({
 int? id, String? title, String? description, String? category, num? price, num? discountPercentage, num? rating, int? stock, List<dynamic>? tags, FreezedDimensionsModel? dimensions
});


$FreezedDimensionsModelCopyWith<$Res>? get dimensions;

}
/// @nodoc
class _$FreezedProductModelCopyWithImpl<$Res>
    implements $FreezedProductModelCopyWith<$Res> {
  _$FreezedProductModelCopyWithImpl(this._self, this._then);

  final FreezedProductModel _self;
  final $Res Function(FreezedProductModel) _then;

/// Create a copy of FreezedProductModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? title = freezed,Object? description = freezed,Object? category = freezed,Object? price = freezed,Object? discountPercentage = freezed,Object? rating = freezed,Object? stock = freezed,Object? tags = freezed,Object? dimensions = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as num?,discountPercentage: freezed == discountPercentage ? _self.discountPercentage : discountPercentage // ignore: cast_nullable_to_non_nullable
as num?,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as num?,stock: freezed == stock ? _self.stock : stock // ignore: cast_nullable_to_non_nullable
as int?,tags: freezed == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,dimensions: freezed == dimensions ? _self.dimensions : dimensions // ignore: cast_nullable_to_non_nullable
as FreezedDimensionsModel?,
  ));
}
/// Create a copy of FreezedProductModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FreezedDimensionsModelCopyWith<$Res>? get dimensions {
    if (_self.dimensions == null) {
    return null;
  }

  return $FreezedDimensionsModelCopyWith<$Res>(_self.dimensions!, (value) {
    return _then(_self.copyWith(dimensions: value));
  });
}
}


/// Adds pattern-matching-related methods to [FreezedProductModel].
extension FreezedProductModelPatterns on FreezedProductModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FreezedProductModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FreezedProductModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FreezedProductModel value)  $default,){
final _that = this;
switch (_that) {
case _FreezedProductModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FreezedProductModel value)?  $default,){
final _that = this;
switch (_that) {
case _FreezedProductModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String? title,  String? description,  String? category,  num? price,  num? discountPercentage,  num? rating,  int? stock,  List<dynamic>? tags,  FreezedDimensionsModel? dimensions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FreezedProductModel() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.category,_that.price,_that.discountPercentage,_that.rating,_that.stock,_that.tags,_that.dimensions);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String? title,  String? description,  String? category,  num? price,  num? discountPercentage,  num? rating,  int? stock,  List<dynamic>? tags,  FreezedDimensionsModel? dimensions)  $default,) {final _that = this;
switch (_that) {
case _FreezedProductModel():
return $default(_that.id,_that.title,_that.description,_that.category,_that.price,_that.discountPercentage,_that.rating,_that.stock,_that.tags,_that.dimensions);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String? title,  String? description,  String? category,  num? price,  num? discountPercentage,  num? rating,  int? stock,  List<dynamic>? tags,  FreezedDimensionsModel? dimensions)?  $default,) {final _that = this;
switch (_that) {
case _FreezedProductModel() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.category,_that.price,_that.discountPercentage,_that.rating,_that.stock,_that.tags,_that.dimensions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FreezedProductModel implements FreezedProductModel {
  const _FreezedProductModel({this.id, this.title, this.description, this.category, this.price, this.discountPercentage, this.rating, this.stock, final  List<dynamic>? tags, this.dimensions}): _tags = tags;
  factory _FreezedProductModel.fromJson(Map<String, dynamic> json) => _$FreezedProductModelFromJson(json);

@override final  int? id;
@override final  String? title;
@override final  String? description;
@override final  String? category;
@override final  num? price;
@override final  num? discountPercentage;
@override final  num? rating;
@override final  int? stock;
 final  List<dynamic>? _tags;
@override List<dynamic>? get tags {
  final value = _tags;
  if (value == null) return null;
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  FreezedDimensionsModel? dimensions;

/// Create a copy of FreezedProductModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FreezedProductModelCopyWith<_FreezedProductModel> get copyWith => __$FreezedProductModelCopyWithImpl<_FreezedProductModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FreezedProductModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FreezedProductModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.category, category) || other.category == category)&&(identical(other.price, price) || other.price == price)&&(identical(other.discountPercentage, discountPercentage) || other.discountPercentage == discountPercentage)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.stock, stock) || other.stock == stock)&&const DeepCollectionEquality().equals(other._tags, _tags)&&(identical(other.dimensions, dimensions) || other.dimensions == dimensions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,category,price,discountPercentage,rating,stock,const DeepCollectionEquality().hash(_tags),dimensions);

@override
String toString() {
  return 'FreezedProductModel(id: $id, title: $title, description: $description, category: $category, price: $price, discountPercentage: $discountPercentage, rating: $rating, stock: $stock, tags: $tags, dimensions: $dimensions)';
}


}

/// @nodoc
abstract mixin class _$FreezedProductModelCopyWith<$Res> implements $FreezedProductModelCopyWith<$Res> {
  factory _$FreezedProductModelCopyWith(_FreezedProductModel value, $Res Function(_FreezedProductModel) _then) = __$FreezedProductModelCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? title, String? description, String? category, num? price, num? discountPercentage, num? rating, int? stock, List<dynamic>? tags, FreezedDimensionsModel? dimensions
});


@override $FreezedDimensionsModelCopyWith<$Res>? get dimensions;

}
/// @nodoc
class __$FreezedProductModelCopyWithImpl<$Res>
    implements _$FreezedProductModelCopyWith<$Res> {
  __$FreezedProductModelCopyWithImpl(this._self, this._then);

  final _FreezedProductModel _self;
  final $Res Function(_FreezedProductModel) _then;

/// Create a copy of FreezedProductModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? title = freezed,Object? description = freezed,Object? category = freezed,Object? price = freezed,Object? discountPercentage = freezed,Object? rating = freezed,Object? stock = freezed,Object? tags = freezed,Object? dimensions = freezed,}) {
  return _then(_FreezedProductModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as num?,discountPercentage: freezed == discountPercentage ? _self.discountPercentage : discountPercentage // ignore: cast_nullable_to_non_nullable
as num?,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as num?,stock: freezed == stock ? _self.stock : stock // ignore: cast_nullable_to_non_nullable
as int?,tags: freezed == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,dimensions: freezed == dimensions ? _self.dimensions : dimensions // ignore: cast_nullable_to_non_nullable
as FreezedDimensionsModel?,
  ));
}

/// Create a copy of FreezedProductModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FreezedDimensionsModelCopyWith<$Res>? get dimensions {
    if (_self.dimensions == null) {
    return null;
  }

  return $FreezedDimensionsModelCopyWith<$Res>(_self.dimensions!, (value) {
    return _then(_self.copyWith(dimensions: value));
  });
}
}

// dart format on
