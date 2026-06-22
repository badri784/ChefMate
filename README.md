# 🍳 ChefMate

![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-%230175C2.svg?style=for-the-badge&logo=dart&logoColor=white)
![Firebase](https://img.shields.io/badge/Firebase-%23FFCA28.svg?style=for-the-badge&logo=firebase&logoColor=black)
![BLoC](https://img.shields.io/badge/BLoC-State_Management-blue?style=for-the-badge)

**ChefMate** is a cross-platform recipe discovery app built with Flutter. Browse global recipes, explore food categories, save your favorites, and manage your account — all with a clean, modern UI.

---

## ✨ Features

| Feature | Description |
|---------|-------------|
| 🔐 **Authentication** | Sign up & login with email/password via Firebase Auth |
| 👤 **User Profiles** | User data stored in Cloud Firestore |
| 🍽️ **Recipe Discovery** | Browse trending meals and global cuisines |
| 📂 **Categories** | Filter meals by food categories |
| 📖 **Detailed View** | Ingredients, cooking times, and step-by-step instructions |
| 🔍 **Search** | Search meals by name |
| 💾 **Save Meals** | Bookmark favorite recipes locally with Hive |
| 📤 **Share** | Share recipes with friends |
| 🌐 **Offline Support** | Graceful error handling when network is unavailable |
| 🎬 **Onboarding** | Animated onboarding flow for first-time users |

---

## 🛠️ Tech Stack

| Layer | Technology |
|-------|------------|
| **Framework** | [Flutter](https://flutter.dev/) |
| **Language** | [Dart](https://dart.dev/) |
| **State Management** | [flutter_bloc](https://pub.dev/packages/flutter_bloc) (Cubit) |
| **Networking** | [Dio](https://pub.dev/packages/dio) + [Retrofit](https://pub.dev/packages/retrofit) |
| **Authentication** | [Firebase Auth](https://pub.dev/packages/firebase_auth) |
| **Database** | [Cloud Firestore](https://pub.dev/packages/cloud_firestore) |
| **Local Storage** | [Hive](https://pub.dev/packages/hive_ce) + [SharedPreferences](https://pub.dev/packages/shared_preferences) |
| **DI** | [get_it](https://pub.dev/packages/get_it) |
| **Data Parsing** | [json_serializable](https://pub.dev/packages/json_serializable) + [build_runner](https://pub.dev/packages/build_runner) |
| **UI** | [Google Fonts](https://pub.dev/packages/google_fonts), [cached_network_image](https://pub.dev/packages/cached_network_image), [animated_text_kit](https://pub.dev/packages/animated_text_kit) |

---

## 🏗️ Project Structure

```
lib/
├── main.dart                     # App entry point
├── food_app.dart                 # MaterialApp configuration
├── firebase_options.dart         # Firebase config
│
├── core/                         # Shared app-wide code
│   ├── dependance_injection/     # get_it service registration
│   ├── helpers/                  # Extensions, spacing, font helpers
│   ├── local_storage/            # Hive local DB service
│   ├── logic/                    # BLoC/Cubit layer
│   │   └── cubit/
│   │       ├── category_cubit/       # Food categories
│   │       ├── food_meal_category/   # Meals by category
│   │       ├── meal_detail_screen/   # Meal detail
│   │       ├── save_meal_cubit/      # Saved/bookmarked meals
│   │       └── sing_to_app/          # Auth (login & signup)
│   ├── model/                    # Data models (food, category)
│   ├── networking/               # API services
│   │   ├── login_service/        # Firebase Auth repo
│   │   ├── repo/                 # Meal data repository
│   │   └── web_services/         # Retrofit API client
│   ├── routing/                  # Named routes & router
│   └── theme/                    # App theme & font weights
│
├── features/                     # Feature modules
│   ├── screens/ui/
│   │   ├── home/                 # Home screen
│   │   ├── detail_screen.dart/   # Meal detail screen
│   │   ├── search_screen.dart    # Search screen
│   │   ├── profile_screen.dart   # User profile
│   │   ├── saved_meals/          # Bookmarked meals
│   │   └── onboarding/           # Splash & auth screens
│   │       └── splash_screen/
│   │           └── login_screens/
│   │               ├── login_screen.dart
│   │               ├── sign_up_screen.dart
│   │               ├── login_widget/         # Splash welcome widgets
│   │               ├── login_screen_widget/  # Login form widgets
│   │               └── sign_up_widget/       # Sign up form widgets
│   └── widget/                   # Shared reusable widgets
```

---

## 🚀 Getting Started

### Prerequisites

- Flutter SDK `^3.11.0`
- Dart SDK `^3.11.0`
- Firebase project configured ([FlutterFire setup](https://firebase.flutter.dev/docs/overview))

### Installation

```bash
# 1. Clone the repo
git clone https://github.com/badri784/ChefMate.git
cd ChefMate

# 2. Install dependencies
flutter pub get

# 3. Generate code (models, Retrofit client)
dart run build_runner build --delete-conflicting-outputs

# 4. Run the app
flutter run
```

### Firebase Setup

1. Create a Firebase project at [console.firebase.google.com](https://console.firebase.google.com)
2. Enable **Email/Password** authentication
3. Enable **Cloud Firestore**
4. Add your Android/iOS app and download the config files
5. The `firebase_options.dart` is already included — update it if needed with:
   ```bash
   flutterfire configure
   ```

---

## 📸 Screenshots

<p align="center">
  <img width="200" alt="Onboarding" src="https://github.com/user-attachments/assets/bed7bda1-4eb8-40d6-9ec5-8a2bed86602d" />
  <img width="200" alt="Home" src="https://github.com/user-attachments/assets/8d67808a-1b1a-411c-85d2-f55310c57032" />
  <img width="200" alt="Categories" src="https://github.com/user-attachments/assets/0c6c8e64-529c-4ef7-aba5-2ee925d4487e" />
  <img width="200" alt="Detail" src="https://github.com/user-attachments/assets/de93a23f-26e2-47a6-af15-964bc2e38535" />
  <img width="200" alt="More" src="https://github.com/user-attachments/assets/0a125334-af64-4a23-a5f7-fd65a470ad36" />
</p>

---

## 🏛️ Architecture

<p align="center">
  <img alt="Architecture Diagram" src="https://github.com/user-attachments/assets/1299d7ce-d3d2-4465-99ef-20fc3b37f3ae" width="600" />
</p>

The app follows a **modular clean architecture** pattern:

- **UI Layer** → Screens & Widgets (Flutter)
- **Logic Layer** → Cubits (flutter_bloc)
- **Data Layer** → Repositories → API Services (Retrofit/Dio) + Firebase

---

## 📄 License

This project is for educational purposes.

---

<p align="center">
  Made with ❤️ using Flutter
</p>
