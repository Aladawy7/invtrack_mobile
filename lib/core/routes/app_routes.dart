import 'package:go_router/go_router.dart';
import 'package:invtrack/core/routes/routes.dart';
import 'package:invtrack/features/history/screen/history_screen.dart';
import 'package:invtrack/features/location/screen/location_screen.dart';
import 'package:invtrack/features/place/screen/place_screen.dart';
import 'package:invtrack/features/profile/screen/profile_screen.dart';
import 'package:invtrack/features/setting/screen/setting_screen.dart';
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
      GoRoute(
        path: Routes.locationscreen,
        builder: (context, state) => const LocationScreen(),
      ),
      GoRoute(
        path: Routes.profileScreen,
        builder: (context, state) => const ProfileScreen(),
      ),
      GoRoute(
        path: Routes.settingsScreen,
        builder: (context, state) => const SettingScreen(),
      ),
      GoRoute(
        path: Routes.historyscreen,
        builder: (context, state) => const HistoryScreen(),
      ),
    
      GoRoute(
        path: Routes.placescreen,
        builder: (context, state) {
          if (state.extra is Map<String, String>) {
            final m = state.extra as Map<String, String>;
            return PlaceScreen(
              location: m['location'],
              floor: m['floor'],
              room: m['room'],
            );
          }
          return const PlaceScreen();
        },
      ),
    ],
  );
}

