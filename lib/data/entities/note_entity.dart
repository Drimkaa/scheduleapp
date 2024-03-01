
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:scheduleapp/data/entities/date_entity.dart';

part 'note_entity.freezed.dart';
part 'note_entity.g.dart';

@freezed
class Note with _$Note {
  const factory Note({
    required int id,
    required int lessonId,
    required String text,
    required Date date,

  }) = _Note;

  factory Note.fromJson(Map<String, Object?> json) => _$NoteFromJson(json);
}

