// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'view_module_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ViewModuleModel {
  String get type;
  String get title;
  String get subTitle;
  String get imageUrl;

  /// Create a copy of ViewModuleModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ViewModuleModelCopyWith<ViewModuleModel> get copyWith =>
      _$ViewModuleModelCopyWithImpl<ViewModuleModel>(
          this as ViewModuleModel, _$identity);

  /// Serializes this ViewModuleModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ViewModuleModel &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subTitle, subTitle) ||
                other.subTitle == subTitle) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, type, title, subTitle, imageUrl);

  @override
  String toString() {
    return 'ViewModuleModel(type: $type, title: $title, subTitle: $subTitle, imageUrl: $imageUrl)';
  }
}

/// @nodoc
abstract mixin class $ViewModuleModelCopyWith<$Res> {
  factory $ViewModuleModelCopyWith(
          ViewModuleModel value, $Res Function(ViewModuleModel) _then) =
      _$ViewModuleModelCopyWithImpl;
  @useResult
  $Res call({String type, String title, String subTitle, String imageUrl});
}

/// @nodoc
class _$ViewModuleModelCopyWithImpl<$Res>
    implements $ViewModuleModelCopyWith<$Res> {
  _$ViewModuleModelCopyWithImpl(this._self, this._then);

  final ViewModuleModel _self;
  final $Res Function(ViewModuleModel) _then;

  /// Create a copy of ViewModuleModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? title = null,
    Object? subTitle = null,
    Object? imageUrl = null,
  }) {
    return _then(_self.copyWith(
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      subTitle: null == subTitle
          ? _self.subTitle
          : subTitle // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _self.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _ViewModuleModel implements ViewModuleModel {
  const _ViewModuleModel(
      {required this.type,
      required this.title,
      required this.subTitle,
      required this.imageUrl});
  factory _ViewModuleModel.fromJson(Map<String, dynamic> json) =>
      _$ViewModuleModelFromJson(json);

  @override
  final String type;
  @override
  final String title;
  @override
  final String subTitle;
  @override
  final String imageUrl;

  /// Create a copy of ViewModuleModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ViewModuleModelCopyWith<_ViewModuleModel> get copyWith =>
      __$ViewModuleModelCopyWithImpl<_ViewModuleModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ViewModuleModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ViewModuleModel &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.subTitle, subTitle) ||
                other.subTitle == subTitle) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, type, title, subTitle, imageUrl);

  @override
  String toString() {
    return 'ViewModuleModel(type: $type, title: $title, subTitle: $subTitle, imageUrl: $imageUrl)';
  }
}

/// @nodoc
abstract mixin class _$ViewModuleModelCopyWith<$Res>
    implements $ViewModuleModelCopyWith<$Res> {
  factory _$ViewModuleModelCopyWith(
          _ViewModuleModel value, $Res Function(_ViewModuleModel) _then) =
      __$ViewModuleModelCopyWithImpl;
  @override
  @useResult
  $Res call({String type, String title, String subTitle, String imageUrl});
}

/// @nodoc
class __$ViewModuleModelCopyWithImpl<$Res>
    implements _$ViewModuleModelCopyWith<$Res> {
  __$ViewModuleModelCopyWithImpl(this._self, this._then);

  final _ViewModuleModel _self;
  final $Res Function(_ViewModuleModel) _then;

  /// Create a copy of ViewModuleModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? type = null,
    Object? title = null,
    Object? subTitle = null,
    Object? imageUrl = null,
  }) {
    return _then(_ViewModuleModel(
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      subTitle: null == subTitle
          ? _self.subTitle
          : subTitle // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _self.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
