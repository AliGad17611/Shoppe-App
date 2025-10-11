# Login Implementation Guide

This document outlines the complete login implementation following Clean Architecture principles.

## 🎯 Overview

The login feature has been implemented with full integration to the API endpoint:
```
POST https://accessories-eshop.runasp.net/api/auth/login
```

## 📁 Project Structure

### **Domain Layer** (Business Logic)

#### 1. **Entity** (`lib/features/auth/domain/entities/user.dart`)
- Updated `User` entity to include `token` field
- Represents the core business model

#### 2. **Use Case** (`lib/features/auth/domain/usecases/sign_in_with_email.dart`)
- `SignInWithEmail` - Handles email/password authentication
- `SignInWithEmailParams` - Parameters for the use case (email, password)

### **Data Layer** (Data Management)

#### 1. **Models**
- `LoginRequestModel` (`lib/features/auth/data/models/login_request_model.dart`)
  - Represents login request payload
  - Converts to JSON for API calls

- `LoginResponseModel` (`lib/features/auth/data/models/login_response_model.dart`)
  - Parses API response
  - Extracts user data and token

- `UserModel` (`lib/features/auth/data/models/user_model.dart`)
  - Updated with token support
  - Includes `copyWith` method for token assignment

#### 2. **Data Source** (`lib/features/auth/data/datasources/auth_remote_datasource.dart`)
- `AuthRemoteDataSourceImpl` - Implements HTTP login
- Uses `http.Client` for API requests
- Handles error responses (400, 401, 500)
- Converts exceptions to `ServerException`

#### 3. **Repository Implementation** (`lib/features/auth/data/repositories/auth_repository_impl.dart`)
- Implements `AuthRepository` interface
- Checks network connectivity
- Converts exceptions to failures
- Caches user data locally on success

### **Presentation Layer** (UI & State Management)

#### 1. **Cubit & States**
- `LoginCubit` (`lib/features/auth/presentation/cubit/login_cubit.dart`)
  - Manages login state
  - Calls `SignInWithEmail` use case
  - Maps failures to user-friendly messages

- `LoginState` (`lib/features/auth/presentation/cubit/login_state.dart`)
  - `LoginInitial` - Initial state
  - `LoginLoading` - During authentication
  - `LoginSuccess` - Successful login with user data
  - `LoginError` - Login failed with error message

#### 2. **Widgets**
- `EmailTextFormField` (`lib/features/auth/presentation/widgets/email_text_form_field.dart`)
  - Reusable email input field
  - Built-in email validation
  - Email icon prefix

- `PasswordTextFormField` (`lib/features/auth/presentation/widgets/password_text_form_field.dart`)
  - Reusable password input field
  - Show/hide password toggle
  - Built-in password validation (min 6 characters)
  - Lock icon prefix

#### 3. **View** (`lib/features/auth/presentation/views/sign_in_view.dart`)
- Integrated with `LoginCubit`
- Uses `BlocProvider` for dependency injection
- Uses `BlocConsumer` for state management
- Shows loading indicator during login
- Displays success/error messages via SnackBar

### **Core** (Shared Infrastructure)

#### 1. **Constants** (`lib/core/constants/constants.dart`)
- Updated `baseUrl` to: `https://accessories-eshop.runasp.net`
- Added API endpoints: `/auth/login`, `/auth/register`

#### 2. **Dependency Injection** (`lib/core/di/injection_container.dart`)
- Registered `http.Client`
- Registered `SignInWithEmail` use case
- Registered `LoginCubit`
- Updated `AuthRemoteDataSourceImpl` with `http.Client` dependency

## 🔄 Login Flow

```
User Input (Email/Password)
    ↓
SignInView validates form
    ↓
LoginCubit.login() called
    ↓
SignInWithEmail use case executed
    ↓
AuthRepository.signInWithEmail()
    ↓
Check network connectivity
    ↓
AuthRemoteDataSource.signInWithEmail()
    ↓
HTTP POST to API
    ↓
Parse response (LoginResponseModel)
    ↓
Cache user locally (AuthLocalDataSource)
    ↓
Return User entity
    ↓
LoginCubit emits LoginSuccess/LoginError
    ↓
UI updates (show message, navigate)
```

## 📦 Dependencies Added

### **API & Networking**
- `dio: ^5.7.0` - Advanced HTTP client for Dart
- `retrofit: ^4.4.1` - Type-safe REST client generator
- `json_annotation: ^4.9.0` - JSON serialization annotations

### **Dev Dependencies (Code Generation)**
- `build_runner: ^2.4.13` - Code generation tool
- `json_serializable: ^6.9.2` - JSON serialization code generator
- `retrofit_generator: ^9.1.2` - Retrofit code generator

> **Note:** The implementation now uses **Retrofit** instead of raw HTTP client for better type safety and less boilerplate. See `RETROFIT_MIGRATION.md` for details.

## 🔑 API Request/Response

### Request
```json
{
  "email": "user@example.com",
  "password": "password123"
}
```

### Expected Response Structure
```json
{
  "user": {
    "id": "123",
    "email": "user@example.com",
    "name": "John Doe",
    "photoUrl": "https://..."
  },
  "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9..."
}
```

## ✅ Features Implemented

1. ✅ Full Clean Architecture structure
2. ✅ Email and password validation
3. ✅ Network connectivity check
4. ✅ Loading state with circular progress indicator
5. ✅ Error handling with user-friendly messages
6. ✅ Success messages with user email
7. ✅ Token storage for authenticated user
8. ✅ Reusable email and password form fields
9. ✅ Proper state management with Cubit
10. ✅ Dependency injection with GetIt

## 🎨 UI Features

- Clean and modern sign-in form
- Email field with validation and icon
- Password field with show/hide toggle
- Loading indicator during authentication
- Success/error snackbar messages
- Responsive layout with ScreenUtil

## 🧪 Error Handling

The implementation handles various error scenarios:

1. **Network Errors**: "No internet connection. Please check your network."
2. **Invalid Credentials** (401): Custom server message
3. **Server Errors** (500): "Failed to sign in. Please try again."
4. **Validation Errors**: Field-specific validation messages
5. **Unknown Errors**: "Something went wrong. Please try again."

## 🔜 Next Steps (TODO in code)

1. Navigate to home screen after successful login
2. Implement logout functionality
3. Add "Remember Me" functionality
4. Implement "Forgot Password" flow
5. Add biometric authentication

## 📝 Usage Example

```dart
// The SignInView is ready to use
Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => const SignInView()),
);
```

## 🧩 Reusable Components

You can now use these components anywhere in your auth feature:

```dart
// Email field
EmailTextFormField(
  controller: emailController,
  onChanged: (value) => print(value),
)

// Password field
PasswordTextFormField(
  controller: passwordController,
  minLength: 8, // Optional: custom min length
  hintText: 'Confirm Password', // Optional: custom hint
)
```

## 🔐 Token Management

After successful login:
- User token is stored in `User.token`
- User data is cached locally via `SharedPreferences`
- Token can be used for authenticated API requests

## 🎉 Summary

The login implementation is **production-ready** with:
- Clean Architecture principles
- Proper error handling
- State management with Cubit
- Reusable UI components
- Full API integration
- Type-safe code with null safety

You can now test the login functionality by running the app and navigating to the SignInView!

