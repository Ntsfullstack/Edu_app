# 📋 Kế hoạch Thực hiện Tính năng Register

Kế hoạch này liệt kê các bước chi tiết để xây dựng tính năng Đăng ký cho ứng dụng Scholar Slate, tuân thủ Clean Architecture và SOLID.

---

## Các bước thực hiện chi tiết

### 1. Tầng Dữ liệu (Data Layer)
- [x] **[NEW]** Tạo `RegisterParams` (Request Model) tại `lib/data/entities/request/register_params.dart`.
- [x] **[NEW]** Tạo `RegisterResponse` (Response Model) tại `lib/data/entities/response/register_response.dart`.
- [x] **[MODIFY]** Khai báo endpoint `/auth/register` vào `NetworkDataSource` (`lib/data/sources/network/network.dart`).
- [x] **[MODIFY]** Thêm phương thức `register` vào interface `AuthRepository` (`lib/data/repositories/auth_repository/auth_repository.dart`).
- [x] **[MODIFY]** Triển khai logic thực tế trong `DefaultAuthRepository` (`lib/data/repositories/auth_repository/auth_repository.default.dart`).
- [x] **[MODIFY]** Thêm các biệt lệ (Exceptions) mới vào `lib/data/repositories/auth_repository/exceptions.dart`.

### 2. Tầng Nghiệp vụ (Domain Layer)
- [x] **[NEW]** Tạo `RegisterUseCase` tại `lib/data/usecases/register.dart` để làm cầu nối giữa UI và Data.

### 3. Tầng Quản lý Trạng thái (Presenter Layer)
- [x] **[MODIFY]** Định nghĩa State (Freezed) tại `lib/presenter/pages/register/cubit/register_state.dart`.
- [x] **[MODIFY]** Triển khai Cubit logic tại `lib/presenter/pages/register/cubit/register_cubit.dart`.

### 4. Tầng Giao diện (Presentation Layer)
- [x] **[MODIFY]** Xây dựng form và logic hiển thị tại `lib/presenter/pages/register/register.dart`.

### 5. Điều hướng & Codegen (Navigation & Build)
- [x] **[MODIFY]** Đăng ký route vào `AppRouter` (`lib/presenter/navigation/navigation.dart`).
- [x] **[CHECK]** Chạy `dart run build_runner build` để kiểm tra kết quả.

---

## Ghi chú
Toàn bộ mã nguồn đã được tối ưu hóa bằng **Injectable** (@singleton, @injectable) và **AutoRoute**. Tài liệu hướng dẫn chi tiết cách code từng file có thể tìm thấy tại `document/register_documentation.md`.
