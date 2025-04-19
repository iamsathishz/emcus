import 'package:emcus_sathishkumar_r/core/constants/navigation/app_route.dart';
import 'package:emcus_sathishkumar_r/core/constants/navigation/route_names.dart';
import 'package:emcus_sathishkumar_r/injection_container.dart';
import 'package:emcus_sathishkumar_r/presentation/bloc/auth/auth_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// The main entry point of the application.
Future<void> main() async {
  // Ensures that Flutter binding is initialized before Firebase or any plugins.
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase for the project.
  await Firebase.initializeApp();

  // Initialize dependency injection using GetIt service locator.
  await init();

  // Start the Flutter application.
  runApp(const MyApp());
}

/// The root widget of the application.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // Provide the AuthBloc to the entire widget tree using the service locator.
      create: (context) => sl<AuthBloc>(),
      child: MaterialApp(
        title: 'EmcusBLE',

        // Initial route when the app starts (typically splash screen).
        initialRoute: RouteNames.splash,

        // Function that handles generating routes based on route names.
        onGenerateRoute: AppRouter.onGenerateRoute,

        // Hide the debug banner in release or production mode.
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

/*
├── config/
│   └── firebase_options.dart       # Firebase config file (auto-generated)
│
├── core/
│   ├── constants/                  # App-wide constants (colors, strings, etc.)
│   ├── exceptions/                 # Custom exception classes
│   ├── utils/                      # Helpers, validators, extensions
│   └── widgets/                    # Common reusable widgets
│
├── data/
│   ├── models/                     # Data models
│   ├── datasources/               # Firebase services (Firestore, Auth, etc.)
│   └── repositories/              # Implementation of repository interfaces
│
├── domain/
│   ├── entities/                  # Business entities (abstractions over models)
│   ├── repositories/              # Abstract repo interfaces (contracts)
│   └── usecases/                  # Application business logic
│
├── presentation/
│   ├── bloc/                      # BLoC and Cubit files for state management
│   │   └── auth/
│   │       ├── auth_bloc.dart
│   │       ├── auth_event.dart
│   │       └── auth_state.dart
│   ├── screens/                   # UI screens
│   │   └── login_screen.dart
│   │   └── home_screen.dart
│   └── routes/                    # AppRouter / Navigation
│
├── main.dart
└── injection_container.dart       # Dependency Injection setup
*/
