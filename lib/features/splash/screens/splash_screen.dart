import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:invtrack/core/utils/colors.dart';
import 'package:invtrack/core/constant/routes.dart';
import 'package:invtrack/features/splash/widgets/splash_logo.dart';
import 'package:invtrack/features/splash/widgets/splash_title.dart';
import 'package:invtrack/features/splash/widgets/splash_loader.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToOnboarding();
  }

  void _navigateToOnboarding() async {
    await Future.delayed(const Duration(seconds: 3));
    if (mounted) {
      context.go(Routes.onboardingScreen1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.primary,
              AppColors.primaryLight,
             
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SplashLogo(),
            const SplashTitle(),
            SplashLoader(),
          ],
        ),
      ),
    );
  }
}
