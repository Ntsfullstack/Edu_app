import 'package:freezed_annotation/freezed_annotation.dart';

part 'shift.freezed.dart';
part 'shift.g.dart';

@freezed
class Shift with _$Shift {
  @JsonSerializable(fieldRename: FieldRename.none)
  const factory Shift({
    required String id,
    required String name,
    required String startTime,
    required String endTime,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _Shift;

  factory Shift.fromJson(Map<String, dynamic> json) => _$ShiftFromJson(json);
}
