import 'package:emcus_sathishkumar_r/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class FluctuatingPercentage extends StatefulWidget {
  const FluctuatingPercentage({super.key});

  @override
  State<FluctuatingPercentage> createState() => _FluctuatingPercentageState();
}

class _FluctuatingPercentageState extends State<FluctuatingPercentage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _percentageAnim;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _percentageAnim = Tween<double>(begin: 93, end: 97).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _percentageAnim,
      builder: (context, child) {
        return CustomText(
          "${_percentageAnim.value.toStringAsFixed(1)}%",
          color: Colors.white,
          fontSize: 52,
          fontWeight: FontWeight.bold,
        );
      },
    );
  }
}
