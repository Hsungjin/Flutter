// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_page_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MyPageState {

 bool? get loginState; LoginModel? get loginModel;
/// Create a copy of MyPageState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MyPageStateCopyWith<MyPageState> get copyWith => _$MyPageStateCopyWithImpl<MyPageState>(this as MyPageState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyPageState&&(identical(other.loginState, loginState) || other.loginState == loginState)&&(identical(other.loginModel, loginModel) || other.loginModel == loginModel));
}


@override
int get hashCode => Object.hash(runtimeType,loginState,loginModel);

@override
String toString() {
  return 'MyPageState(loginState: $loginState, loginModel: $loginModel)';
}


}

/// @nodoc
abstract mixin class $MyPageStateCopyWith<$Res>  {
  factory $MyPageStateCopyWith(MyPageState value, $Res Function(MyPageState) _then) = _$MyPageStateCopyWithImpl;
@useResult
$Res call({
 bool? loginState, LoginModel? loginModel
});


$LoginModelCopyWith<$Res>? get loginModel;

}
/// @nodoc
class _$MyPageStateCopyWithImpl<$Res>
    implements $MyPageStateCopyWith<$Res> {
  _$MyPageStateCopyWithImpl(this._self, this._then);

  final MyPageState _self;
  final $Res Function(MyPageState) _then;

/// Create a copy of MyPageState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? loginState = freezed,Object? loginModel = freezed,}) {
  return _then(_self.copyWith(
loginState: freezed == loginState ? _self.loginState : loginState // ignore: cast_nullable_to_non_nullable
as bool?,loginModel: freezed == loginModel ? _self.loginModel : loginModel // ignore: cast_nullable_to_non_nullable
as LoginModel?,
  ));
}
/// Create a copy of MyPageState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LoginModelCopyWith<$Res>? get loginModel {
    if (_self.loginModel == null) {
    return null;
  }

  return $LoginModelCopyWith<$Res>(_self.loginModel!, (value) {
    return _then(_self.copyWith(loginModel: value));
  });
}
}


/// Adds pattern-matching-related methods to [MyPageState].
extension MyPageStatePatterns on MyPageState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MyPageState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MyPageState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MyPageState value)  $default,){
final _that = this;
switch (_that) {
case _MyPageState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MyPageState value)?  $default,){
final _that = this;
switch (_that) {
case _MyPageState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool? loginState,  LoginModel? loginModel)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MyPageState() when $default != null:
return $default(_that.loginState,_that.loginModel);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool? loginState,  LoginModel? loginModel)  $default,) {final _that = this;
switch (_that) {
case _MyPageState():
return $default(_that.loginState,_that.loginModel);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool? loginState,  LoginModel? loginModel)?  $default,) {final _that = this;
switch (_that) {
case _MyPageState() when $default != null:
return $default(_that.loginState,_that.loginModel);case _:
  return null;

}
}

}

/// @nodoc


class _MyPageState implements MyPageState {
   _MyPageState({this.loginState, this.loginModel});
  

@override final  bool? loginState;
@override final  LoginModel? loginModel;

/// Create a copy of MyPageState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MyPageStateCopyWith<_MyPageState> get copyWith => __$MyPageStateCopyWithImpl<_MyPageState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MyPageState&&(identical(other.loginState, loginState) || other.loginState == loginState)&&(identical(other.loginModel, loginModel) || other.loginModel == loginModel));
}


@override
int get hashCode => Object.hash(runtimeType,loginState,loginModel);

@override
String toString() {
  return 'MyPageState(loginState: $loginState, loginModel: $loginModel)';
}


}

/// @nodoc
abstract mixin class _$MyPageStateCopyWith<$Res> implements $MyPageStateCopyWith<$Res> {
  factory _$MyPageStateCopyWith(_MyPageState value, $Res Function(_MyPageState) _then) = __$MyPageStateCopyWithImpl;
@override @useResult
$Res call({
 bool? loginState, LoginModel? loginModel
});


@override $LoginModelCopyWith<$Res>? get loginModel;

}
/// @nodoc
class __$MyPageStateCopyWithImpl<$Res>
    implements _$MyPageStateCopyWith<$Res> {
  __$MyPageStateCopyWithImpl(this._self, this._then);

  final _MyPageState _self;
  final $Res Function(_MyPageState) _then;

/// Create a copy of MyPageState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? loginState = freezed,Object? loginModel = freezed,}) {
  return _then(_MyPageState(
loginState: freezed == loginState ? _self.loginState : loginState // ignore: cast_nullable_to_non_nullable
as bool?,loginModel: freezed == loginModel ? _self.loginModel : loginModel // ignore: cast_nullable_to_non_nullable
as LoginModel?,
  ));
}

/// Create a copy of MyPageState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LoginModelCopyWith<$Res>? get loginModel {
    if (_self.loginModel == null) {
    return null;
  }

  return $LoginModelCopyWith<$Res>(_self.loginModel!, (value) {
    return _then(_self.copyWith(loginModel: value));
  });
}
}

// dart format on
