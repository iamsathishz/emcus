
# Flutter Firebase Clean Architecture App (EMCUS)

This project implements **Clean Architecture** principles in Flutter, utilizing **Firebase** as the backend and **BLoC** for state management. It is designed for scalability, maintainability, and testability.

---

## 🚀 Features

- Firebase Authentication
- Clean Architecture with clear separation of concerns
- BLoC pattern for efficient state management
- Dependency Injection using `get_it`
- Modular and scalable folder structure
- Well documented

---

## 📁 Project Structure

![Project Structure](https://github.com/user-attachments/assets/06231190-c174-4d1d-b0ab-c00c0620aeda)

---

## 🛠 Project Setup

Follow these steps to set up and integrate Firebase with your Flutter app.

### Step 1: Create a New Flutter Project
1. Open a terminal or command prompt.
2. Run the following command to create a new Flutter project:
   ```bash
   flutter create your_project_name
   ```

### Step 2: Add Firebase SDK Dependencies
1. Open the `pubspec.yaml` file in your project.
2. Add the following Firebase dependencies under the `dependencies` section:
   ```yaml
   dependencies:
     flutter:
       sdk: flutter
     firebase_core: ^3.13.0
     firebase_auth: ^5.5.2
     cloud_firestore: ^5.6.6
   ```
3. Save the file and run:
   ```bash
   flutter pub get
   ```
   to install the dependencies.

### Step 3: Firebase Integration

#### Set Up Firebase Project
1. Go to the [Firebase Console](https://console.firebase.google.com/).
2. Click on **Add Project** and follow the prompts to create a new project.
3. After the project is created, navigate to **Project Settings**.

#### Add Firebase to Your Flutter App (For Android)
1. In the Firebase Console, navigate to **Project Settings > General > Your Apps**, and click the Android icon to add Firebase to your Flutter Android app.
2. Download the `google-services.json` file and place it in the `android/app` directory of your Flutter project.
3. Modify the `android/build.gradle` file:
   ```gradle
   buildscript {
       ext.kotlin_version = '1.7.10'
       repositories {
           google()
           mavenCentral()
       }
       dependencies {
           classpath "org.jetbrains.kotlin:kotlin-gradle-plugin:$kotlin_version"
           classpath 'com.google.gms:google-services:4.4.2'
       }
   }
   ```
4. Modify the `android/app/build.gradle` file:
   ```gradle
   apply plugin: 'com.google.gms.google-services'
   ```

### Step 4: Initialize Firebase in Your Flutter App
1. Open the `main.dart` file in your project.
2. Add the following import at the top:
   ```dart
   import 'package:firebase_core/firebase_core.dart';
   ```
3. Modify the `main()` function to initialize Firebase:
   ```dart
   void main() async {
     WidgetsFlutterBinding.ensureInitialized();
     await Firebase.initializeApp();
     runApp(MyApp());
   }
   ```

---

## ▶️ Running the App
1. Connect an Android/iOS device or start an emulator/simulator.
2. Run the app with the following command:
   ```bash
   flutter run
   ```

---

Sources
  - Demo App video & APK added into the Asset folder under name of apk

  ![image](https://github.com/user-attachments/assets/2f410d32-61d0-4513-8e63-69a100511c72)


  

  
