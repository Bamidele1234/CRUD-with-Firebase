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
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:exercise6/screens/home_screen.dart' as _i2;
import 'package:exercise6/screens/login_screen.dart' as _i3;
import 'package:exercise6/screens/reset_password.dart' as _i5;
import 'package:exercise6/screens/sign_up.dart' as _i4;
import 'package:exercise6/screens/splash_screen.dart' as _i1;
import 'package:flutter/material.dart' as _i7;

class AppRouter extends _i6.RootStackRouter {
  AppRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    SplashScreenRoute.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.SplashScreen(),
      );
    },
    HomeScreenRoute.name: (routeData) {
      return _i6.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i2.HomeScreen(),
        transitionsBuilder: _i6.TransitionsBuilders.slideLeft,
        durationInMilliseconds: 350,
        opaque: true,
        barrierDismissible: false,
      );
    },
    LoginScreenRoute.name: (routeData) {
      final args = routeData.argsAs<LoginScreenRouteArgs>(
          orElse: () => const LoginScreenRouteArgs());
      return _i6.CustomPage<dynamic>(
        routeData: routeData,
        child: _i3.LoginScreen(key: args.key),
        transitionsBuilder: _i6.TransitionsBuilders.slideLeft,
        durationInMilliseconds: 150,
        opaque: true,
        barrierDismissible: false,
      );
    },
    SignUpScreenRoute.name: (routeData) {
      final args = routeData.argsAs<SignUpScreenRouteArgs>(
          orElse: () => const SignUpScreenRouteArgs());
      return _i6.CustomPage<dynamic>(
        routeData: routeData,
        child: _i4.SignUpScreen(key: args.key),
        transitionsBuilder: _i6.TransitionsBuilders.slideLeft,
        durationInMilliseconds: 150,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ResetPasswordRoute.name: (routeData) {
      final args = routeData.argsAs<ResetPasswordRouteArgs>(
          orElse: () => const ResetPasswordRouteArgs());
      return _i6.CustomPage<dynamic>(
        routeData: routeData,
        child: _i5.ResetPassword(key: args.key),
        transitionsBuilder: _i6.TransitionsBuilders.slideLeft,
        durationInMilliseconds: 150,
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(
          SplashScreenRoute.name,
          path: '/',
        ),
        _i6.RouteConfig(
          HomeScreenRoute.name,
          path: '/home',
        ),
        _i6.RouteConfig(
          LoginScreenRoute.name,
          path: '/login',
        ),
        _i6.RouteConfig(
          SignUpScreenRoute.name,
          path: '/signup',
        ),
        _i6.RouteConfig(
          ResetPasswordRoute.name,
          path: '/reset',
        ),
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashScreenRoute extends _i6.PageRouteInfo<void> {
  const SplashScreenRoute()
      : super(
          SplashScreenRoute.name,
          path: '/',
        );

  static const String name = 'SplashScreenRoute';
}

/// generated route for
/// [_i2.HomeScreen]
class HomeScreenRoute extends _i6.PageRouteInfo<void> {
  const HomeScreenRoute()
      : super(
          HomeScreenRoute.name,
          path: '/home',
        );

  static const String name = 'HomeScreenRoute';
}

/// generated route for
/// [_i3.LoginScreen]
class LoginScreenRoute extends _i6.PageRouteInfo<LoginScreenRouteArgs> {
  LoginScreenRoute({_i7.Key? key})
      : super(
          LoginScreenRoute.name,
          path: '/login',
          args: LoginScreenRouteArgs(key: key),
        );

  static const String name = 'LoginScreenRoute';
}

class LoginScreenRouteArgs {
  const LoginScreenRouteArgs({this.key});

  final _i7.Key? key;

  @override
  String toString() {
    return 'LoginScreenRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i4.SignUpScreen]
class SignUpScreenRoute extends _i6.PageRouteInfo<SignUpScreenRouteArgs> {
  SignUpScreenRoute({_i7.Key? key})
      : super(
          SignUpScreenRoute.name,
          path: '/signup',
          args: SignUpScreenRouteArgs(key: key),
        );

  static const String name = 'SignUpScreenRoute';
}

class SignUpScreenRouteArgs {
  const SignUpScreenRouteArgs({this.key});

  final _i7.Key? key;

  @override
  String toString() {
    return 'SignUpScreenRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i5.ResetPassword]
class ResetPasswordRoute extends _i6.PageRouteInfo<ResetPasswordRouteArgs> {
  ResetPasswordRoute({_i7.Key? key})
      : super(
          ResetPasswordRoute.name,
          path: '/reset',
          args: ResetPasswordRouteArgs(key: key),
        );

  static const String name = 'ResetPasswordRoute';
}

class ResetPasswordRouteArgs {
  const ResetPasswordRouteArgs({this.key});

  final _i7.Key? key;

  @override
  String toString() {
    return 'ResetPasswordRouteArgs{key: $key}';
  }
}
