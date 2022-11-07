import 'package:auto_route/auto_route.dart';
import 'package:exercise6/screens/auth_page/auth_screen.dart';
import 'package:exercise6/screens/auth_page/login_screen.dart';
import 'package:exercise6/screens/reset_password.dart';
import 'package:exercise6/screens/auth_page/sign_up.dart';
import 'package:exercise6/screens/intro_page/splash_screen.dart';

import '../screens/body_page/task_screen.dart';
import '../screens/intro_page/home_screen.dart';

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
      path: TaskScreen.tag,
      page: TaskScreen,
      transitionsBuilder: TransitionsBuilders.slideLeft,
      durationInMilliseconds: 100,
    ),
    CustomRoute(
      path: AuthScreen.tag,
      page: AuthScreen,
      transitionsBuilder: TransitionsBuilders.slideLeft,
      durationInMilliseconds: 100,
    ),
  ],
)
class $AppRouter {}
