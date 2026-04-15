import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/data/states/auth/auth_cubit.dart';
import 'package:flutter_starter/presenter/navigation/navigation.dart';
import 'package:flutter_starter/presenter/pages/setting/widgets/profile_info_card.dart';

@RoutePage()
class ProfileDetailPage extends StatelessWidget {
  const ProfileDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final account = context.watch<AuthCubit>().state.account;
    if (account == null) return const SizedBox.shrink();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Color(0xFF0D1B3E)),
          onPressed: () => context.router.back(),
        ),
        title: const Text(
          'Hồ sơ cá nhân',
          style: TextStyle(
            color: Color(0xFF0D1B3E),
            fontWeight: FontWeight.w800,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          children: [
            _buildAvatarSection(account),
            const SizedBox(height: 12),
            Text(
              account.name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w800,
                color: Color(0xFF0D1B3E),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              account.role.label,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1A6BFF),
              ),
            ),
            const SizedBox(height: 32),
            ProfileInfoCard(
              icon: Icons.badge_outlined,
              label: 'Vai trò hiện tại',
              value: account.role.label,
            ),
            const SizedBox(height: 16),
            ProfileInfoCard(
              icon: Icons.fingerprint_rounded,
              iconColor: const Color(0xFF4CAF50),
              iconBgColor: const Color(0xFFE8F5E9),
              label: account.role.isTeacher ? 'Mã số giáo viên' : 'Mã số học sinh',
              value: 'EDU-${account.id.substring(0, 8).toUpperCase()}',
            ),
            const SizedBox(height: 16),
            ProfileInfoCard(
              icon: Icons.meeting_room_outlined,
              iconColor: const Color(0xFF795548),
              iconBgColor: const Color(0xFFEFEBE9),
              label: 'Phòng ban / Lớp học',
              value: account.role.isTeacher ? 'Giáo viên' : 'Phụ huynh',
              trailing: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFD4EBD4),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  'Active',
                  style: TextStyle(
                    color: Color(0xFF43A047),
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
            _buildActionButton(
              onPressed: () => context.router.push(const UpdateProfileRoute()),
              icon: Icons.edit_outlined,
              label: 'Chỉnh sửa hồ sơ',
              color: const Color(0xFF1A6BFF),
              isPrimary: true,
            ),
            const SizedBox(height: 12),
            _buildActionButton(
              onPressed: () {},
              icon: Icons.history_rounded,
              label: 'Thay đổi mật khẩu',
              color: const Color(0xFF6B7A9A),
              isPrimary: false,
            ),
            const SizedBox(height: 32),
            _buildLogoutButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildAvatarSection(dynamic account) {
    return Center(
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xFFEEF3FF), width: 2),
            ),
            child: CircleAvatar(
              radius: 64,
              backgroundImage: NetworkImage(
                account.avatar ?? 'https://i.pravatar.cc/150?img=32',
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 4,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color(0xFF1A6BFF),
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 3),
              ),
              child: const Icon(
                Icons.camera_alt_rounded,
                color: Colors.white,
                size: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required VoidCallback onPressed,
    required IconData icon,
    required String label,
    required Color color,
    required bool isPrimary,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: isPrimary ? color : const Color(0xFFF4F6FC),
        foregroundColor: isPrimary ? Colors.white : const Color(0xFF0D1B3E),
        elevation: 0,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      child: Row(
        children: [
          Icon(icon, size: 22),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const Icon(Icons.chevron_right_rounded, size: 24),
        ],
      ),
    );
  }

  Widget _buildLogoutButton(BuildContext context) {
    return InkWell(
      onTap: () => context.read<AuthCubit>().loggedOut(),
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xFFFF4B4B).withOpacity(0.1),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFFFF4B4B).withOpacity(0.1)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.logout_rounded, color: Color(0xFFFF4B4B), size: 20),
            SizedBox(width: 12),
            Text(
              'Đăng xuất',
              style: TextStyle(
                color: Color(0xFFFF4B4B),
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
