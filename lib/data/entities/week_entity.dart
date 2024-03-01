
import 'package:freezed_annotation/freezed_annotation.dart';

part 'week_entity.freezed.dart';
part 'week_entity.g.dart';

@freezed
class Week with _$Week {
  const factory Week({
    @Default("любая") String weeks,

  }) = _Week;

  factory Week.fromJson(Map<String, Object?> json) => _$WeekFromJson(json);
}
extension WeekX on Week {
  List<int>getWeeks() {
    String value = weeks.toLowerCase();
    if (value == "чётная" || value == "четная") {
      return [0, 2, 4, 6, 8, 10, 12, 14, 16, 18, 20];
    } else if (value == "нечётная" || value == "нечетная") {
      return [1, 3, 5, 7, 9, 11, 13, 15, 17, 19];
    } else if(value=="любая") {
      return [1,2, 3,4, 5,6, 7,8, 9,10, 11,12, 13,14, 15,16, 17,18, 19,20];
    }

    else {
      List<int> returned = [];
      for (var value in weeks.split(" ")) {
        returned.add(int.parse(value));
      }
      return returned;
    }
  }
}