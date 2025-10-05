# Shoppe App - Clean Architecture

This project follows Clean Architecture principles with a clear separation of concerns.

## Project Structure

```
lib/
├── core/                           # Core functionality shared across features
│   ├── constants/                  # App-wide constants
│   │   └── constants.dart          # API, storage keys, design constants
│   ├── di/                         # Dependency Injection
│   │   └── injection_container.dart # GetIt service locator setup
│   ├── errors/                     # Error handling
│   │   ├── exceptions.dart         # Custom exceptions
│   │   └── failures.dart           # Failure classes for error handling
│   ├── network/                    # Network utilities
│   │   └── network_info.dart       # Internet connectivity checker
│   ├── routes/                     # Navigation
│   │   ├── app_routes.dart         # Route generation logic
│   │   └── routes.dart             # Route constants
│   ├── theme/                      # App theming
│   │   └── app_theme.dart          # Material theme configuration
│   ├── usecases/                   # Base use case classes
│   │   └── usecase.dart            # Abstract UseCase class
│   └── utils/                      # Utilities
│       ├── app_colors.dart         # Color constants
│       └── app_strings.dart        # String constants
│
├── feature/                        # Features organized by domain
│   ├── welcome/                    # Welcome/Onboarding feature
│   │   ├── data/                   # Data layer
│   │   │   ├── datasources/        # Data sources (API, local storage)
│   │   │   │   └── welcome_local_datasource.dart
│   │   │   ├── models/             # Data models (JSON serializable)
│   │   │   │   └── onboarding_item_model.dart
│   │   │   └── repositories/       # Repository implementations
│   │   │       └── welcome_repository_impl.dart
│   │   ├── domain/                 # Domain layer (business logic)
│   │   │   ├── entities/           # Business entities
│   │   │   │   └── onboarding_item.dart
│   │   │   ├── repositories/       # Repository contracts
│   │   │   │   └── welcome_repository.dart
│   │   │   └── usecases/           # Use cases (business rules)
│   │   │       ├── complete_onboarding.dart
│   │   │       └── get_onboarding_items.dart
│   │   └── presentation/           # Presentation layer (UI)
│   │       ├── cubit/              # State management (Cubit)
│   │       │   ├── welcome_cubit.dart
│   │       │   └── welcome_state.dart
│   │       ├── Views/              # Screen pages
│   │       │   └── welcome_page.dart
│   │       └── widgets/            # Reusable widgets
│   │           ├── onboarding_content.dart
│   │           └── page_indicator.dart
│   │
│   └── home/                       # Home feature
│
├── main.dart                       # App entry point
└── shoppe_app.dart                 # Root widget
```

## Clean Architecture Layers

### 1. Domain Layer (Business Logic)
- **Entities**: Pure Dart objects representing business models
- **Repositories**: Abstract contracts defining data operations
- **Use Cases**: Single-responsibility business rules

### 2. Data Layer (Data Management)
- **Models**: Data representations with JSON serialization
- **Data Sources**: Interfaces for data retrieval (API, local storage)
- **Repository Implementations**: Concrete implementations of domain repositories

### 3. Presentation Layer (UI)
- **Views**: Full-screen views
- **Widgets**: Reusable UI components
- **Cubit/Bloc**: State management using flutter_bloc

## Dependencies

- **flutter_bloc**: State management
- **get_it**: Dependency injection
- **dartz**: Functional programming (Either for error handling)
- **equatable**: Value equality
- **flutter_screenutil**: Responsive UI
- **google_fonts**: Custom fonts

## Key Principles

1. **Dependency Rule**: Dependencies point inward (Presentation → Domain ← Data)
2. **Separation of Concerns**: Each layer has a single responsibility
3. **Testability**: Business logic is independent of frameworks and UI
4. **Dependency Injection**: Loose coupling via GetIt service locator
5. **Error Handling**: Either<Failure, Success> pattern from dartz

## Getting Started

1. Install dependencies: `flutter pub get`
2. Run the app: `flutter run`
3. The app starts with the Welcome/Onboarding screen
4. Navigate to Home after completing onboarding

## Adding New Features

To add a new feature, follow this structure:

1. Create feature folder under `lib/feature/`
2. Add domain layer (entities, repositories, use cases)
3. Add data layer (models, data sources, repository implementations)
4. Add presentation layer (Views, widgets, cubit/bloc)
5. Register dependencies in `injection_container.dart`
6. Add routes in `app_routes.dart`

## State Management

This project uses **Cubit** (simplified Bloc) for state management:
- States are immutable and extend `Equatable`
- Business logic is kept in use cases, not in Cubit
- Cubit orchestrates use cases and emits states

## Error Handling

Errors are handled using the Either pattern:
- `Left(Failure)`: Error case
- `Right(Data)`: Success case

Failures are converted from Exceptions at the repository level.

