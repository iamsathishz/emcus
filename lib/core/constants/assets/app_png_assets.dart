library;

/// A singleton-style class that provides access to all PNG asset paths
/// used throughout the application.
///
/// Helps centralize PNG asset references to improve code maintainability
/// and reduce the risk of typos in asset paths.
///
/// Example usage:
/// ```dart
/// Image.asset(AppPngAssets.appLogo);
/// ```

class AppPngAssets {
  AppPngAssets._(); // Private constructor to prevent instantiation

  // Base path for PNG assets
  static const String _basePath = 'assets/png';

  static const String appLogo = '$_basePath/app_logo.png';

  static const String cctvImage = '$_basePath/cctv_image.png';

  static const String splashLogo = '$_basePath/splash_logo.png';

  // Add more PNG asset constants below
}
