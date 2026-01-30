import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:invtrack/core/constant/routes.dart';
import 'package:invtrack/features/onboarding/widgets/dotsIndicator.dart';
import 'package:invtrack/features/onboarding/widgets/onboarding_skip_button.dart';
import 'package:invtrack/features/onboarding/widgets/onboarding_icon_container.dart';
import 'package:invtrack/features/onboarding/widgets/onboarding_content.dart';
import 'package:invtrack/features/onboarding/widgets/onboarding_navigation_buttons.dart';
class OnboardingScreen1 extends StatelessWidget {
  const OnboardingScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            OnboardingSkipButton(
              onTap: () => context.go(Routes.signinScreen),
            ),
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
              
                children: [
                  const OnboardingIconContainer(
                    icon: Icons.assignment_turned_in_outlined,
                    iconColor: Color(0xFF0F4C81),
                  ),
                  const SizedBox(height: 40),
                  const OnboardingContent(
                    title: 'مرحبا في تطبيق الجرد',
                    description:
                        'نظام متكامل لتتبع وإدارة الأصول الحكومية بكل سهولة وفعالية',
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DotsIndicator(currentDotIndex: 0),
                    
                OnboardingNavigationButtons(
                  onPrevious: () => context.go(Routes.splashScreen),
                  onNext: () => context.go(Routes.onboardingScreen2),
                  showPreviousButton: false,
                  nextButtonColor: const Color(0xFF0F4C81),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
