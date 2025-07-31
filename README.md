
# 🏃‍♂️ Run Tracker – Flutter Engineering Test

A simple yet powerful Flutter app to manually track your runs, view them on a map, add photos, and more. Includes OpenAI integration for generating motivational titles.

## 🚀 Features

* ✅ User authentication (Firebase Auth)
* 🏃 Add a run with:

  * Distance
  * Duration
  * Location name
  * Optional photo
* 🗂️ View runs in a list

  * Tap to view full-size photo
  * Tap "View Map" to open location on map (OpenStreetMap)
* ☁️ Firebase backend

  * Firebase Auth
  * Firebase Cloud Firestore
  * Firebase Storage

---

## 🔑 Test Login

Use the following test credentials to log in:

```bash
Email: test@test.com  
Password: 12345678
```

---

## 🧪 Tech Stack

| Area             | Technology                          |
| ---------------- | ----------------------------------- |
| Backend          | Firebase (Auth, Firestore, Storage) |
| Authentication   | Firebase Auth                       |
| Storage          | Firebase Storage                    |
| Database         | Firebase Cloud Firestore            |
| Maps             | OpenStreetMap + `flutter_map`       |
| State Management | BLoC                                |

---

## 📦 Getting Started

### 1. 📥 Clone the Repository

```bash
git clone https://github.com/bakberdy/run_tracker_flutter.git
cd run_tracker_flutter
```

### 2. 🛠️ Install Dependencies

```bash
flutter pub get
```

### 3. 🔐 Set Up Firebase

Make sure you have set up Firebase for both Android and iOS:

* Add your `google-services.json` to `android/app/`
* Add your `GoogleService-Info.plist` to `ios/Runner/`
* Enable:

  * Email/password auth
  * Firestore
  * Firebase Storage

### 4. 🤖 Run the App

To run on a connected device or emulator:

```bash
flutter run
```

To build APK for Android:

```bash
flutter build apk
```

To build for iOS (on macOS with Xcode installed):

```bash
flutter build ios
```

---
