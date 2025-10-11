# Auth Feature Module

This module implements the authentication feature using Clean Architecture principles.

## Structure

The auth feature is organized into three main layers:

### 1. Domain Layer (`domain/`)
- **Entities**: Core business objects
  - `User`: Represents a user entity
  
- **Repositories**: Abstract contracts for data operations
  - `AuthRepository`: Defines authentication operations
  
- **Use Cases**: Business logic operations
  - `SignInWithGoogle`: Handle Google authentication
  - `SignInWithFacebook`: Handle Facebook authentication
  - `SignInWithTwitter`: Handle Twitter authentication

### 2. Data Layer (`data/`)
- **Models**: Data transfer objects
  - `UserModel`: Extends User entity with JSON serialization
  
- **Data Sources**:
  - `AuthRemoteDataSource`: Handles remote API calls (Firebase, etc.)
  - `AuthLocalDataSource`: Handles local caching with SharedPreferences
  
- **Repository Implementation**:
  - `AuthRepositoryImpl`: Implements AuthRepository with data sources

### 3. Presentation Layer (`presentation/`)
- **Cubit**: State management
  - `AuthCubit`: Manages authentication state
  - `AuthState`: Defines possible auth states (Initial, Loading, Success, Error, Unauthenticated)
  
- **Views**:
  - `AuthHomeView`: The "Let's Get Started" screen with social login options
  
- **Widgets**:
  - `SocialLoginButton`: Reusable social media login button
  - `PrimaryButton`: Primary action button
  - `AuthFooter`: Footer with "Already have account? Sign in" text

## Features

### Auth Home Screen
The main authentication landing page featuring:
- "Let's Get Started" header
- Facebook login button (blue)
- Twitter login button (light blue)
- Google login button (red)
- "Already have an account? Sign in" footer
- "Create an Account" primary button

## Dependencies

This feature is registered in the dependency injection container (`lib/core/di/injection_container.dart`) with the following registrations:
- AuthCubit (Factory)
- Use Cases (Lazy Singleton)
- Repository (Lazy Singleton)
- Data Sources (Lazy Singleton)

## Navigation

Route: `/auth-home` (defined in `Routes.authHome`)

## Next Steps

To complete the authentication implementation:

1. **Integrate Firebase Auth** (or your auth provider):
   - Add Firebase packages to `pubspec.yaml`
   - Configure Firebase in `android/` and `ios/`
   - Implement actual auth logic in `AuthRemoteDataSourceImpl`

2. **Create additional screens**:
   - Sign In with Email screen
   - Sign Up screen
   - Password reset screen

3. **Add form validation**:
   - Email validation
   - Password strength checking

4. **Implement session management**:
   - Auto-login on app start
   - Token refresh logic
   - Logout functionality

## Usage Example

```dart
// Navigate to auth home
Navigator.pushNamed(context, Routes.authHome);

// Use in widget
BlocProvider(
  create: (context) => sl<AuthCubit>(),
  child: AuthHomeView(),
)

// Trigger social login
context.read<AuthCubit>().signInGoogle();
```


