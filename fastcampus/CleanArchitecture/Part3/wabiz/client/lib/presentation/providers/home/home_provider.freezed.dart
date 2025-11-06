// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeProviderState {

 List<HomeEntity> get projects;
/// Create a copy of HomeProviderState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeProviderStateCopyWith<HomeProviderState> get copyWith => _$HomeProviderStateCopyWithImpl<HomeProviderState>(this as HomeProviderState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeProviderState&&const DeepCollectionEquality().equals(other.projects, projects));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(projects));

@override
String toString() {
  return 'HomeProviderState(projects: $projects)';
}


}

/// @nodoc
abstract mixin class $HomeProviderStateCopyWith<$Res>  {
  factory $HomeProviderStateCopyWith(HomeProviderState value, $Res Function(HomeProviderState) _then) = _$HomeProviderStateCopyWithImpl;
@useResult
$Res call({
 List<HomeEntity> projects
});




}
/// @nodoc
class _$HomeProviderStateCopyWithImpl<$Res>
    implements $HomeProviderStateCopyWith<$Res> {
  _$HomeProviderStateCopyWithImpl(this._self, this._then);

  final HomeProviderState _self;
  final $Res Function(HomeProviderState) _then;

/// Create a copy of HomeProviderState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? projects = null,}) {
  return _then(_self.copyWith(
projects: null == projects ? _self.projects : projects // ignore: cast_nullable_to_non_nullable
as List<HomeEntity>,
  ));
}

}


/// Adds pattern-matching-related methods to [HomeProviderState].
extension HomeProviderStatePatterns on HomeProviderState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeProviderState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeProviderState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeProviderState value)  $default,){
final _that = this;
switch (_that) {
case _HomeProviderState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeProviderState value)?  $default,){
final _that = this;
switch (_that) {
case _HomeProviderState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<HomeEntity> projects)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeProviderState() when $default != null:
return $default(_that.projects);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<HomeEntity> projects)  $default,) {final _that = this;
switch (_that) {
case _HomeProviderState():
return $default(_that.projects);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<HomeEntity> projects)?  $default,) {final _that = this;
switch (_that) {
case _HomeProviderState() when $default != null:
return $default(_that.projects);case _:
  return null;

}
}

}

/// @nodoc


class _HomeProviderState implements HomeProviderState {
   _HomeProviderState({final  List<HomeEntity> projects = const []}): _projects = projects;
  

 final  List<HomeEntity> _projects;
@override@JsonKey() List<HomeEntity> get projects {
  if (_projects is EqualUnmodifiableListView) return _projects;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_projects);
}


/// Create a copy of HomeProviderState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeProviderStateCopyWith<_HomeProviderState> get copyWith => __$HomeProviderStateCopyWithImpl<_HomeProviderState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeProviderState&&const DeepCollectionEquality().equals(other._projects, _projects));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_projects));

@override
String toString() {
  return 'HomeProviderState(projects: $projects)';
}


}

/// @nodoc
abstract mixin class _$HomeProviderStateCopyWith<$Res> implements $HomeProviderStateCopyWith<$Res> {
  factory _$HomeProviderStateCopyWith(_HomeProviderState value, $Res Function(_HomeProviderState) _then) = __$HomeProviderStateCopyWithImpl;
@override @useResult
$Res call({
 List<HomeEntity> projects
});




}
/// @nodoc
class __$HomeProviderStateCopyWithImpl<$Res>
    implements _$HomeProviderStateCopyWith<$Res> {
  __$HomeProviderStateCopyWithImpl(this._self, this._then);

  final _HomeProviderState _self;
  final $Res Function(_HomeProviderState) _then;

/// Create a copy of HomeProviderState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? projects = null,}) {
  return _then(_HomeProviderState(
projects: null == projects ? _self._projects : projects // ignore: cast_nullable_to_non_nullable
as List<HomeEntity>,
  ));
}


}

// dart format on
