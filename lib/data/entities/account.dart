import 'package:flutter_starter/data/entities/user_role.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'account.freezed.dart';
part 'account.g.dart';

@freezed
class Account with _$Account {
  @JsonSerializable(fieldRename: FieldRename.none)
  const factory Account({
    required String id,
    required String email,
    required String name,
    required UserRole role,
    @Default(true) bool isActive,
    String? avatar,
    String? createdAt,
    String? updatedAt,
    String? activeStudentId,
  }) = _Account;

  factory Account.fromJson(Map<String, Object?> json) => _$AccountFromJson(json);
}
