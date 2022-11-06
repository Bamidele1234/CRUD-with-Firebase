// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:exercise6/screens/body1_screen.dart' as _i6;
import 'package:exercise6/screens/home_screen.dart' as _i2;
import 'package:exercise6/screens/login_screen.dart' as _i3;
import 'package:exercise6/screens/reset_password.dart' as _i5;
import 'package:exercise6/screens/sign_up.dart' as _i4;
import 'package:exercise6/screens/splash_screen.dart' as _i1;
import 'package:flutter/material.dart' as _i8;

class AppRouter extends _i7.RootStackRouter {
  AppRouter([_i8.GlobalKey<_i8.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    SplashScreenRoute.name: (routeData) {
      return _i7.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.SplashScreen(),
      );
    },
    HomeScreenRoute.name: (routeData) {
      return _i7.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i2.HomeScreen(),
        transitionsBuilder: _i7.TransitionsBuilders.slideLeft,
        durationInMilliseconds: 300,
        opaque: true,
        barrierDismissible: false,
      );
    },
    LoginScreenRoute.name: (routeData) {
      final args = routeData.argsAs<LoginScreenRouteArgs>(
          orElse: () => const LoginScreenRouteArgs());
      return _i7.CustomPage<dynamic>(
        routeData: routeData,
        child: _i3.LoginScreen(key: args.key),
        transitionsBuilder: _i7.TransitionsBuilders.slideLeft,
        durationInMilliseconds: 100,
        opaque: true,
        barrierDismissible: false,
      );
    },
    SignUpScreenRoute.name: (routeData) {
      final args = routeData.argsAs<SignUpScreenRouteArgs>(
          orElse: () => const SignUpScreenRouteArgs());
      return _i7.CustomPage<dynamic>(
        routeData: routeData,
        child: _i4.SignUpScreen(key: args.key),
        transitionsBuilder: _i7.TransitionsBuilders.slideLeft,
        durationInMilliseconds: 100,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ResetPasswordRoute.name: (routeData) {
      final args = routeData.argsAs<ResetPasswordRouteArgs>(
          orElse: () => const ResetPasswordRouteArgs());
      return _i7.CustomPage<dynamic>(
        routeData: routeData,
        child: _i5.ResetPassword(key: args.key),
        transitionsBuilder: _i7.TransitionsBuilders.slideLeft,
        durationInMilliseconds: 100,
        opaque: true,
        barrierDismissible: false,
      );
    },
    Body1ScreenRoute.name: (routeData) {
      return _i7.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i6.Body1Screen(),
        transitionsBuilder: _i7.TransitionsBuilders.slideLeft,
        durationInMilliseconds: 100,
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<_i7.RouteConfig> get routes => [
        _i7.RouteConfig(
          SplashScreenRoute.name,
          path: '/',
        ),
        _i7.RouteConfig(
          HomeScreenRoute.name,
          path: '/home',
        ),
        _i7.RouteConfig(
          LoginScreenRoute.name,
          path: '/login',
        ),
        _i7.RouteConfig(
          SignUpScreenRoute.name,
          path: '/signup',
        ),
        _i7.RouteConfig(
          ResetPasswordRoute.name,
          path: '/reset',
        ),
        _i7.RouteConfig(
          Body1ScreenRoute.name,
          path: '/body',
        ),
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashScreenRoute extends _i7.PageRouteInfo<void> {
  const SplashScreenRoute()
      : super(
          SplashScreenRoute.name,
          path: '/',
        );

  static const String name = 'SplashScreenRoute';
}

/// generated route for
/// [_i2.HomeScreen]
class HomeScreenRoute extends _i7.PageRouteInfo<void> {
  const HomeScreenRoute()
      : super(
          HomeScreenRoute.name,
          path: '/home',
        );

  static const String name = 'HomeScreenRoute';
}

/// generated route for
/// [_i3.LoginScreen]
class LoginScreenRoute extends _i7.PageRouteInfo<LoginScreenRouteArgs> {
  LoginScreenRoute({_i8.Key? key})
      : super(
          LoginScreenRoute.name,
          path: '/login',
          args: LoginScreenRouteArgs(key: key),
        );

  static const String name = 'LoginScreenRoute';
}

class LoginScreenRouteArgs {
  const LoginScreenRouteArgs({this.key});

  final _i8.Key? key;

  @override
  String toString() {
    return 'LoginScreenRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i4.SignUpScreen]
class SignUpScreenRoute extends _i7.PageRouteInfo<SignUpScreenRouteArgs> {
  SignUpScreenRoute({_i8.Key? key})
      : super(
          SignUpScreenRoute.name,
          path: '/signup',
          args: SignUpScreenRouteArgs(key: key),
        );

  static const String name = 'SignUpScreenRoute';
}

class SignUpScreenRouteArgs {
  const SignUpScreenRouteArgs({this.key});

  final _i8.Key? key;

  @override
  String toString() {
    return 'SignUpScreenRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i5.ResetPassword]
class ResetPasswordRoute extends _i7.PageRouteInfo<ResetPasswordRouteArgs> {
  ResetPasswordRoute({_i8.Key? key})
      : super(
          ResetPasswordRoute.name,
          path: '/reset',
          args: ResetPasswordRouteArgs(key: key),
        );

  static const String name = 'ResetPasswordRoute';
}

class ResetPasswordRouteArgs {
  const ResetPasswordRouteArgs({this.key});

  final _i8.Key? key;

  @override
  String toString() {
    return 'ResetPasswordRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i6.Body1Screen]
class Body1ScreenRoute extends _i7.PageRouteInfo<void> {
  const Body1ScreenRoute()
      : super(
          Body1ScreenRoute.name,
          path: '/body',
        );

  static const String name = 'Body1ScreenRoute';
}
