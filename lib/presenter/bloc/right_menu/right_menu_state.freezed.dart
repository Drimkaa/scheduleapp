// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'right_menu_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RightMenuState {
  RightMenuStateStatus get status => throw _privateConstructorUsedError;
  int get selected => throw _privateConstructorUsedError;
  bool get currentWeek => throw _privateConstructorUsedError;
  List<GlobalKey<State<StatefulWidget>>> get keys =>
      throw _privateConstructorUsedError;
  List<Weekday> get days => throw _privateConstructorUsedError;
  int get currentDay => throw _privateConstructorUsedError;
  bool get isPressed => throw _privateConstructorUsedError;
  Exception? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RightMenuStateCopyWith<RightMenuState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RightMenuStateCopyWith<$Res> {
  factory $RightMenuStateCopyWith(
          RightMenuState value, $Res Function(RightMenuState) then) =
      _$RightMenuStateCopyWithImpl<$Res, RightMenuState>;
  @useResult
  $Res call(
      {RightMenuStateStatus status,
      int selected,
      bool currentWeek,
      List<GlobalKey<State<StatefulWidget>>> keys,
      List<Weekday> days,
      int currentDay,
      bool isPressed,
      Exception? error});
}

/// @nodoc
class _$RightMenuStateCopyWithImpl<$Res, $Val extends RightMenuState>
    implements $RightMenuStateCopyWith<$Res> {
  _$RightMenuStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? selected = null,
    Object? currentWeek = null,
    Object? keys = null,
    Object? days = null,
    Object? currentDay = null,
    Object? isPressed = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as RightMenuStateStatus,
      selected: null == selected
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as int,
      currentWeek: null == currentWeek
          ? _value.currentWeek
          : currentWeek // ignore: cast_nullable_to_non_nullable
              as bool,
      keys: null == keys
          ? _value.keys
          : keys // ignore: cast_nullable_to_non_nullable
              as List<GlobalKey<State<StatefulWidget>>>,
      days: null == days
          ? _value.days
          : days // ignore: cast_nullable_to_non_nullable
              as List<Weekday>,
      currentDay: null == currentDay
          ? _value.currentDay
          : currentDay // ignore: cast_nullable_to_non_nullable
              as int,
      isPressed: null == isPressed
          ? _value.isPressed
          : isPressed // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Exception?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RightMenuStateImplCopyWith<$Res>
    implements $RightMenuStateCopyWith<$Res> {
  factory _$$RightMenuStateImplCopyWith(_$RightMenuStateImpl value,
          $Res Function(_$RightMenuStateImpl) then) =
      __$$RightMenuStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {RightMenuStateStatus status,
      int selected,
      bool currentWeek,
      List<GlobalKey<State<StatefulWidget>>> keys,
      List<Weekday> days,
      int currentDay,
      bool isPressed,
      Exception? error});
}

/// @nodoc
class __$$RightMenuStateImplCopyWithImpl<$Res>
    extends _$RightMenuStateCopyWithImpl<$Res, _$RightMenuStateImpl>
    implements _$$RightMenuStateImplCopyWith<$Res> {
  __$$RightMenuStateImplCopyWithImpl(
      _$RightMenuStateImpl _value, $Res Function(_$RightMenuStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? selected = null,
    Object? currentWeek = null,
    Object? keys = null,
    Object? days = null,
    Object? currentDay = null,
    Object? isPressed = null,
    Object? error = freezed,
  }) {
    return _then(_$RightMenuStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as RightMenuStateStatus,
      selected: null == selected
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as int,
      currentWeek: null == currentWeek
          ? _value.currentWeek
          : currentWeek // ignore: cast_nullable_to_non_nullable
              as bool,
      keys: null == keys
          ? _value._keys
          : keys // ignore: cast_nullable_to_non_nullable
              as List<GlobalKey<State<StatefulWidget>>>,
      days: null == days
          ? _value._days
          : days // ignore: cast_nullable_to_non_nullable
              as List<Weekday>,
      currentDay: null == currentDay
          ? _value.currentDay
          : currentDay // ignore: cast_nullable_to_non_nullable
              as int,
      isPressed: null == isPressed
          ? _value.isPressed
          : isPressed // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Exception?,
    ));
  }
}

/// @nodoc

class _$RightMenuStateImpl extends _RightMenuState {
  const _$RightMenuStateImpl(
      {this.status = RightMenuStateStatus.empty,
      this.selected = -1,
      this.currentWeek = false,
      final List<GlobalKey<State<StatefulWidget>>> keys = const [],
      final List<Weekday> days = const [],
      this.currentDay = -1,
      this.isPressed = false,
      this.error})
      : _keys = keys,
        _days = days,
        super._();

  @override
  @JsonKey()
  final RightMenuStateStatus status;
  @override
  @JsonKey()
  final int selected;
  @override
  @JsonKey()
  final bool currentWeek;
  final List<GlobalKey<State<StatefulWidget>>> _keys;
  @override
  @JsonKey()
  List<GlobalKey<State<StatefulWidget>>> get keys {
    if (_keys is EqualUnmodifiableListView) return _keys;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_keys);
  }

  final List<Weekday> _days;
  @override
  @JsonKey()
  List<Weekday> get days {
    if (_days is EqualUnmodifiableListView) return _days;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_days);
  }

  @override
  @JsonKey()
  final int currentDay;
  @override
  @JsonKey()
  final bool isPressed;
  @override
  final Exception? error;

  @override
  String toString() {
    return 'RightMenuState(status: $status, selected: $selected, currentWeek: $currentWeek, keys: $keys, days: $days, currentDay: $currentDay, isPressed: $isPressed, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RightMenuStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.selected, selected) ||
                other.selected == selected) &&
            (identical(other.currentWeek, currentWeek) ||
                other.currentWeek == currentWeek) &&
            const DeepCollectionEquality().equals(other._keys, _keys) &&
            const DeepCollectionEquality().equals(other._days, _days) &&
            (identical(other.currentDay, currentDay) ||
                other.currentDay == currentDay) &&
            (identical(other.isPressed, isPressed) ||
                other.isPressed == isPressed) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      selected,
      currentWeek,
      const DeepCollectionEquality().hash(_keys),
      const DeepCollectionEquality().hash(_days),
      currentDay,
      isPressed,
      error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RightMenuStateImplCopyWith<_$RightMenuStateImpl> get copyWith =>
      __$$RightMenuStateImplCopyWithImpl<_$RightMenuStateImpl>(
          this, _$identity);
}

abstract class _RightMenuState extends RightMenuState {
  const factory _RightMenuState(
      {final RightMenuStateStatus status,
      final int selected,
      final bool currentWeek,
      final List<GlobalKey<State<StatefulWidget>>> keys,
      final List<Weekday> days,
      final int currentDay,
      final bool isPressed,
      final Exception? error}) = _$RightMenuStateImpl;
  const _RightMenuState._() : super._();

  @override
  RightMenuStateStatus get status;
  @override
  int get selected;
  @override
  bool get currentWeek;
  @override
  List<GlobalKey<State<StatefulWidget>>> get keys;
  @override
  List<Weekday> get days;
  @override
  int get currentDay;
  @override
  bool get isPressed;
  @override
  Exception? get error;
  @override
  @JsonKey(ignore: true)
  _$$RightMenuStateImplCopyWith<_$RightMenuStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
