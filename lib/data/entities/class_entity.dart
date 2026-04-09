import 'package:freezed_annotation/freezed_annotation.dart';

part 'class_entity.freezed.dart';
part 'class_entity.g.dart';

@freezed
class ClassEntity with _$ClassEntity {
  @JsonSerializable(fieldRename: FieldRename.none)
  const factory ClassEntity({
    required String id,
    required String name,
    String? grade,
    String? academicYear,
    String? status,
    int? maxStudents,
    DateTime? archivedAt,
    String? clonedFromId,
    String? homeroomTeacherId,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _ClassEntity;

  factory ClassEntity.fromJson(Map<String, dynamic> json) => _$ClassEntityFromJson(json);
}
