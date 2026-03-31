# 🚀 Quy trình Phát triển một Tính năng Mới (Feature)

Tài liệu này quy định các bước chuẩn để phát triển một tính năng mới trong dự án, đảm bảo tuân thủ **Clean Architecture**, **SOLID** và các pattern hiện có.

---

## 1. Phân tích & Chuẩn bị
Trước khi code, cần làm rõ:
- **UI Mockup:** Hiểu cấu trúc giao diện và các tương tác.
- **API Contract:** Xác định endpoint, phương thức (GET/POST), request/response body.

---

## 2. Các Bước Thực hiện (Thứ tự Ưu tiên)

### Bước 1: Tầng Dữ liệu (Data Layer)
Đây là nền tảng của tính năng.
1.  **Tạo Entities (Models):**
    - Tạo Request Params (nếu có) tại `lib/data/entities/request/`.
    - Tạo Response Model tại `lib/data/entities/response/`.
    - *Lưu ý:* Luôn dùng `@freezed` và `@json_serializable`.
2.  **Khai báo Network:**
    - Thêm endpoint vào interface `NetworkDataSource` (`lib/data/sources/network/network.dart`).
3.  **Định nghĩa Repository:**
    - Cập nhật Interface tại `lib/data/repositories/`.
    - Triển khai logic tại file `.default.dart` tương ứng. Xử lý logic cache hoặc gọi network tại đây.

### Bước 2: Tầng Nghiệp vụ (Domain Layer)
1.  **Tạo UseCase:**
    - Tạo class kế thừa `UseCase<T, Params>` tại `lib/data/usecases/`.
    - Đánh dấu với `@singleton`.
    - **Nhiệm vụ:** Chỉ thực hiện một logic nghiệp vụ duy nhất (Single Responsibility).

### Bước 3: Tầng Quản lý Trạng thái (Presenter Layer)
1.  **Tạo State:**
    - Tạo file `_state.dart` với `@freezed`. Chứa các trạng thái dữ liệu và trạng thái loading/error.
2.  **Tạo Cubit:**
    - Tạo file `_cubit.dart` đánh dấu với `@injectable`.
    - Inject UseCase vào constructor.
    - Phát (emit) state mới dựa trên kết quả từ UseCase.

### Bước 4: Tầng Giao diện (Presentation Layer)
1.  **Tạo Page:**
    - Tạo folder cho feature tại `lib/presenter/pages/`.
    - Đánh dấu class Page với `@RoutePage()`.
    - Triển khai `implements AutoRouteWrapper` để khởi tạo Cubit qua `BlocProvider`.
2.  **Widget hóa:** Chia nhỏ giao diện thành các private widget bên trong file hoặc các file widget riêng.

### Bước 5: Điều hướng & DI (Navigation & Dependency Injection)
1.  **Đăng ký Route:** Thêm route mới vào `AppRouter` (`lib/presenter/navigation/navigation.dart`).
2.  **Chạy Codegen:** Quan trọng nhất để liên kết các thành phần.
```bash
dart run build_runner build --delete-conflicting-outputs
```

---

## 3. Các Nguyên tắc Vàng (Best Practices)
- **Dependency Inversion:** Tầng UI chỉ depend vào Cubit, Cubit depend vào UseCase (Interface), UseCase depend vào Repository (Interface).
- **Immutable State:** Không bao giờ thay đổi trực tiếp thuộc tính của State. Luôn dùng `state.copyWith()`.
- **Error Handling:** Luôn dùng `try-catch` ở tầng Repository và ném về các `BaseException` để UI có thể hiển thị thông báo lỗi thân thiện.
- **Translation:** Tất cả text hiển thị trên UI phải dùng `LocaleKeys` và hàm `tr()` để hỗ trợ đa ngôn ngữ.

---

## 4. Checklist hoàn thành Feature
- [ ] Đã chạy `build_runner` và không có lỗi.
- [ ] Register route thành công.
- [ ] UI phản hồi đúng các trạng thái (Loading, Success, Failure).
- [ ] Unit test cho UseCase/Cubit (tùy dự án yêu cầu).
