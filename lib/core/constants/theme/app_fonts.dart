library;

/// A singleton-style class that provides access to all font family names
/// used throughout the application.
///
/// Helps centralize font references to improve code maintainability
/// and reduce the risk of typos in font family names.
///
/// Example usage:
/// ```dart
/// Text('Hello, World!', style: TextStyle(fontFamily: AppFonts.humanst521BT));
/// ```

class AppFonts {
  AppFonts._(); // Private constructor to prevent instantiation

  static const String humanst521BT = 'Humanst521BT';

  static const String inter = 'Inter';

  // Add more fonts as needed
}
