// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'day_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DayState {
  DateStateStatus get status => throw _privateConstructorUsedError;
  List<LessonBloc> get lessons => throw _privateConstructorUsedError;
  Weekday get day => throw _privateConstructorUsedError;
  bool get displayHiddenLessons => throw _privateConstructorUsedError;
  int get hiddenLessons => throw _privateConstructorUsedError;
  bool get currentDay => throw _privateConstructorUsedError;
  bool get showLessons => throw _privateConstructorUsedError;
  Exception? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DayStateCopyWith<DayState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DayStateCopyWith<$Res> {
  factory $DayStateCopyWith(DayState value, $Res Function(DayState) then) =
      _$DayStateCopyWithImpl<$Res, DayState>;
  @useResult
  $Res call(
      {DateStateStatus status,
      List<LessonBloc> lessons,
      Weekday day,
      bool displayHiddenLessons,
      int hiddenLessons,
      bool currentDay,
      bool showLessons,
      Exception? error});
}

/// @nodoc
class _$DayStateCopyWithImpl<$Res, $Val extends DayState>
    implements $DayStateCopyWith<$Res> {
  _$DayStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? lessons = null,
    Object? day = null,
    Object? displayHiddenLessons = null,
    Object? hiddenLessons = null,
    Object? currentDay = null,
    Object? showLessons = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DateStateStatus,
      lessons: null == lessons
          ? _value.lessons
          : lessons // ignore: cast_nullable_to_non_nullable
              as List<LessonBloc>,
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as Weekday,
      displayHiddenLessons: null == displayHiddenLessons
          ? _value.displayHiddenLessons
          : displayHiddenLessons // ignore: cast_nullable_to_non_nullable
              as bool,
      hiddenLessons: null == hiddenLessons
          ? _value.hiddenLessons
          : hiddenLessons // ignore: cast_nullable_to_non_nullable
              as int,
      currentDay: null == currentDay
          ? _value.currentDay
          : currentDay // ignore: cast_nullable_to_non_nullable
              as bool,
      showLessons: null == showLessons
          ? _value.showLessons
          : showLessons // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Exception?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DayStateImplCopyWith<$Res>
    implements $DayStateCopyWith<$Res> {
  factory _$$DayStateImplCopyWith(
          _$DayStateImpl value, $Res Function(_$DayStateImpl) then) =
      __$$DayStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateStateStatus status,
      List<LessonBloc> lessons,
      Weekday day,
      bool displayHiddenLessons,
      int hiddenLessons,
      bool currentDay,
      bool showLessons,
      Exception? error});
}

/// @nodoc
class __$$DayStateImplCopyWithImpl<$Res>
    extends _$DayStateCopyWithImpl<$Res, _$DayStateImpl>
    implements _$$DayStateImplCopyWith<$Res> {
  __$$DayStateImplCopyWithImpl(
      _$DayStateImpl _value, $Res Function(_$DayStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? lessons = null,
    Object? day = null,
    Object? displayHiddenLessons = null,
    Object? hiddenLessons = null,
    Object? currentDay = null,
    Object? showLessons = null,
    Object? error = freezed,
  }) {
    return _then(_$DayStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DateStateStatus,
      lessons: null == lessons
          ? _value._lessons
          : lessons // ignore: cast_nullable_to_non_nullable
              as List<LessonBloc>,
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as Weekday,
      displayHiddenLessons: null == displayHiddenLessons
          ? _value.displayHiddenLessons
          : displayHiddenLessons // ignore: cast_nullable_to_non_nullable
              as bool,
      hiddenLessons: null == hiddenLessons
          ? _value.hiddenLessons
          : hiddenLessons // ignore: cast_nullable_to_non_nullable
              as int,
      currentDay: null == currentDay
          ? _value.currentDay
          : currentDay // ignore: cast_nullable_to_non_nullable
              as bool,
      showLessons: null == showLessons
          ? _value.showLessons
          : showLessons // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Exception?,
    ));
  }
}

/// @nodoc

class _$DayStateImpl extends _DayState {
  const _$DayStateImpl(
      {this.status = DateStateStatus.initial,
      final List<LessonBloc> lessons = const [],
      this.day = Weekday.monday,
      this.displayHiddenLessons = false,
      this.hiddenLessons = 0,
      this.currentDay = false,
      this.showLessons = false,
      this.error})
      : _lessons = lessons,
        super._();

  @override
  @JsonKey()
  final DateStateStatus status;
  final List<LessonBloc> _lessons;
  @override
  @JsonKey()
  List<LessonBloc> get lessons {
    if (_lessons is EqualUnmodifiableListView) return _lessons;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lessons);
  }

  @override
  @JsonKey()
  final Weekday day;
  @override
  @JsonKey()
  final bool displayHiddenLessons;
  @override
  @JsonKey()
  final int hiddenLessons;
  @override
  @JsonKey()
  final bool currentDay;
  @override
  @JsonKey()
  final bool showLessons;
  @override
  final Exception? error;

  @override
  String toString() {
    return 'DayState(status: $status, lessons: $lessons, day: $day, displayHiddenLessons: $displayHiddenLessons, hiddenLessons: $hiddenLessons, currentDay: $currentDay, showLessons: $showLessons, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DayStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._lessons, _lessons) &&
            (identical(other.day, day) || other.day == day) &&
            (identical(other.displayHiddenLessons, displayHiddenLessons) ||
                other.displayHiddenLessons == displayHiddenLessons) &&
            (identical(other.hiddenLessons, hiddenLessons) ||
                other.hiddenLessons == hiddenLessons) &&
            (identical(other.currentDay, currentDay) ||
                other.currentDay == currentDay) &&
            (identical(other.showLessons, showLessons) ||
                other.showLessons == showLessons) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      const DeepCollectionEquality().hash(_lessons),
      day,
      displayHiddenLessons,
      hiddenLessons,
      currentDay,
      showLessons,
      error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DayStateImplCopyWith<_$DayStateImpl> get copyWith =>
      __$$DayStateImplCopyWithImpl<_$DayStateImpl>(this, _$identity);
}

abstract class _DayState extends DayState {
  const factory _DayState(
      {final DateStateStatus status,
      final List<LessonBloc> lessons,
      final Weekday day,
      final bool displayHiddenLessons,
      final int hiddenLessons,
      final bool currentDay,
      final bool showLessons,
      final Exception? error}) = _$DayStateImpl;
  const _DayState._() : super._();

  @override
  DateStateStatus get status;
  @override
  List<LessonBloc> get lessons;
  @override
  Weekday get day;
  @override
  bool get displayHiddenLessons;
  @override
  int get hiddenLessons;
  @override
  bool get currentDay;
  @override
  bool get showLessons;
  @override
  Exception? get error;
  @override
  @JsonKey(ignore: true)
  _$$DayStateImplCopyWith<_$DayStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
