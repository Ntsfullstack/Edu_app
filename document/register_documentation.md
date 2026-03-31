# 📘 Hướng dẫn Chi tiết Triển khai Tính năng Register

Tài liệu này liệt kê chính xác các file cần **tạo mới** và **chỉnh sửa** để hoàn thiện tính năng Register theo mô hình Clean Architecture.

---

## 1. Tầng Dữ liệu (Data Layer)

### 1.1. [NEW] `lib/data/entities/request/register_params.dart`
- **Nhiệm vụ:** Định nghĩa Request Body gửi lên API.
- **Chi tiết:** Sử dụng `@freezed` để khớp với contract: `{ "email", "password", "name", "role" }`.

### 1.2. [NEW] `lib/data/entities/response/register_response.dart`
- **Nhiệm vụ:** Định nghĩa Response sau khi đăng ký.
- **Chi tiết:** Khớp các trường trả về: `{ "id", "email", "name", "role" }`.

### 1.3. [MODIFY] `lib/data/sources/network/network.dart`
- **Nhiệm vụ:** Khai báo Endpoint API bằng Retrofit.
- **Thay đổi:** Thêm `@POST('/auth/register')` vào interface `NetworkDataSource`.

### 1.4. [MODIFY] `lib/data/repositories/auth_repository/auth_repository.dart`
- **Nhiệm vụ:** Thêm phương thức vào Interface Repository.
- **Thay đổi:** Khai báo `Future<RegisterResponse> register({required RegisterParams params});`.

### 1.5. [MODIFY] `lib/data/repositories/auth_repository/auth_repository.default.dart`
- **Nhiệm vụ:** Triển khai (Implement) logic gọi API thực tế.
- **Thay đổi:** Gọi `_networkDataSource.register(params)` và handle lỗi `DioException`.

### 1.6. [MODIFY] `lib/data/repositories/auth_repository/exceptions.dart`
- **Nhiệm vụ:** Định nghĩa các lỗi liên quan đến Auth.
- **Thay đổi:** Thêm `RegisterFailedException` và `EmailAlreadyExistsException`.

---

## 2. Tầng Nghiệp vụ (Domain Layer)

### 2.1. [NEW] `lib/data/usecases/register.dart`
- **Nhiệm vụ:** Đóng gói logic đăng ký thành một UseCase độc lập.
- **Chi tiết:** Kế thừa `UseCase` class, sử dụng `@singleton`. Nhận các trường dữ liệu và gọi repository.

---

## 3. Tầng Quản lý Trạng thái (Presenter Layer - BLoC/Cubit)

### 3.1. [MODIFY] `lib/presenter/pages/register/cubit/register_state.dart`
- **Nhiệm vụ:** Lưu trữ trạng thái giao diện.
- **Thay đổi:** Thêm các trường form (`name`, `email`, `password`, `confirmPassword`) và enums (`UserRole`, `RegisterStatus`).

### 3.2. [MODIFY] `lib/presenter/pages/register/cubit/register_cubit.dart`
- **Nhiệm vụ:** Xử lý logic và phát (emit) state mới.
- **Thay đổi:** Viết các hàm `nameChanged`, `register()`, và xử lý validate mật khẩu trùng khớp.

---

## 4. Tầng Giao diện (Presentation Layer)

### 4.1. [MODIFY] `lib/presenter/pages/register/register.dart`
- **Nhiệm vụ:** Xây dựng UI chuẩn theo thiết kế Scholar Slate.
- **Thay đổi:** 
  - Triển khai `AutoRouteWrapper` để cung cấp Cubit.
  - Sử dụng `BlocListener` để điều hướng trang khi thành công.
  - Xây dựng form với Role Chips (Teacher/Parent/Admin).

---

## 5. Cấu hình Hệ thống

### 5.1. [MODIFY] `lib/presenter/navigation/navigation.dart`
- **Nhiệm vụ:** Đăng ký Route cho trang Register.
- **Thay đổi:** Thêm `RegisterRoute` vào danh sách routes của `AppRouter`.

---

## 6. Lệnh Thực thi (Codegen)
Sau khi tạo/sửa các file trên, bạn **BẮT BUỘC** phải chạy lệnh sau:

```bash
dart run build_runner build --delete-conflicting-outputs
```
Lệnh này sẽ tự động sinh mã cho Freezed, Retrofit, Injectable và AutoRoute.
