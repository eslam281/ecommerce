# 🛍️ E-Commerce Flutter Course

> A Flutter-based e-commerce learning project demonstrating mobile app development concepts, architecture patterns, and best practices in building cross-platform applications.

[![Flutter](https://img.shields.io/badge/Flutter-SDK-02569B?style=flat-square&logo=flutter)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.4.3+-0175C2?style=flat-square&logo=dart)](https://dart.dev)
[![Platform](https://img.shields.io/badge/Platform-iOS%20%7C%20Android-blue?style=flat-square)](https://flutter.dev)

## 📋 Overview

This is a **course-based e-commerce Flutter application** designed to teach mobile development principles and architecture patterns. The project serves as a foundation for building a functional e-commerce platform with GetX state management, Firebase integration, and modern Flutter development practices.

## 🏗️ Project Structure

```
lib/
├── bindings/              # Initial bindings for dependency injection
├── controller/            # GetX controllers for state management
├── core/
│   ├── localization/      # Multi-language support
│   │   ├── changelocal.dart
│   │   └── translation.dart
│   └── services/          # App initialization services
├── data/                  # Data layer (models, APIs, repositories)
├── view/                  # UI screens and widgets
├── main.dart             # Application entry point
├── routes.dart           # App navigation routes
└── test.dart             # Test utilities

android/                  # Android-specific configuration
ios/                      # iOS-specific configuration
assets/
├── images/              # Image assets
└── lottie/              # Lottie animation files
```

## 🚀 Getting Started

### Prerequisites

- **Flutter SDK**: 3.4.3 or higher
- **Dart SDK**: 3.4.3 or higher (bundled with Flutter)
- **Android Studio** or **Xcode** for mobile platform development
- **Git** for version control

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/eslam281/ecommerce.git
   cd ecommerce
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the application**
   ```bash
   flutter run
   ```

   Or target a specific device:
   ```bash
   flutter run -d emulator-5554   # Android emulator
   flutter run -d iPhone          # iOS simulator
   ```

### Building for Production

**Android (APK)**
```bash
flutter build apk --release
```

**Android (App Bundle for Play Store)**
```bash
flutter build appbundle --release
```

**iOS**
```bash
flutter build ios --release
```

## 📦 Core Dependencies

| Package | Version | Purpose |
|---------|---------|---------|
| `get` | ^4.6.1 | State management & routing |
| `http` | ^1.0.0 | HTTP client for API calls |
| `firebase_core` | ^3.8.1 | Firebase initialization |
| `firebase_auth` | ^5.4.2 | Firebase authentication |
| `firebase_messaging` | ^15.1.6 | Push notifications |
| `cloud_firestore` | ^5.5.1 | Cloud database |
| `sqflite` | ^2.0.2 | Local SQLite storage |
| `shared_preferences` | ^2.0.15 | Key-value storage |
| `cached_network_image` | ^3.2.0 | Image caching |
| `jiffy` | ^6.3.1 | DateTime manipulation |
| `intl` | ^0.19.0 | Internationalization |
| `qr_flutter` | ^4.0.0 | QR code generation |
| `google_sign_in` | ^5.3.1 | Google authentication |
| `flutter_local_notifications` | ^18.0.1 | Local notifications |
| `lottie` | ^3.1.3 | Lottie animations |

See `pubspec.yaml` for the complete dependency list.

## 🎯 Key Features

### Architecture
- **GetX Framework** - State management and routing
- **Bindings** - Dependency injection for clean dependency management
- **Controllers** - Business logic separation from UI
- **Localization** - Multi-language support

### Data Management
- **Firebase Integration** - Authentication, Firestore, Cloud Messaging
- **Local Storage** - SQLite for persistent data and SharedPreferences for app preferences
- **HTTP Client** - RESTful API communication

### UI/UX
- **Responsive Design** - Cairo and PlayfairDisplay custom fonts
- **Lottie Animations** - Rich motion graphics
- **Image Optimization** - Cached network images for performance
- **QR Code Support** - QR code generation and scanning

### Authentication
- **Firebase Auth** - Email/password and Google Sign-In
- **Google Integration** - Seamless Google authentication

### Notifications
- **Firebase Messaging** - Push notifications
- **Local Notifications** - In-app notifications with flutter_local_notifications

## 🌍 Localization

The app supports multiple languages with dynamic locale switching:
- Located in `lib/core/localization/`
- Translation management via `MyTranslation()`
- Language change controller with GetX reactive updates

## 🎨 Custom Fonts

The project includes custom typography:

**Cairo Font** - Primary typography with multiple weights
- Cairo-Black
- Cairo-Bold (weight 700)
- Cairo-Regular
- Cairo-SemiBold
- Cairo-Light
- Cairo-ExtraLight

**PlayfairDisplay Font** - Elegant serif font family
- PlayfairDisplay-Bold
- PlayfairDisplay-ExtraBold
- PlayfairDisplay-Medium
- PlayfairDisplay-Regular
- PlayfairDisplay-SemiBold

## 🔧 Configuration

### Firebase Setup

1. Create a Firebase project on [Firebase Console](https://console.firebase.google.com)
2. Add configuration files:
   - **Android**: `google-services.json` in `android/app/`
   - **iOS**: `GoogleService-Info.plist` in `ios/Runner/`

### Google Sign-In Setup

1. Configure OAuth credentials in Firebase Console
2. Add Web Client ID and iOS/Android client configurations
3. Configure signing certificate fingerprint for Android

### App Initialization

The app initializes through:
```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();  // Initialize services
  runApp(const MyApp());
}
```

## 🛣️ Routing

Navigation is managed through GetX routes defined in `lib/routes.dart`:

```dart
getPages: routes,  // Defined in routes.dart
initialBinding: InitialBindings(),  // Initial dependency binding
```

Routes support middleware for authentication and navigation control.

## 🧪 Testing

The project includes testing infrastructure:

```bash
flutter test                    # Run all tests
flutter test --coverage        # Generate coverage report
```

Test directory structure:
- `test/` - Unit and widget tests

## 📝 Environment Configuration

The app uses `.dart_define` and environment variables for configuration. Key settings can be configured through:

- `pubspec.yaml` - Dependency versions
- `analysis_options.yaml` - Linter rules
- Android/iOS platform-specific settings

## 🐛 Known Limitations

- Project is educational/course-focused with ongoing development
- Some features may be partially implemented
- Payment processing not fully configured
- Production API endpoints require setup

## 📚 Learning Focus Areas

This course project emphasizes:

✅ Flutter fundamentals and widget composition  
✅ GetX state management and routing  
✅ Firebase integration (Auth, Firestore, Messaging)  
✅ Local data persistence (SQLite, SharedPreferences)  
✅ API integration and HTTP communication  
✅ Localization and internationalization  
✅ Custom UI components and animations  
✅ Dependency injection and bindings  

## 🤝 Contributing

Contributions and improvements are welcome! Please follow standard Git workflow:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/improvement`)
3. Commit your changes (`git commit -m 'Add improvement'`)
4. Push to the branch (`git push origin feature/improvement`)
5. Open a Pull Request

## 📄 License

This project is open source. Check the LICENSE file for details.

## 👥 Author

**Eslam** ([@eslam281](https://github.com/eslam281))  
Flutter Developer | Course Creator

## 🔗 Useful Resources

- [Flutter Documentation](https://flutter.dev/docs)
- [Dart Language Guide](https://dart.dev)
- [GetX Documentation](https://github.com/jonataslaw/getx)
- [Firebase Flutter Setup](https://firebase.flutter.dev)
- [Pub.dev Packages](https://pub.dev)

## 📞 Support

For questions or issues:
- Open a GitHub issue: [Issues](https://github.com/eslam281/ecommerce/issues)
- Check the repository discussions
- Review course materials for learning context

---

<div align="center">

**Learning Flutter through E-Commerce Development**

⭐ If you find this project helpful, please give it a star!

</div>