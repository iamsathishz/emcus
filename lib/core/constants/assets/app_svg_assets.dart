library;

/// A singleton-style class that provides access to all SVG asset paths
/// used throughout the application.
///
/// Helps centralize SVG asset references to improve code maintainability
/// and reduce the risk of typos in asset paths.
///
/// Example usage:
/// ```dart
/// SvgPicture.asset(AppSvgAssets.dashboardNavbar);
/// ```

class AppSvgAssets {
  AppSvgAssets._(); // Private constructor to prevent instantiation

  // Base path for SVG assets
  static const String _basePath = 'assets/svg';

  static const String dashboardNavbar = '$_basePath/dashboard_navbar.svg';

  static const String diagnosticsNavbar = '$_basePath/diagnostics_navbar.svg';

  static const String maintanceNavbar = '$_basePath/maintance_navbar.svg';

  static const String menu = '$_basePath/menu.svg';

  static const String settingsNavbar = '$_basePath/settings_navbar.svg';

  // Add more SVG asset constants below
}
