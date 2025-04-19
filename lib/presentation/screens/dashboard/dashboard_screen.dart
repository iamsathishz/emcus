import 'package:emcus_sathishkumar_r/core/constants/assets/app_png_assets.dart';
import 'package:emcus_sathishkumar_r/core/constants/assets/app_svg_assets.dart';
import 'package:emcus_sathishkumar_r/core/constants/theme/app_colors.dart';
import 'package:emcus_sathishkumar_r/core/constants/theme/app_gradients.dart';
import 'package:emcus_sathishkumar_r/core/widgets/custom_text.dart';
import 'package:emcus_sathishkumar_r/presentation/screens/dashboard/home_screen.dart';
import 'package:emcus_sathishkumar_r/presentation/screens/dashboard/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    _buildCustomText('Maintenance'),
    _buildCustomText('Diagnostics'),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        appBar: _buildAppBar(size),
        body: _pages[_currentIndex],
        bottomNavigationBar: _buildBottomNavigationBar(),
      ),
    );
  }

  // Helper method to create CustomText widget
  static Widget _buildCustomText(String text) {
    return Center(
      child: CustomText(
        text,
        color: AppColors.white,
        fontSize: 35,
      ),
    );
  }

  // Helper method for AppBar
  _buildAppBar(Size size) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(70),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        child: Container(
          decoration: BoxDecoration(gradient: AppGradients.appBarGradient),
          child: AppBar(
            leading: SvgPicture.asset(
              AppSvgAssets.menu,
              height: 30,
              width: 30,
              fit: BoxFit.scaleDown,
            ),
            backgroundColor: Colors.transparent,
            title: Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Image.asset(AppPngAssets.appLogo, width: size.width / 3),
            ),
            centerTitle: true,
            elevation: 5,
          ),
        ),
      ),
    );
  }

  // Helper method for BottomNavigationBar
  Widget _buildBottomNavigationBar() {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        backgroundColor: AppColors.secondaryColor,
        items: [
          _buildBottomNavItem(AppSvgAssets.dashboardNavbar, 'Dashboard', 0),
          _buildBottomNavItem(AppSvgAssets.maintanceNavbar, 'Maintenance', 1),
          _buildBottomNavItem(AppSvgAssets.diagnosticsNavbar, 'Diagnostics', 2),
          _buildBottomNavItem(AppSvgAssets.settingsNavbar, 'Settings', 3),
        ],
      ),
    );
  }

  // Helper method to build BottomNavigationBar items
  BottomNavigationBarItem _buildBottomNavItem(
      String iconPath, String label, int index) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.only(top: 12),
        child: SvgPicture.asset(
          iconPath,
          color: _currentIndex == index ? Colors.white : Colors.grey.shade400,
        ),
      ),
      label: label,
    );
  }
}
