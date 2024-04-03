import 'package:doti_starter/src/core/routes/routes_constants.dart';
import 'package:doti_starter/src/features/auth/presentation/auth_page.dart';
import 'package:doti_starter/src/features/auth/presentation/forgot_password_page.dart';
import 'package:doti_starter/src/features/auth/presentation/register_page.dart';
import 'package:doti_starter/src/features/auth/presentation/reset_password_page.dart';
import 'package:doti_starter/src/features/auth/presentation/verify_OTP_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:doti_starter/index.dart';

final GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class NavigationService {
  final _appRoutes = {
    Routes.app: (_) => const HomePage(),
    Routes.auth: (_) => const AuthPage(),
    Routes.forgotPassword: (_) => const ForgotPasswordPage(),
    Routes.verifyOTP: (_) => const VerifyOTPPage(),
    Routes.register: (_) => const RegisterPage(),
    Routes.resetPassword: (_) => const ResetPasswordPage(),
    Routes.setting: (_) => const SettingsPage()
  };

  // iOS: full screen routes pop up from the bottom and disappear vertically too
  // On iOS that's a standard full screen dialog
  // Has no effect on Android.
  final Set<String> _fullScreenRoutes = {};

  // iOS transition: Pages that slides in from the right and exits in reverse.
  final Set<String> _cupertinoRoutes = {};

  static NavigationService of(BuildContext context) =>
      RepositoryProvider.of<NavigationService>(context);

  Future<dynamic> navigateTo(
    String routeName, {
    Object? arguments,
    bool replace = false,
  }) async {
    if (_appRoutes[routeName] != null) {
      return replace
          ? appNavigatorKey.currentState
              ?.pushReplacementNamed(routeName, arguments: arguments)
          : appNavigatorKey.currentState
              ?.pushNamed(routeName, arguments: arguments);
    }
  }

  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return _appRoutes[settings.name!] != null
        ? _cupertinoRoutes.contains(settings.name)
            ? CupertinoPageRoute(
                settings: settings,
                builder: (_) => _appRoutes[settings.name]!(settings.arguments),
                fullscreenDialog: _fullScreenRoutes.contains(settings.name),
              )
            : MaterialPageRoute(
                settings: settings,
                builder: (_) => _appRoutes[settings.name]!(settings.arguments),
                fullscreenDialog: _fullScreenRoutes.contains(settings.name),
              )
        : MaterialPageRoute(builder: (_) => const SplashView());
  }

  Future<dynamic> pushAndRemoveAll(
    String routeName, [
    Object? arguments,
  ]) async {
    return appNavigatorKey.currentState
        ?.pushNamedAndRemoveUntil(routeName, (route) => false);
  }
}


// import 'package:starterapp/pages/error/no_internet_page.dart';
// import 'package:starterapp/pages/landing_page.dart';
// import 'package:starterapp/pages/splash_page.dart';
// import 'package:starterapp/pages/undefinited_page.dart';

// Route<dynamic> generateRoute(RouteSettings settings) {
//   switch (settings.name) {
//     case RoutesConstants.splashScreenRoute:
//       return MaterialPageRoute(
//         settings: settings,
//         builder: (context) => const SplashPage(),
//       );
//     case RoutesConstants.landingRoute:
//       return MaterialPageRoute(
//         settings: settings,
//         builder: (context) => const LandingPage(),
//       );
//     case RoutesConstants.noInternetRoute:
//       return MaterialPageRoute(
//         settings: settings,
//         builder: (context) => const NoInternetPage(),
//       );
//     default:
//       return MaterialPageRoute(
//         settings: settings,
//         builder: (context) => UndefinitedPage(name: settings.name),
//       );
//   }
// }
