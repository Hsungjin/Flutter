// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'menu_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MenuState {
  Status get status;
  List<MenuModel> get menus;
  ErrorResponse get error;

  /// Create a copy of MenuState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MenuStateCopyWith<MenuState> get copyWith =>
      _$MenuStateCopyWithImpl<MenuState>(this as MenuState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MenuState &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other.menus, menus) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, status, const DeepCollectionEquality().hash(menus), error);

  @override
  String toString() {
    return 'MenuState(status: $status, menus: $menus, error: $error)';
  }
}

/// @nodoc
abstract mixin class $MenuStateCopyWith<$Res> {
  factory $MenuStateCopyWith(MenuState value, $Res Function(MenuState) _then) =
      _$MenuStateCopyWithImpl;
  @useResult
  $Res call({Status status, List<MenuModel> menus, ErrorResponse error});
}

/// @nodoc
class _$MenuStateCopyWithImpl<$Res> implements $MenuStateCopyWith<$Res> {
  _$MenuStateCopyWithImpl(this._self, this._then);

  final MenuState _self;
  final $Res Function(MenuState) _then;

  /// Create a copy of MenuState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? menus = null,
    Object? error = null,
  }) {
    return _then(_self.copyWith(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      menus: null == menus
          ? _self.menus
          : menus // ignore: cast_nullable_to_non_nullable
              as List<MenuModel>,
      error: null == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as ErrorResponse,
    ));
  }
}

/// @nodoc

class _MenuState implements MenuState {
  _MenuState(
      {this.status = Status.initial,
      final List<MenuModel> menus = const [],
      this.error = const ErrorResponse()})
      : _menus = menus;

  @override
  @JsonKey()
  final Status status;
  final List<MenuModel> _menus;
  @override
  @JsonKey()
  List<MenuModel> get menus {
    if (_menus is EqualUnmodifiableListView) return _menus;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_menus);
  }

  @override
  @JsonKey()
  final ErrorResponse error;

  /// Create a copy of MenuState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MenuStateCopyWith<_MenuState> get copyWith =>
      __$MenuStateCopyWithImpl<_MenuState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MenuState &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._menus, _menus) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, status, const DeepCollectionEquality().hash(_menus), error);

  @override
  String toString() {
    return 'MenuState(status: $status, menus: $menus, error: $error)';
  }
}

/// @nodoc
abstract mixin class _$MenuStateCopyWith<$Res>
    implements $MenuStateCopyWith<$Res> {
  factory _$MenuStateCopyWith(
          _MenuState value, $Res Function(_MenuState) _then) =
      __$MenuStateCopyWithImpl;
  @override
  @useResult
  $Res call({Status status, List<MenuModel> menus, ErrorResponse error});
}

/// @nodoc
class __$MenuStateCopyWithImpl<$Res> implements _$MenuStateCopyWith<$Res> {
  __$MenuStateCopyWithImpl(this._self, this._then);

  final _MenuState _self;
  final $Res Function(_MenuState) _then;

  /// Create a copy of MenuState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
    Object? menus = null,
    Object? error = null,
  }) {
    return _then(_MenuState(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      menus: null == menus
          ? _self._menus
          : menus // ignore: cast_nullable_to_non_nullable
              as List<MenuModel>,
      error: null == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as ErrorResponse,
    ));
  }
}

// dart format on
