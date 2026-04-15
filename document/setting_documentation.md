# Tài liệu tính năng Cài đặt (Settings Feature)

## Tổng quan
Màn hình Cài đặt cung cấp cho người dùng khả năng quản lý thông tin cá nhân, tùy chỉnh ứng dụng và truy cập các liên kết hỗ trợ pháp lý. Giao diện được thiết kế theo phong cách hiện đại, tối giản và tối ưu hóa cho cả Giáo viên và Phụ huynh/Học sinh.

## Kiến trúc UI
Màn hình được chia thành các thành phần chính:
1.  **Profile Header**: Hiển thị ảnh đại diện, tên, vai trò và thông tin lớp học/phòng học động dựa trên vai trò người dùng.
2.  **App Preferences**: Các thiết lập nhanh cho ứng dụng (Thông báo, Chế độ tối, Ngôn ngữ).
3.  **Support & Legal**: Các liên kết đến chính sách bảo mật, điều khoản dịch vụ và thông tin phiên bản.
4.  **Sign Out**: Nút đăng xuất được thiết kế nổi bật.

## Các Widget thành phần
- `SettingSection`: Một container bọc các nhóm cài đặt, hỗ trợ tiêu đề nhóm và nền thẻ trắng bo tròn.
- `SettingTile`: Một hàng cài đặt đơn lẻ bao gồm biểu tượng màu sắc, tiêu đề và widget điều khiển (Switch, Chevron, hoặc Text).

## Tích hợp Logic
- **AuthCubit**: Sử dụng để lấy thông tin `Account` hiện tại và thực hiện hành động `loggedOut()`.
- **Role-based Rendering**: Tự động thay đổi nhãn thông tin phụ (ví dụ: "Room 102" cho giáo viên vs "Lớp 10A1" cho học sinh).

### Profile Detail (Chi tiết hồ sơ)
Màn hình này được truy cập bằng cách nhấn vào header hồ sơ trong màn Cài đặt.
- **Tính năng**: Xem chi tiết ID người dùng, vai trò cụ thể, trạng thái tài khoản (Active), và cung cấp các lối tắt để chỉnh sửa hồ sơ hoặc đổi mật khẩu.
- **Widget mới**: `ProfileInfoCard` - Thẻ hiển thị thông tin chi tiết với icon và nhãn động.

## Đường dẫn tệp tin
- Trang chính: `lib/presenter/pages/setting/setting.dart`
- Trang chi tiết: `lib/presenter/pages/setting/profile_detail.dart`
- Component: `lib/presenter/pages/setting/widgets/setting_section.dart`
- Component: `lib/presenter/pages/setting/widgets/setting_tile.dart`
- Component: `lib/presenter/pages/setting/widgets/profile_info_card.dart`

## Hướng dẫn mở rộng
Để thêm một mục cài đặt mới:
1. Xác định nhóm cài đặt (Section) hiện có hoặc tạo mới.
2. Thêm một `SettingTile` vào danh sách `children` của `SettingSection`.
3. Định nghĩa biểu tượng, tiêu đề và hành động `onTap`.
