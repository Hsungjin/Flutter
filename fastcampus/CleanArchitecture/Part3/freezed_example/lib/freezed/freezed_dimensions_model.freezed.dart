// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'freezed_dimensions_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FreezedDimensionsModel {

 double? get width; double? get height; double? get depth;
/// Create a copy of FreezedDimensionsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FreezedDimensionsModelCopyWith<FreezedDimensionsModel> get copyWith => _$FreezedDimensionsModelCopyWithImpl<FreezedDimensionsModel>(this as FreezedDimensionsModel, _$identity);

  /// Serializes this FreezedDimensionsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FreezedDimensionsModel&&(identical(other.width, width) || other.width == width)&&(identical(other.height, height) || other.height == height)&&(identical(other.depth, depth) || other.depth == depth));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,width,height,depth);

@override
String toString() {
  return 'FreezedDimensionsModel(width: $width, height: $height, depth: $depth)';
}


}

/// @nodoc
abstract mixin class $FreezedDimensionsModelCopyWith<$Res>  {
  factory $FreezedDimensionsModelCopyWith(FreezedDimensionsModel value, $Res Function(FreezedDimensionsModel) _then) = _$FreezedDimensionsModelCopyWithImpl;
@useResult
$Res call({
 double? width, double? height, double? depth
});




}
/// @nodoc
class _$FreezedDimensionsModelCopyWithImpl<$Res>
    implements $FreezedDimensionsModelCopyWith<$Res> {
  _$FreezedDimensionsModelCopyWithImpl(this._self, this._then);

  final FreezedDimensionsModel _self;
  final $Res Function(FreezedDimensionsModel) _then;

/// Create a copy of FreezedDimensionsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? width = freezed,Object? height = freezed,Object? depth = freezed,}) {
  return _then(_self.copyWith(
width: freezed == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as double?,height: freezed == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as double?,depth: freezed == depth ? _self.depth : depth // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [FreezedDimensionsModel].
extension FreezedDimensionsModelPatterns on FreezedDimensionsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FreezedDimensionsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FreezedDimensionsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FreezedDimensionsModel value)  $default,){
final _that = this;
switch (_that) {
case _FreezedDimensionsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FreezedDimensionsModel value)?  $default,){
final _that = this;
switch (_that) {
case _FreezedDimensionsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double? width,  double? height,  double? depth)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FreezedDimensionsModel() when $default != null:
return $default(_that.width,_that.height,_that.depth);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double? width,  double? height,  double? depth)  $default,) {final _that = this;
switch (_that) {
case _FreezedDimensionsModel():
return $default(_that.width,_that.height,_that.depth);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double? width,  double? height,  double? depth)?  $default,) {final _that = this;
switch (_that) {
case _FreezedDimensionsModel() when $default != null:
return $default(_that.width,_that.height,_that.depth);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FreezedDimensionsModel implements FreezedDimensionsModel {
  const _FreezedDimensionsModel({this.width, this.height, this.depth});
  factory _FreezedDimensionsModel.fromJson(Map<String, dynamic> json) => _$FreezedDimensionsModelFromJson(json);

@override final  double? width;
@override final  double? height;
@override final  double? depth;

/// Create a copy of FreezedDimensionsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FreezedDimensionsModelCopyWith<_FreezedDimensionsModel> get copyWith => __$FreezedDimensionsModelCopyWithImpl<_FreezedDimensionsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FreezedDimensionsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FreezedDimensionsModel&&(identical(other.width, width) || other.width == width)&&(identical(other.height, height) || other.height == height)&&(identical(other.depth, depth) || other.depth == depth));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,width,height,depth);

@override
String toString() {
  return 'FreezedDimensionsModel(width: $width, height: $height, depth: $depth)';
}


}

/// @nodoc
abstract mixin class _$FreezedDimensionsModelCopyWith<$Res> implements $FreezedDimensionsModelCopyWith<$Res> {
  factory _$FreezedDimensionsModelCopyWith(_FreezedDimensionsModel value, $Res Function(_FreezedDimensionsModel) _then) = __$FreezedDimensionsModelCopyWithImpl;
@override @useResult
$Res call({
 double? width, double? height, double? depth
});




}
/// @nodoc
class __$FreezedDimensionsModelCopyWithImpl<$Res>
    implements _$FreezedDimensionsModelCopyWith<$Res> {
  __$FreezedDimensionsModelCopyWithImpl(this._self, this._then);

  final _FreezedDimensionsModel _self;
  final $Res Function(_FreezedDimensionsModel) _then;

/// Create a copy of FreezedDimensionsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? width = freezed,Object? height = freezed,Object? depth = freezed,}) {
  return _then(_FreezedDimensionsModel(
width: freezed == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as double?,height: freezed == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as double?,depth: freezed == depth ? _self.depth : depth // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
