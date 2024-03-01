// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lesson_time_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LessonTime _$LessonTimeFromJson(Map<String, dynamic> json) {
  return _LessonTime.fromJson(json);
}

/// @nodoc
mixin _$LessonTime {
  String get start => throw _privateConstructorUsedError;
  String get end => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LessonTimeCopyWith<LessonTime> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LessonTimeCopyWith<$Res> {
  factory $LessonTimeCopyWith(
          LessonTime value, $Res Function(LessonTime) then) =
      _$LessonTimeCopyWithImpl<$Res, LessonTime>;
  @useResult
  $Res call({String start, String end, String label});
}

/// @nodoc
class _$LessonTimeCopyWithImpl<$Res, $Val extends LessonTime>
    implements $LessonTimeCopyWith<$Res> {
  _$LessonTimeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? start = null,
    Object? end = null,
    Object? label = null,
  }) {
    return _then(_value.copyWith(
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as String,
      end: null == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LessonTimeImplCopyWith<$Res>
    implements $LessonTimeCopyWith<$Res> {
  factory _$$LessonTimeImplCopyWith(
          _$LessonTimeImpl value, $Res Function(_$LessonTimeImpl) then) =
      __$$LessonTimeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String start, String end, String label});
}

/// @nodoc
class __$$LessonTimeImplCopyWithImpl<$Res>
    extends _$LessonTimeCopyWithImpl<$Res, _$LessonTimeImpl>
    implements _$$LessonTimeImplCopyWith<$Res> {
  __$$LessonTimeImplCopyWithImpl(
      _$LessonTimeImpl _value, $Res Function(_$LessonTimeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? start = null,
    Object? end = null,
    Object? label = null,
  }) {
    return _then(_$LessonTimeImpl(
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as String,
      end: null == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LessonTimeImpl with DiagnosticableTreeMixin implements _LessonTime {
  const _$LessonTimeImpl(
      {this.start = "8:00", this.end = "9:35", this.label = "1 пара"});

  factory _$LessonTimeImpl.fromJson(Map<String, dynamic> json) =>
      _$$LessonTimeImplFromJson(json);

  @override
  @JsonKey()
  final String start;
  @override
  @JsonKey()
  final String end;
  @override
  @JsonKey()
  final String label;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LessonTime(start: $start, end: $end, label: $label)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LessonTime'))
      ..add(DiagnosticsProperty('start', start))
      ..add(DiagnosticsProperty('end', end))
      ..add(DiagnosticsProperty('label', label));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LessonTimeImpl &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.end, end) || other.end == end) &&
            (identical(other.label, label) || other.label == label));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, start, end, label);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LessonTimeImplCopyWith<_$LessonTimeImpl> get copyWith =>
      __$$LessonTimeImplCopyWithImpl<_$LessonTimeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LessonTimeImplToJson(
      this,
    );
  }
}

abstract class _LessonTime implements LessonTime {
  const factory _LessonTime(
      {final String start,
      final String end,
      final String label}) = _$LessonTimeImpl;

  factory _LessonTime.fromJson(Map<String, dynamic> json) =
      _$LessonTimeImpl.fromJson;

  @override
  String get start;
  @override
  String get end;
  @override
  String get label;
  @override
  @JsonKey(ignore: true)
  _$$LessonTimeImplCopyWith<_$LessonTimeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
