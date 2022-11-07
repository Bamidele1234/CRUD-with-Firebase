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
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:exercise6/screens/auth_page/auth_screen.dart' as _i7;
import 'package:exercise6/screens/auth_page/login_screen.dart' as _i3;
import 'package:exercise6/screens/auth_page/sign_up.dart' as _i4;
import 'package:exercise6/screens/body_page/task_screen.dart' as _i6;
import 'package:exercise6/screens/intro_page/home_screen.dart' as _i2;
import 'package:exercise6/screens/intro_page/splash_screen.dart' as _i1;
import 'package:exercise6/screens/reset_password.dart' as _i5;
import 'package:flutter/material.dart' as _i9;

class AppRouter extends _i8.RootStackRouter {
  AppRouter([_i9.GlobalKey<_i9.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    SplashScreenRoute.name: (routeData) {
      return _i8.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.SplashScreen(),
      );
    },
    HomeScreenRoute.name: (routeData) {
      return _i8.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i2.HomeScreen(),
        transitionsBuilder: _i8.TransitionsBuilders.slideLeft,
        durationInMilliseconds: 300,
        opaque: true,
        barrierDismissible: false,
      );
    },
    LoginScreenRoute.name: (routeData) {
      return _i8.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i3.LoginScreen(),
        transitionsBuilder: _i8.TransitionsBuilders.slideLeft,
        durationInMilliseconds: 100,
        opaque: true,
        barrierDismissible: false,
      );
    },
    SignUpScreenRoute.name: (routeData) {
      return _i8.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i4.SignUpScreen(),
        transitionsBuilder: _i8.TransitionsBuilders.slideLeft,
        durationInMilliseconds: 100,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ResetPasswordRoute.name: (routeData) {
      final args = routeData.argsAs<ResetPasswordRouteArgs>(
          orElse: () => const ResetPasswordRouteArgs());
      return _i8.CustomPage<dynamic>(
        routeData: routeData,
        child: _i5.ResetPassword(key: args.key),
        transitionsBuilder: _i8.TransitionsBuilders.slideLeft,
        durationInMilliseconds: 100,
        opaque: true,
        barrierDismissible: false,
      );
    },
    TaskScreenRoute.name: (routeData) {
      return _i8.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i6.TaskScreen(),
        transitionsBuilder: _i8.TransitionsBuilders.slideLeft,
        durationInMilliseconds: 100,
        opaque: true,
        barrierDismissible: false,
      );
    },
    AuthScreenRoute.name: (routeData) {
      return _i8.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i7.AuthScreen(),
        transitionsBuilder: _i8.TransitionsBuilders.slideLeft,
        durationInMilliseconds: 100,
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<_i8.RouteConfig> get routes => [
        _i8.RouteConfig(
          SplashScreenRoute.name,
          path: '/',
        ),
        _i8.RouteConfig(
          HomeScreenRoute.name,
          path: '/home',
        ),
        _i8.RouteConfig(
          LoginScreenRoute.name,
          path: '/login',
        ),
        _i8.RouteConfig(
          SignUpScreenRoute.name,
          path: '/signup',
        ),
        _i8.RouteConfig(
          ResetPasswordRoute.name,
          path: '/reset',
        ),
        _i8.RouteConfig(
          TaskScreenRoute.name,
          path: '/body',
        ),
        _i8.RouteConfig(
          AuthScreenRoute.name,
          path: '/auth',
        ),
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashScreenRoute extends _i8.PageRouteInfo<void> {
  const SplashScreenRoute()
      : super(
          SplashScreenRoute.name,
          path: '/',
        );

  static const String name = 'SplashScreenRoute';
}

/// generated route for
/// [_i2.HomeScreen]
class HomeScreenRoute extends _i8.PageRouteInfo<void> {
  const HomeScreenRoute()
      : super(
          HomeScreenRoute.name,
          path: '/home',
        );

  static const String name = 'HomeScreenRoute';
}

/// generated route for
/// [_i3.LoginScreen]
class LoginScreenRoute extends _i8.PageRouteInfo<void> {
  const LoginScreenRoute()
      : super(
          LoginScreenRoute.name,
          path: '/login',
        );

  static const String name = 'LoginScreenRoute';
}

/// generated route for
/// [_i4.SignUpScreen]
class SignUpScreenRoute extends _i8.PageRouteInfo<void> {
  const SignUpScreenRoute()
      : super(
          SignUpScreenRoute.name,
          path: '/signup',
        );

  static const String name = 'SignUpScreenRoute';
}

/// generated route for
/// [_i5.ResetPassword]
class ResetPasswordRoute extends _i8.PageRouteInfo<ResetPasswordRouteArgs> {
  ResetPasswordRoute({_i9.Key? key})
      : super(
          ResetPasswordRoute.name,
          path: '/reset',
          args: ResetPasswordRouteArgs(key: key),
        );

  static const String name = 'ResetPasswordRoute';
}

class ResetPasswordRouteArgs {
  const ResetPasswordRouteArgs({this.key});

  final _i9.Key? key;

  @override
  String toString() {
    return 'ResetPasswordRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i6.TaskScreen]
class TaskScreenRoute extends _i8.PageRouteInfo<void> {
  const TaskScreenRoute()
      : super(
          TaskScreenRoute.name,
          path: '/body',
        );

  static const String name = 'TaskScreenRoute';
}

/// generated route for
/// [_i7.AuthScreen]
class AuthScreenRoute extends _i8.PageRouteInfo<void> {
  const AuthScreenRoute()
      : super(
          AuthScreenRoute.name,
          path: '/auth',
        );

  static const String name = 'AuthScreenRoute';
}
