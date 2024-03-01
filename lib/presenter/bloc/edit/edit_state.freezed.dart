// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EditState {
  EditStateStatus get status => throw _privateConstructorUsedError;
  Map<Weekday, List<String>> get selectedLessons =>
      throw _privateConstructorUsedError;
  int get selectedCount => throw _privateConstructorUsedError;
  Exception? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EditStateCopyWith<EditState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditStateCopyWith<$Res> {
  factory $EditStateCopyWith(EditState value, $Res Function(EditState) then) =
      _$EditStateCopyWithImpl<$Res, EditState>;
  @useResult
  $Res call(
      {EditStateStatus status,
      Map<Weekday, List<String>> selectedLessons,
      int selectedCount,
      Exception? error});
}

/// @nodoc
class _$EditStateCopyWithImpl<$Res, $Val extends EditState>
    implements $EditStateCopyWith<$Res> {
  _$EditStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? selectedLessons = null,
    Object? selectedCount = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as EditStateStatus,
      selectedLessons: null == selectedLessons
          ? _value.selectedLessons
          : selectedLessons // ignore: cast_nullable_to_non_nullable
              as Map<Weekday, List<String>>,
      selectedCount: null == selectedCount
          ? _value.selectedCount
          : selectedCount // ignore: cast_nullable_to_non_nullable
              as int,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Exception?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EditStateImplCopyWith<$Res>
    implements $EditStateCopyWith<$Res> {
  factory _$$EditStateImplCopyWith(
          _$EditStateImpl value, $Res Function(_$EditStateImpl) then) =
      __$$EditStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {EditStateStatus status,
      Map<Weekday, List<String>> selectedLessons,
      int selectedCount,
      Exception? error});
}

/// @nodoc
class __$$EditStateImplCopyWithImpl<$Res>
    extends _$EditStateCopyWithImpl<$Res, _$EditStateImpl>
    implements _$$EditStateImplCopyWith<$Res> {
  __$$EditStateImplCopyWithImpl(
      _$EditStateImpl _value, $Res Function(_$EditStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? selectedLessons = null,
    Object? selectedCount = null,
    Object? error = freezed,
  }) {
    return _then(_$EditStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as EditStateStatus,
      selectedLessons: null == selectedLessons
          ? _value._selectedLessons
          : selectedLessons // ignore: cast_nullable_to_non_nullable
              as Map<Weekday, List<String>>,
      selectedCount: null == selectedCount
          ? _value.selectedCount
          : selectedCount // ignore: cast_nullable_to_non_nullable
              as int,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Exception?,
    ));
  }
}

/// @nodoc

class _$EditStateImpl extends _EditState {
  const _$EditStateImpl(
      {this.status = EditStateStatus.initial,
      final Map<Weekday, List<String>> selectedLessons = const {},
      this.selectedCount = 0,
      this.error})
      : _selectedLessons = selectedLessons,
        super._();

  @override
  @JsonKey()
  final EditStateStatus status;
  final Map<Weekday, List<String>> _selectedLessons;
  @override
  @JsonKey()
  Map<Weekday, List<String>> get selectedLessons {
    if (_selectedLessons is EqualUnmodifiableMapView) return _selectedLessons;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_selectedLessons);
  }

  @override
  @JsonKey()
  final int selectedCount;
  @override
  final Exception? error;

  @override
  String toString() {
    return 'EditState(status: $status, selectedLessons: $selectedLessons, selectedCount: $selectedCount, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._selectedLessons, _selectedLessons) &&
            (identical(other.selectedCount, selectedCount) ||
                other.selectedCount == selectedCount) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      const DeepCollectionEquality().hash(_selectedLessons),
      selectedCount,
      error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EditStateImplCopyWith<_$EditStateImpl> get copyWith =>
      __$$EditStateImplCopyWithImpl<_$EditStateImpl>(this, _$identity);
}

abstract class _EditState extends EditState {
  const factory _EditState(
      {final EditStateStatus status,
      final Map<Weekday, List<String>> selectedLessons,
      final int selectedCount,
      final Exception? error}) = _$EditStateImpl;
  const _EditState._() : super._();

  @override
  EditStateStatus get status;
  @override
  Map<Weekday, List<String>> get selectedLessons;
  @override
  int get selectedCount;
  @override
  Exception? get error;
  @override
  @JsonKey(ignore: true)
  _$$EditStateImplCopyWith<_$EditStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
