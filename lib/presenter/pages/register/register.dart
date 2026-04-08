import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/di.dart';
import 'package:flutter_starter/data/entities/user_role.dart';
import 'package:flutter_starter/presenter/navigation/navigation.dart';
import 'package:flutter_starter/presenter/pages/register/cubit/register_cubit.dart';
import 'package:flutter_starter/presenter/pages/register/cubit/register_state.dart';
import 'package:flutter_starter/presenter/themes/extensions.dart';
import 'package:flutter_starter/presenter/widgets/loading_indicator.dart';

@RoutePage()
class RegisterPage extends StatefulWidget implements AutoRouteWrapper {
  const RegisterPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<RegisterCubit>(
      create: (_) => provider.get<RegisterCubit>(),
      child: this,
    );
  }

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  RegisterCubit get _cubit => context.read<RegisterCubit>();

  // ── Callbacks ────────────────────────────────────────────────────────────

  void _onNameChanged(String v) => _cubit.nameChanged(v);
  void _onEmailChanged(String v) => _cubit.emailChanged(v);
  void _onPasswordChanged(String v) => _cubit.passwordChanged(v);
  void _onConfirmPasswordChanged(String v) => _cubit.confirmPasswordChanged(v);
  void _onRoleChanged(UserRole role) => _cubit.roleChanged(role);
  void _onRegisterPressed() => _cubit.register();

  void _onSuccess(BuildContext context, RegisterState state) {
    context.router.replaceAll([const HomeRoute()]);
  }

  void _onError(BuildContext context, RegisterState state) {
    final msg = state.error?.message;
    if (msg == null) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        backgroundColor: context.colors.error,
      ),
    );
  }

  // ── Build ────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<RegisterCubit, RegisterState>(
          listenWhen: (p, c) => c.status == RegisterStatus.success,
          listener: _onSuccess,
        ),
        BlocListener<RegisterCubit, RegisterState>(
          listenWhen: (p, c) => c.status == RegisterStatus.failure,
          listener: _onError,
        ),
      ],
      child: Scaffold(
        backgroundColor: const Color(0xFFF4F6F9),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 480),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const _RegisterHeader(),
                    const SizedBox(height: 32),
                    _RegisterForm(
                      onNameChanged: _onNameChanged,
                      onEmailChanged: _onEmailChanged,
                      onPasswordChanged: _cubit.passwordChanged,
                      onConfirmPasswordChanged: _cubit.confirmPasswordChanged,
                      onRoleChanged: _cubit.roleChanged,
                      onRegister: _cubit.register,
                    ),
                    const SizedBox(height: 24),
                    const _SubmitButton(),
                    const SizedBox(height: 20),
                    const _SignInLink(),
                    const SizedBox(height: 32),
                    const _RegisterFooter(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ── Components ────────────────────────────────────────────────────────────

class _RegisterHeader extends StatelessWidget {
  const _RegisterHeader();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color(0xFF1A6BFF).withOpacity(0.12),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(
                Icons.school_rounded,
                color: Color(0xFF1A6BFF),
                size: 22,
              ),
            ),
            const SizedBox(width: 10),
            Text(
              'Scholar Slate',
              style: context.typographies.heading.copyWith(
                color: const Color(0xFF1A6BFF),
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        Text(
          'Create your account',
          style: context.typographies.heading.copyWith(
            fontSize: 26,
            fontWeight: FontWeight.w800,
            color: const Color(0xFF0D1B3E),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Start your journey with the modern editorial\nstandard in education.',
          style: context.typographies.body.copyWith(
            color: const Color(0xFF6B7A9A),
            height: 1.5,
          ),
        ),
      ],
    );
  }
}
class _RegisterForm extends StatelessWidget {
  final ValueChanged<String> onNameChanged;
  final ValueChanged<String> onEmailChanged;
  final ValueChanged<String> onPasswordChanged;
  final ValueChanged<String> onConfirmPasswordChanged;
  final ValueChanged<UserRole> onRoleChanged;
  final VoidCallback onRegister;

  const _RegisterForm({
    required this.onNameChanged,
    required this.onEmailChanged,
    required this.onPasswordChanged,
    required this.onConfirmPasswordChanged,
    required this.onRoleChanged,
    required this.onRegister,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _Label('Full Name'),
        const SizedBox(height: 8),
        _buildTextField(
          hintText: 'Enter your full name',
          prefixIcon: Icons.person_outline_rounded,
          onChanged: onNameChanged,
          textInputAction: TextInputAction.next,
        ),
        const SizedBox(height: 20),
        const _Label('Email Address'),
        const SizedBox(height: 8),
        _buildTextField(
          hintText: 'example@scholar.edu',
          prefixIcon: Icons.mail_outline_rounded,
          keyboardType: TextInputType.emailAddress,
          onChanged: onEmailChanged,
          textInputAction: TextInputAction.next,
        ),
        const SizedBox(height: 20),
        const _Label('Join as'),
        const SizedBox(height: 12),
        _RoleSelector(onRoleChanged: onRoleChanged),
        const SizedBox(height: 20),
        const _Label('Password'),
        const SizedBox(height: 8),
        _buildTextField(
          hintText: '••••••••',
          prefixIcon: Icons.lock_outline_rounded,
          obscureText: true,
          onChanged: onPasswordChanged,
          textInputAction: TextInputAction.next,
        ),
        const SizedBox(height: 20),
        const _Label('Confirm'),
        const SizedBox(height: 8),
        _buildTextField(
          hintText: '••••••••',
          prefixIcon: Icons.lock_reset_rounded,
          obscureText: true,
          onChanged: onConfirmPasswordChanged,
          textInputAction: TextInputAction.done,
          onSubmitted: (_) => onRegister(),
        ),
      ],
    );
  }

  Widget _buildTextField({
    required String hintText,
    required IconData prefixIcon,
    bool obscureText = false,
    TextInputType? keyboardType,
    TextInputAction? textInputAction,
    ValueChanged<String>? onChanged,
    ValueChanged<String>? onSubmitted,
  }) {
    return TextFormField(
      onChanged: onChanged,
      obscureText: obscureText,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      onFieldSubmitted: onSubmitted,
      style: const TextStyle(
        color: Color(0xFF0D1B3E),
        fontSize: 15,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Color(0xFFAAB4C8),
          fontSize: 15,
        ),
        prefixIcon: Icon(
          prefixIcon,
          color: const Color(0xFF8A96B0),
          size: 20,
        ),
        filled: true,
        fillColor: const Color(0xFFEEF1F8),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(
            color: Color(0xFF1A6BFF),
            width: 1.5,
          ),
        ),
      ),
    );
  }
}

class _RoleSelector extends StatelessWidget {
  final ValueChanged<UserRole> onRoleChanged;

  const _RoleSelector({required this.onRoleChanged});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      buildWhen: (p, c) => p.selectedRole != c.selectedRole,
      builder: (context, state) {
        return Wrap(
          spacing: 10,
          runSpacing: 10,
          children: UserRole.values.map((role) {
            final selected = state.selectedRole == role;
            return _RoleChip(
              role: role,
              selected: selected,
              onTap: () => onRoleChanged(role),
            );
          }).toList(),
        );
      },
    );
  }
}

class _SubmitButton extends StatelessWidget {
  const _SubmitButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      buildWhen: (p, c) => p.status != c.status,
      builder: (context, state) {
        final isSubmitting = state.status == RegisterStatus.submitting;
        return FilledButton(
          onPressed: isSubmitting ? null : context.read<RegisterCubit>().register,
          style: FilledButton.styleFrom(
            backgroundColor: const Color(0xFF1A6BFF),
            disabledBackgroundColor: const Color(0xFF1A6BFF).withOpacity(0.6),
            padding: const EdgeInsets.symmetric(vertical: 18),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            elevation: 0,
          ),
          child: isSubmitting
              ? const AppFilledButtonLoadingIndicator()
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Create Account',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        letterSpacing: 0.2,
                      ),
                    ),
                    SizedBox(width: 8),
                    Icon(Icons.arrow_forward_rounded,
                        color: Colors.white, size: 18),
                  ],
                ),
        );
      },
    );
  }
}

class _SignInLink extends StatelessWidget {
  const _SignInLink();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          text: 'Already have an account? ',
          style: const TextStyle(
            color: Color(0xFF6B7A9A),
            fontSize: 13.5,
          ),
          children: [
            TextSpan(
              text: 'Sign in to Scholar Slate',
              style: const TextStyle(
                color: Color(0xFF1A6BFF),
                fontWeight: FontWeight.w600,
                fontSize: 13.5,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () => context.router.replaceAll([const LoginRoute()]),
            ),
          ],
        ),
      ),
    );
  }
}

class _RegisterFooter extends StatelessWidget {
  const _RegisterFooter();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: const TextStyle(
            color: Color(0xFFAAB4C8),
            fontSize: 11.5,
            height: 1.6,
          ),
          children: [
            const TextSpan(text: 'By creating an account, you agree to our '),
            TextSpan(
              text: 'Terms of Service',
              style: const TextStyle(
                decoration: TextDecoration.underline,
                color: Color(0xFF8A96B0),
              ),
              recognizer: TapGestureRecognizer()..onTap = () {},
            ),
            const TextSpan(text: ' and '),
            TextSpan(
              text: 'Privacy Policy',
              style: const TextStyle(
                decoration: TextDecoration.underline,
                color: Color(0xFF8A96B0),
              ),
              recognizer: TapGestureRecognizer()..onTap = () {},
            ),
            const TextSpan(
              text:
                  '. Scholar Slate uses cookies for a better professional experience.',
            ),
          ],
        ),
      ),
    );
  }
}

class _Label extends StatelessWidget {
  final String text;
  const _Label(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: Color(0xFF0D1B3E),
      ),
    );
  }
}

class _RoleChip extends StatelessWidget {
  final UserRole role;
  final bool selected;
  final VoidCallback onTap;

  const _RoleChip({
    required this.role,
    required this.selected,
    required this.onTap,
  });

  IconData get _icon {
    switch (role) {
      case UserRole.teacher:
        return Icons.school;
      case UserRole.student:
        return Icons.person;
      case UserRole.parent:
        return Icons.family_restroom;
      case UserRole.admin:
        return Icons.admin_panel_settings;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 11),
        decoration: BoxDecoration(
          color: selected
              ? const Color(0xFF1A6BFF).withOpacity(0.1)
              : const Color(0xFFEEF1F8),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: selected
                ? const Color(0xFF1A6BFF)
                : const Color(0xFFD8DEF0),
            width: selected ? 1.5 : 1.0,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              _icon,
              size: 18,
              color: selected
                  ? const Color(0xFF1A6BFF)
                  : const Color(0xFF8A96B0),
            ),
            const SizedBox(width: 6),
            Text(
              role.label,
              style: TextStyle(
                fontSize: 14,
                fontWeight:
                    selected ? FontWeight.w700 : FontWeight.w500,
                color: selected
                    ? const Color(0xFF1A6BFF)
                    : const Color(0xFF4A5568),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
