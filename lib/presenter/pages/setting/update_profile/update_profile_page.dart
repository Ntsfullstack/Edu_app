import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/data/states/auth/auth_cubit.dart';
import 'package:flutter_starter/di.dart';
import 'package:flutter_starter/presenter/pages/setting/update_profile/cubit/update_profile_cubit.dart';
import 'package:flutter_starter/presenter/pages/setting/update_profile/cubit/update_profile_state.dart';
import 'package:flutter_starter/presenter/widgets/custom_snackbar.dart';

@RoutePage()
class UpdateProfilePage extends StatefulWidget implements AutoRouteWrapper {
  const UpdateProfilePage({super.key});

  @override
  State<UpdateProfilePage> createState() => _UpdateProfilePageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => provider<UpdateProfileCubit>(),
      child: this,
    );
  }
}

class _UpdateProfilePageState extends State<UpdateProfilePage> {
  late TextEditingController _nameController;
  late TextEditingController _phoneController;

  @override
  void initState() {
    super.initState();
    final account = context.read<AuthCubit>().state.account;
    _nameController = TextEditingController(text: account?.name ?? '');
    _phoneController = TextEditingController(text: account?.phoneNumber ?? '');
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UpdateProfileCubit, UpdateProfileState>(
      listener: (context, state) {
        if (state.isSuccess) {
          showCustomSnackbar(
            context,
            message: 'Cập nhật thông tin thành công!',
            type: SnackbarType.success,
          );
          context.router.back();
        }
        if (state.error != null) {
          showCustomSnackbar(
            context,
            message: state.error!,
            type: SnackbarType.error,
          );
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Color(0xFF0D1B3E)),
            onPressed: () => context.router.back(),
          ),
          title: const Text(
            'Cập nhật thông tin',
            style: TextStyle(
              color: Color(0xFF0D1B3E),
              fontWeight: FontWeight.w800,
              fontSize: 18,
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildInputField(
                controller: _nameController,
                label: 'Họ và tên',
                hint: 'Nhập họ và tên của bạn',
                icon: Icons.person_outline_rounded,
              ),
              const SizedBox(height: 20),
              _buildInputField(
                controller: _phoneController,
                label: 'Số điện thoại',
                hint: 'Nhập số điện thoại của bạn',
                icon: Icons.phone_outlined,
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 48),
              BlocBuilder<UpdateProfileCubit, UpdateProfileState>(
                builder: (context, state) {
                  return ElevatedButton(
                    onPressed: state.isLoading ? null : _onSave,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1A6BFF),
                      foregroundColor: Colors.white,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    ),
                    child: state.isLoading
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                            ),
                          )
                        : const Text(
                            'Lưu thay đổi',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                          ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    TextInputType? keyboardType,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: Color(0xFF0D1B3E),
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: Color(0xFFAAB4C8), fontWeight: FontWeight.w400),
            prefixIcon: Icon(icon, color: const Color(0xFF1A6BFF), size: 22),
            filled: true,
            fillColor: const Color(0xFFF4F6FC),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 18),
          ),
        ),
      ],
    );
  }

  void _onSave() {
    context.read<UpdateProfileCubit>().updateProfile(
          name: _nameController.text.trim(),
          phoneNumber: _phoneController.text.trim(),
        );
  }
}
