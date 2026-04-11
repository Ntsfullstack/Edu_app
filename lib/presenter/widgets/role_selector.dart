import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/data/entities/user_role.dart';
import 'package:flutter_starter/data/states/auth/auth_cubit.dart';

class RoleSelector extends StatelessWidget {
  final Widget? teacher;
  final Widget? student;
  final Widget? parent;
  final Widget? admin;
  final Widget? fallback;

  const RoleSelector({
    super.key,
    this.teacher,
    this.student,
    this.parent,
    this.admin,
    this.fallback,
  });

  @override
  Widget build(BuildContext context) {
    final role = context.select((AuthCubit cubit) => cubit.state.account?.role);

    switch (role) {
      case UserRole.teacher:
        return teacher ?? fallback ?? const SizedBox.shrink();
      case UserRole.parent:
        return parent ?? fallback ?? const SizedBox.shrink();
      case UserRole.admin:
        return admin ?? fallback ?? const SizedBox.shrink();
      default:
        return fallback ?? const SizedBox.shrink();
    }
  }
}

/// Helper method to perform role-based actions
extension UserRoleX on BuildContext {
  void onRole({
    VoidCallback? teacher,
    VoidCallback? student,
    VoidCallback? parent,
    VoidCallback? admin,
  }) {
    final role = read<AuthCubit>().state.account?.role;
    switch (role) {
      case UserRole.teacher:
        teacher?.call();
        break;
      case UserRole.parent:
        parent?.call();
        break;
      case UserRole.admin:
        admin?.call();
        break;
      default:
        break;
    }
  }

  UserRole? get userRole => read<AuthCubit>().state.account?.role;
}
