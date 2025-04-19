import 'package:emcus_sathishkumar_r/core/constants/theme/app_colors.dart';
import 'package:emcus_sathishkumar_r/core/constants/theme/app_fonts.dart';
import 'package:emcus_sathishkumar_r/core/constants/theme/app_gradients.dart';
import 'package:emcus_sathishkumar_r/core/utils/custom_painters/signal_painter.dart';
import 'package:emcus_sathishkumar_r/core/utils/custom_painters/wave_painter.dart';
import 'package:emcus_sathishkumar_r/core/utils/helpers/fluctuating_percentage.dart';
import 'package:emcus_sathishkumar_r/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';

/// HomeScreen displays a signal strength dashboard with animated wave,
/// fluctuating percentage, and status indicator.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  double _phase = 0;

  @override
  void initState() {
    super.initState();
    // Initialize animation controller for wave effect
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..addListener(() {
        setState(() {
          // Update wave phase for animation
          _phase += 0.05;
        });
      });
    // Start infinite animation loop
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: AppGradients.homeCardGradient,
        border: Border.all(color: AppColors.textColor),
        borderRadius: BorderRadius.circular(20),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 24),
            CustomPaint(
              size: Size(double.infinity, 100),
              painter: SignalPainter(),
            ),
            _buildTitle(),
            const SizedBox(height: 12),
            const FluctuatingPercentage(),
            const SizedBox(height: 28),
            _buildStatusTag(),
            const SizedBox(height: 60),
            _buildWaveSection(),
          ],
        ),
      ),
    );
  }

  /// Builds the screen title.
  Widget _buildTitle() {
    return CustomText(
      "SIGNAL STRENGTH",
      fontFamily: AppFonts.inter,
      fontSize: 14,
      color: Colors.white70,
      fontWeight: FontWeight.w500,
    );
  }

  /// Displays the signal status tag (e.g., GOOD with a check icon).
  Widget _buildStatusTag() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 32),
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomText(
            "GOOD",
            fontSize: 36,
            color: AppColors.green,
          ),
          const SizedBox(width: 10),
          Icon(
            Icons.check_circle,
            color: AppColors.green,
            size: 35,
          ),
        ],
      ),
    );
  }

  /// Renders the animated custom wave using a CustomPainter.
  Widget _buildWaveSection() {
    return SizedBox(
      height: 100,
      width: double.infinity,
      child: CustomPaint(
        painter: WavePainter(_phase),
      ),
    );
  }
}
