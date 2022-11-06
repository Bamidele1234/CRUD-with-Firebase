import 'package:auto_route/auto_route.dart';
import 'package:exercise6/screens/login_screen.dart';
import 'package:exercise6/screens/reset_password.dart';
import 'package:exercise6/screens/sign_up.dart';
import 'package:exercise6/screens/splash_screen.dart';

import '../screens/body1_screen.dart';
import '../screens/home_screen.dart';

@AdaptiveAutoRouter(
  routes: [
    AutoRoute(page: SplashScreen, initial: true),
    CustomRoute(
      path: HomeScreen.tag,
      page: HomeScreen,
      transitionsBuilder: TransitionsBuilders.slideLeft,
      durationInMilliseconds: 300,
    ),
    CustomRoute(
      path: LoginScreen.tag,
      page: LoginScreen,
      transitionsBuilder: TransitionsBuilders.slideLeft,
      durationInMilliseconds: 100,
    ),
    CustomRoute(
      path: SignUpScreen.tag,
      page: SignUpScreen,
      transitionsBuilder: TransitionsBuilders.slideLeft,
      durationInMilliseconds: 100,
    ),
    CustomRoute(
      path: ResetPassword.tag,
      page: ResetPassword,
      transitionsBuilder: TransitionsBuilders.slideLeft,
      durationInMilliseconds: 100,
    ),
    CustomRoute(
      path: Body1Screen.tag,
      page: Body1Screen,
      transitionsBuilder: TransitionsBuilders.slideLeft,
      durationInMilliseconds: 100,
    ),
  ],
)
class $AppRouter {}
