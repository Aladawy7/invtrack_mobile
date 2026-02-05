import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:invtrack/core/routes/routes.dart';
import 'package:invtrack/features/onboarding/widgets/dotsIndicator.dart';
import 'package:invtrack/features/onboarding/widgets/onboarding_skip_button.dart';
import 'package:invtrack/features/onboarding/widgets/onboarding_icon_container.dart';
import 'package:invtrack/features/onboarding/widgets/onboarding_content.dart';
import 'package:invtrack/features/onboarding/widgets/onboarding_navigation_buttons.dart';

class OnboardingScreen2 extends StatelessWidget {
  const OnboardingScreen2({super.key});

  @override
  Widget build(BuildContext context) {
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
                    icon: Icons.qr_code_2,
                    iconColor: Color(0xFF2563EB),
                  ),
                  const SizedBox(height: 40),
                  const OnboardingContent(
                    title: 'مسح سريع ودقيق',
                    description:
                        "مسح الباركود او ال QR code للحصول على معلومات فورية عن الأصول و فحصها والقيام بالجرد بسهولة",
                  ),
                ],
              ),
            ),
            Column(
              children: [
                DotsIndicator(currentDotIndex: 1),
                OnboardingNavigationButtons(
                  onPrevious: () => context.go(Routes.onboardingScreen1),
                  onNext: () => context.go(Routes.onboardingScreen3),
                  nextButtonColor: const Color(0xFF2563EB),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
