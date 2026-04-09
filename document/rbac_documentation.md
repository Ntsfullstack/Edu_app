# Tài liệu Hệ thống Phân quyền (RBAC) & Cấu trúc Modular Dashboard

Dự án sử dụng hệ thống RBAC mạnh mẽ để xử lý đa vai trò (Giáo viên, Học sinh, Phụ huynh, Admin), đảm bảo tính an toàn về kiểu dữ liệu (type-safe), tính nhất quán của UI và đơn giản hóa logic nghiệp vụ.

## 1. Cốt lõi: Enum `UserRole`
Nằm tại `lib/data/entities/user_role.dart`. Đây là "nguồn sự thật" duy nhất cho tất cả các vai trò.

### Đặc điểm:
- **Type-Safe:** Thay thế các chuỗi String dễ sai sót.
- **Tương thích API:** Sử dụng `@JsonValue` để khớp với dữ liệu từ Backend ('teacher', 'student',...).

```dart
// Ví dụ kiểm tra role
if (role.isTeacher) { 
  // thực hiện hành động của giáo viên
}
```

Để tránh việc file code quá dài và khó quản lý, từng màn hình của từng Role được tách thành các file **StatefulWidget** riêng biệt trong thư mục `widgets/`.

### Tại sao các View con cũng là StatefulWidget?
- Để mỗi View có thể quản lý trạng thái riêng (ví dụ: ScrollController, Animation) mà không phụ thuộc vào trang cha.
- Tối ưu hóa việc rebuild: Khi một View thay đổi trạng thái, chỉ View đó build lại chứ không phải toàn bộ Dashboard.

### Thư mục mẫu (`lib/presenter/pages/home/widgets/`):
- `teacher_home_view.dart`: Giao diện riêng cho Giáo viên (Stateful).
- `student_home_view.dart`: Giao diện riêng cho Học sinh (Stateful).
- `parent_home_view.dart`: Giao diện riêng cho Phụ huynh (Stateful).

## 3. Lớp Vỏ bọc (Stateful Wrappers)
Các trang chính (`HomePage`, `SchedulePage`,...) được thiết kế là **StatefulWidget**.

### Tại sao dùng StatefulWidget?
- Dễ dàng khởi tạo các Controller (ScrollController, TabController).
- Quản lý trạng thái nội bộ của tab mà không ảnh hưởng đến các tab khác.
- Là nơi chứa `RoleSelector` để điều phối nội dung.

## 4. Công cụ điều phối: `RoleSelector` Widget
Nằm tại `lib/presenter/widgets/role_selector.dart`. Widget này giúp hiển thị UI khác nhau một cách khai báo (declarative).

### Cách dùng:
```dart
RoleSelector(
  teacher: TeacherHomeView(),
  student: StudentHomeView(),
  parent: ParentHomeView(),
)
```
*Widget này sẽ tự động vẽ lại (rebuild) khi Role của người dùng thay đổi.*

## 5. Tiện ích mở rộng: `BuildContext` Extensions
Giúp truy cập logic phân quyền cực nhanh ở bất cứ đâu.

- `context.userRole`: Lấy role hiện tại.
- `context.onRole(...)`: Thực hiện hành động theo role (dùng cho logic xử lý event).

```dart
context.onRole(
  teacher: () => print("Gọi API cho Giáo viên..."),
  admin: () => print("Mở bảng điều khiển Admin..."),
);
```

---

## 6. Quản lý State theo Role
Khi các View được tách riêng, bạn có thể áp dụng State Management riêng cho từng Role:

```dart
// Trong teacher_home_view.dart
return BlocProvider(
  create: (context) => TeacherCubit()..loadClasses(),
  child: TeacherUI(),
);
```
Bằng cách này, logic của Giáo viên sẽ hoàn toàn độc lập với Học sinh, giúp code dễ bảo trì và mở rộng.
