import 'package:go_router/go_router.dart';
import 'package:invtrack/core/constant/routes.dart';
import 'package:invtrack/features/splash/screens/splash_screen.dart';
import 'package:invtrack/features/onboarding/screens/onboarding_screen_1.dart';
import 'package:invtrack/features/onboarding/screens/onboarding_screen_2.dart';
import 'package:invtrack/features/onboarding/screens/onboarding_screen_3.dart';
import 'package:invtrack/features/auth/screens/signin_screen.dart';
import 'package:invtrack/features/home/screen/home_screen.dart';

class AppRoute {
  static final GoRouter router = GoRouter(
    initialLocation: Routes.splashScreen,
    routes: [
      GoRoute(
        path: Routes.splashScreen,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: Routes.onboardingScreen1,
        builder: (context, state) => const OnboardingScreen1(),
      ),
      GoRoute(
        path: Routes.onboardingScreen2,
        builder: (context, state) => const OnboardingScreen2(),
      ),
      GoRoute(
        path: Routes.onboardingScreen3,
        builder: (context, state) => const OnboardingScreen3(),
      ),
      GoRoute(
        path: Routes.signinScreen,
        builder: (context, state) => const SigninScreen(),
      ),
      GoRoute(
        path: Routes.homeScreen,
        builder: (context, state) => const HomeScreen(),
      ),
    ],
  );
}
