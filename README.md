# 🛍️ Shoppe App

A modern e-commerce mobile application built with Flutter following Clean Architecture principles. The app provides a seamless shopping experience with robust authentication and elegant UI design.

## 📱 Features

### ✅ Implemented Features
- **Welcome/Onboarding Flow**: Interactive introduction to the app
- **Authentication System**: Complete login/register flow with email verification
- **Clean Architecture**: Scalable and maintainable codebase structure
- **State Management**: Efficient state handling with Flutter Bloc/Cubit
- **Responsive Design**: Adaptive UI that works across different screen sizes
- **Secure Storage**: Token management and secure data persistence
- **Network Layer**: Robust API integration with error handling

### 🔐 Authentication Features
- Email/Password login and registration
- Email verification system
- Password reset functionality
- Secure token storage
- Social login preparation (Google, Facebook, Twitter)
- Form validation with user-friendly error messages

## 🏗️ Architecture

This project follows **Clean Architecture** principles with clear separation of concerns:

```
lib/
├── core/                           # Shared functionality
│   ├── cache/                      # Local storage utilities
│   ├── constants/                  # App-wide constants
│   ├── di/                         # Dependency injection
│   ├── errors/                     # Error handling
│   ├── network/                    # Network utilities
│   ├── routes/                     # Navigation management
│   ├── theme/                      # App theming
│   ├── utils/                      # Helper utilities
│   └── widgets/                    # Reusable widgets
│
├── features/                       # Feature modules
│   ├── auth/                       # Authentication feature
│   │   ├── data/                   # Data layer
│   │   │   ├── datasources/        # API & local data sources
│   │   │   ├── models/             # Data models
│   │   │   └── repositories/       # Repository implementations
│   │   ├── domain/                 # Business logic layer
│   │   │   ├── entities/           # Business entities
│   │   │   ├── repositories/       # Repository contracts
│   │   │   └── usecases/           # Business use cases
│   │   └── presentation/           # UI layer
│   │       ├── cubit/              # State management
│   │       ├── views/              # Screen pages
│   │       └── widgets/            # Feature-specific widgets
│   │
│   └── welcome/                    # Onboarding feature
│       └── presentation/           # UI components
│           ├── views/              # Welcome screens
│           └── widgets/            # Welcome widgets
│
├── main.dart                       # App entry point
└── shoppe_app.dart                 # Root app widget
```

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (>=3.9.2)
- Dart SDK
- Android Studio / VS Code
- Android/iOS device or emulator

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd shoppe-app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Generate code (for models and API services)**
   ```bash
   flutter packages pub run build_runner build --delete-conflicting-outputs
   ```

4. **Run the app**
   ```bash
   flutter run
   ```

## 📦 Dependencies

### Core Dependencies
- **flutter_bloc** (^9.1.1): State management
- **get_it** (^8.0.2): Dependency injection
- **dartz** (^0.10.1): Functional programming utilities
- **equatable** (^2.0.5): Value equality comparisons

### UI & Design
- **flutter_screenutil** (^5.9.3): Responsive design
- **google_fonts** (^6.3.2): Custom typography
- **font_awesome_flutter** (^10.10.0): Icon library
- **flutter_native_splash** (^2.4.6): Splash screen

### Networking & Storage
- **dio** (^5.7.0): HTTP client
- **retrofit** (^4.4.1): Type-safe REST client
- **pretty_dio_logger** (^1.4.0): Network logging
- **flutter_secure_storage** (^9.2.4): Secure data storage
- **shared_preferences** (^2.5.3): Local preferences

### Authentication & Security
- **jwt_decoder** (^2.0.1): JWT token handling
- **pinput** (^5.0.0): PIN/OTP input widget

### Code Generation
- **json_annotation** (^4.9.0): JSON serialization annotations
- **build_runner** (^2.4.13): Code generation
- **json_serializable** (^6.9.2): JSON serialization generator
- **retrofit_generator** (^9.1.2): Retrofit code generator

## 🔧 Configuration

### API Configuration
The app connects to the backend API at:
```
Base URL: https://accessories-eshop.runasp.net
```

### Environment Setup
1. Update API endpoints in `lib/core/constants/app_constants.dart`
2. Configure splash screen in `flutter_native_splash.yaml`
3. Set up app icons and assets in `pubspec.yaml`

## 🎨 UI/UX Features

- **Modern Design**: Clean and intuitive interface
- **Responsive Layout**: Adapts to different screen sizes
- **Custom Theming**: Consistent color scheme and typography
- **Smooth Animations**: Engaging user interactions
- **Form Validation**: Real-time input validation
- **Loading States**: Clear feedback during operations
- **Error Handling**: User-friendly error messages

## 🔐 Security Features

- **Secure Token Storage**: JWT tokens stored securely
- **Input Validation**: Client-side and server-side validation
- **Network Security**: HTTPS communication
- **Error Handling**: Secure error messages without sensitive data exposure

## 📱 Screens Overview

### Welcome Flow
- **Welcome Screen**: App introduction and onboarding
- **Getting Started**: Navigation to authentication

### Authentication Flow
- **Auth Home**: Choose login method
- **Sign In**: Email/password login
- **Sign Up**: User registration
- **Email Verification**: Verify email address
- **Forgot Password**: Password reset request
- **Reset Password**: Set new password

## 🧪 Testing

Run tests with:
```bash
flutter test
```

## 🔄 State Management

The app uses **Cubit** (simplified Bloc) for state management:

- **States**: Immutable state classes extending `Equatable`
- **Events**: User actions and system events
- **Business Logic**: Separated into use cases
- **UI Updates**: Reactive UI updates based on state changes

## 🌐 API Integration

### Authentication Endpoints
- `POST /api/auth/login` - User login
- `POST /api/auth/register` - User registration
- `POST /api/auth/verify-email` - Email verification
- `POST /api/auth/forgot-password` - Password reset request
- `POST /api/auth/reset-password` - Password reset

### Error Handling
- Network connectivity checks
- HTTP status code handling
- User-friendly error messages
- Retry mechanisms

## 📁 Project Structure Details

### Clean Architecture Layers

1. **Domain Layer** (Business Logic)
   - Pure Dart code, no Flutter dependencies
   - Contains entities, repositories, and use cases
   - Defines business rules and logic

2. **Data Layer** (Data Management)
   - Handles data from various sources (API, local storage)
   - Implements repository contracts from domain layer
   - Contains models with JSON serialization

3. **Presentation Layer** (UI)
   - Flutter-specific code
   - Widgets, screens, and state management
   - Depends on domain layer only

## 🔧 Development Guidelines

### Adding New Features
1. Create feature folder under `lib/features/`
2. Implement domain layer (entities, repositories, use cases)
3. Implement data layer (models, data sources, repositories)
4. Implement presentation layer (views, widgets, cubit)
5. Register dependencies in `injection_container.dart`
6. Add routes in `app_routes.dart`

### Code Style
- Follow Dart/Flutter conventions
- Use meaningful variable and function names
- Add documentation for public APIs
- Implement proper error handling
- Write unit tests for business logic

## 🚀 Deployment

### Android
```bash
flutter build apk --release
```

### iOS
```bash
flutter build ios --release
```

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests if applicable
5. Submit a pull request

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 📞 Support

For support and questions, please contact the development team or create an issue in the repository.

---

**Built with ❤️ using Flutter and Clean Architecture principles**