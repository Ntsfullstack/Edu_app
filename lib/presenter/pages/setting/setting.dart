import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/data/states/auth/auth_cubit.dart';
import 'package:flutter_starter/presenter/navigation/navigation.dart';
import 'package:flutter_starter/presenter/pages/setting/widgets/setting_section.dart';
import 'package:flutter_starter/presenter/pages/setting/widgets/setting_tile.dart';

@RoutePage()
class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    final account = context.watch<AuthCubit>().state.account;
    if (account == null) return const SizedBox.shrink();

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FD),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              InkWell(
                onTap: () => context.router.push(const ProfileDetailRoute()),
                borderRadius: BorderRadius.circular(24),
                child: _buildProfileHeader(context, account),
              ),
              const SizedBox(height: 32),
              SettingSection(
                title: 'Cài đặt',
                children: [
                  SettingTile(
                    icon: Icons.notifications_rounded,
                    iconBgColor: const Color(0xFFEEF3FF),
                    title: 'Thông báo',
                    trailing: Switch(
                      value: _notificationsEnabled,
                      onChanged: (v) => setState(() => _notificationsEnabled = v),
                      activeColor: const Color(0xFF1A6BFF),
                    ),
                  ),
                  SettingTile(
                    icon: Icons.dark_mode_rounded,
                    iconBgColor: const Color(0xFFF2F2F7),
                    iconColor: const Color(0xFF5856D6),
                    title: 'Màn hình tối',
                    trailing: Switch(
                      value: false,
                      onChanged: (v) {},
                    ),
                  ),
                  SettingTile(
                    icon: Icons.language_rounded,
                    iconBgColor: const Color(0xFFE8F5E9),
                    iconColor: const Color(0xFF4CAF50),
                    title: 'Ngôn ngữ',
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text(
                          'Tiếng Việt',
                          style: TextStyle(color: Color(0xFF6B7A9A), fontSize: 13),
                        ),
                        SizedBox(width: 4),
                        Icon(Icons.chevron_right_rounded, color: Color(0xFFAAB4C8)),
                      ],
                    ),
                    onTap: () {},
                    showDivider: false,
                  ),
                ],
              ),
              const SizedBox(height: 24),
              SettingSection(
                title: 'Chính sách - Hỗ trợ',
                children: [
                  SettingTile(
                    icon: Icons.security_rounded,
                    iconBgColor: const Color(0xFFFFF3E0),
                    iconColor: const Color(0xFFFF9800),
                    title: 'Chính sách bảo mật',
                    trailing: const Icon(Icons.open_in_new_rounded, size: 18, color: Color(0xFFAAB4C8)),
                    onTap: () {},
                  ),
                  SettingTile(
                    icon: Icons.description_rounded,
                    iconBgColor: const Color(0xFFE3F2FD),
                    iconColor: const Color(0xFF2196F3),
                    title: 'Điều khoản dịch vụ',
                    trailing: const Icon(Icons.open_in_new_rounded, size: 18, color: Color(0xFFAAB4C8)),
                    onTap: () {},
                  ),
                  SettingTile(
                    icon: Icons.info_rounded,
                    iconBgColor: const Color(0xFFF3E5F5),
                    iconColor: const Color(0xFF9C27B0),
                    title: 'Thông tin phiên bản',
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text(
                          'v2.4.0',
                          style: TextStyle(color: Color(0xFF6B7A9A), fontSize: 13),
                        ),
                        SizedBox(width: 4),
                        Icon(Icons.chevron_right_rounded, color: Color(0xFFAAB4C8)),
                      ],
                    ),
                    onTap: () {},
                    showDivider: false,
                  ),
                ],
              ),
              const SizedBox(height: 40),
              _buildSignOutButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileHeader(BuildContext context, dynamic account) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFEEF3FF).withOpacity(0.5),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white, width: 2),
      ),
      child: Row(
        children: [
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: const DecorationImage(
                image: NetworkImage('https://i.pravatar.cc/150?img=32'),
                fit: BoxFit.cover,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  account.name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF0D1B3E),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  account.role.label,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF6B7A9A),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSignOutButton(BuildContext context) {
    return OutlinedButton(
      onPressed: () => context.read<AuthCubit>().loggedOut(),
      style: OutlinedButton.styleFrom(
        foregroundColor: const Color(0xFFFF4B4B),
        side: const BorderSide(color: Color(0xFFFFE5E5)),
        backgroundColor: const Color(0xFFFFF8F8),
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.logout_rounded, size: 20),
          SizedBox(width: 8),
          Text(
            'Đăng xuất',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}