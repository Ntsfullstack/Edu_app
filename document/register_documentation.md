# 📘 Register Feature — Technical Documentation

**App:** Scholar Slate  
**Date:** 2026-03-29  
**Architecture:** Clean Architecture + SOLID  
**State Management:** flutter_bloc (Cubit)

---

## 1. Tổng quan

Feature Register cho phép người dùng (Teacher / Parent / Admin) tạo tài khoản Scholar Slate. Toàn bộ feature được xây dựng theo **Clean Architecture** phân tầng rõ ràng:

```
UI (RegisterPage)
  └─► RegisterCubit       ← presenter / state
        └─► RegisterUseCase   ← domain
              └─► AuthRepository ← domain (abstract)
                    └─► DefaultAuthRepository ← data (implementation)
                          └─► NetworkDataSource  ← retrofit + dio
```

---

## 2. File Map

| Layer | File | Vai trò |
|---|---|---|
| **Entity** | `data/entities/request/register_params.dart` | Request body gửi lên API |
| **Entity** | `data/entities/response/register_response.dart` | Response trả về từ API |
| **Network** | `data/sources/network/network.dart` | Retrofit interface — endpoint `/register` |
| **Network** | `data/sources/network/dio.dart` | `NetworkDio` — interceptor (auth header, error mapping) |
| **Repository** | `data/repositories/auth_repository/auth_repository.dart` | Abstract contract |
| **Repository** | `data/repositories/auth_repository/auth_repository.default.dart` | Implementation với DI `@Singleton` |
| **Repository** | `data/repositories/auth_repository/exceptions.dart` | Domain exceptions |
| **UseCase** | `data/usecases/register.dart` | `RegisterUseCase` — @singleton |
| **State** | `presenter/pages/register/cubit/register_state.dart` | Freezed state + `UserRole`, `RegisterStatus` enums |
| **Cubit** | `presenter/pages/register/cubit/register_cubit.dart` | Business logic — @injectable |
| **UI** | `presenter/pages/register/register.dart` | `RegisterPage` — @RoutePage |
| **Navigation** | `presenter/navigation/navigation.dart` | Route `/register` |

---

## 3. Design Patterns & Principles

### 3.1 SOLID
| Principle | Áp dụng |
|---|---|
| **S** — Single Responsibility | Mỗi class có 1 nhiệm vụ: UseCase gọi repo, Cubit gọi UseCase, UI lắng nghe Cubit |
| **O** — Open/Closed | Thêm endpoint mới không sửa Cubit; thêm role mới không sửa UseCase |
| **L** — Liskov | `DefaultAuthRepository` thay thế được `AuthRepository` abstract |
| **I** — Interface Segregation | `AuthRepository` chỉ expose các method cần thiết |
| **D** — Dependency Inversion | Tất cả depend vào abstraction, không depend implementation cụ thể |

### 3.2 Clean Architecture Layers
```
Presenter   →  RegisterPage, RegisterCubit, RegisterState
Domain      →  RegisterUseCase, AuthRepository (abstract)
Data        →  DefaultAuthRepository, NetworkDataSource, RegisterParams/Response
```

### 3.3 Injectable / Singleton Pattern
```dart
// Singleton — 1 instance duy nhất trong app
@singleton
class RegisterUseCase extends UseCase<RegisterResponse, RegisterUseCaseParams> { ... }

// Injectable — tạo instance mới mỗi lần BlocProvider tạo
@injectable
class RegisterCubit extends Cubit<RegisterState> { ... }

// Singleton as interface — DI bind implementation vào abstract
@Singleton(as: AuthRepository)
class DefaultAuthRepository extends AuthRepository { ... }
```

### 3.4 Freezed — Immutable State
```dart
@freezed
class RegisterState with _$RegisterState {
  const factory RegisterState({
    @Default('') String fullName,
    @Default('') String email,
    @Default('') String password,
    @Default('') String confirmPassword,
    @Default(UserRole.teacher) UserRole selectedRole,
    @Default(RegisterStatus.initial) RegisterStatus status,
    RegisterResponse? registerResponse,
    BaseException? error,
  }) = _RegisterState;
}
```

---

## 4. Generic Response Wrappers

Đã cấu hình 2 generic wrapper để xử lý các pattern trả về phổ biến của API:

### 4.1 `PaginatedResponse<T>`
Dùng cho các endpoint danh sách có phân trang.
```dart
@GET('/items')
Future<PaginatedResponse<ItemDto>> getItems(@Queries() Map<String, dynamic> queries);
```

### 4.2 `BaseResponse<T>`
Dùng cho các endpoint trả về object đơn lẻ được bọc trong lớp `data`.
```dart
@POST('/profile')
Future<BaseResponse<UserDto>> getProfile();
```

---

## 5. API Contract

### Endpoint
```
POST /register
Content-Type: application/json
```

### Request Body (`RegisterParams`)
```json
{
  "full_name": "Nguyen Van A",
  "email": "a@scholar.edu",
  "password": "secret123",
  "role": "teacher"   // "teacher" | "parent" | "admin"
}
```

### Response Body (`RegisterResponse`)
```json
{
  "id": "abc123",
  "email": "a@scholar.edu",
  "full_name": "Nguyen Van A",
  "role": "teacher",
  "access_token": "eyJ..."   // optional
}
```

### HTTP Error Mapping
| HTTP Status | Exception | Message |
|---|---|---|
| 409 | `EmailAlreadyExistsException` | Email đã được đăng ký |
| 4xx / 5xx | `RegisterFailedException` | Lỗi không xác định |
| Network | `NetworkException` | Không có kết nối mạng (handled by `NetworkDio`) |

---

## 5. State Transitions

```
initial
  │
  ▼ user presses "Create Account"
[validation — local]
  ├─► password != confirmPassword → failure (không gọi API)
  │
  ▼
submitting  (loading spinner hiển thị)
  │
  ├─► API success → success → navigate to HomeRoute
  │
  └─► API error  → failure  → SnackBar với error message
```

---

## 6. Cubit Methods

| Method | Trigger | Action |
|---|---|---|
| `fullNameChanged(String)` | TextField onChanged | emit state mới với fullName |
| `emailChanged(String)` | TextField onChanged | emit state mới với email |
| `passwordChanged(String)` | TextField onChanged | emit state mới với password |
| `confirmPasswordChanged(String)` | TextField onChanged | emit state mới với confirmPassword |
| `roleChanged(UserRole)` | Role chip tap | emit state mới với selectedRole |
| `register()` | Submit button press | validate → call UseCase → emit success/failure |

---

## 7. UI Components

### Register Page (`RegisterPage`)
- `@RoutePage()` + `AutoRouteWrapper` → inject `RegisterCubit` qua `BlocProvider`
- `MultiBlocListener` — lắng nghe `success` → navigate, `failure` → SnackBar
- `BlocBuilder<RegisterCubit, RegisterState>` với `buildWhen` cho:
  - Role selector (chỉ rebuild khi `selectedRole` thay đổi)
  - Submit button (chỉ rebuild khi `status` thay đổi)

### `_RoleChip` Widget
- `AnimatedContainer` với `duration: 200ms` cho smooth selection animation
- Border + background color thay đổi theo `selected` state
- Icon theo role: 🎓 Teacher · 👨‍👩‍👦 Parent · ⚙️ Admin

---

## 8. Code Generation

Chạy sau khi thêm/sửa freezed models hoặc retrofit endpoints:

```bash
cd /path/to/flutter_bloc_base-main
dart run build_runner build --delete-conflicting-outputs
```

Các file được sinh tự động:
- `register_params.freezed.dart` + `register_params.g.dart`
- `register_response.freezed.dart` + `register_response.g.dart`
- `register_state.freezed.dart`
- `network.g.dart` (cập nhật thêm method `register()`)
- `navigation.gr.dart` (cập nhật thêm `RegisterRoute`)

---

## 9. Navigation

```
/           → SplashRoute    (kiểm tra auth)
/login      → LoginRoute     (unauthorized)
/register   → RegisterRoute  (unauthorized — redirect home nếu đã đăng nhập)
/home       → HomeRoute      (authorized — redirect login nếu chưa đăng nhập)
```

Từ `RegisterPage`, người dùng có thể:
- ✅ Đăng ký thành công → `replaceAll([HomeRoute()])`
- ↩️ Đã có tài khoản → `replaceAll([LoginRoute()])`

---

## 10. Dependency Graph

```
GetIt (provider)
├── NetworkDio               @singleton (interceptor)
├── NetworkDataSource        @singleton (retrofit)
├── DefaultAuthRepository    @Singleton(as: AuthRepository)
├── RegisterUseCase          @singleton
└── RegisterCubit            @injectable (per-page)
```
