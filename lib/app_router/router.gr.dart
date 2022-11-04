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
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:exercise6/screens/home_screen.dart' as _i2;
import 'package:exercise6/screens/login_screen.dart' as _i3;
import 'package:exercise6/screens/sign_up.dart' as _i4;
import 'package:exercise6/screens/splash_screen.dart' as _i1;
import 'package:flutter/material.dart' as _i6;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    SplashScreenRoute.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.SplashScreen(),
      );
    },
    HomeScreenRoute.name: (routeData) {
      return _i5.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i2.HomeScreen(),
        transitionsBuilder: _i5.TransitionsBuilders.slideLeft,
        durationInMilliseconds: 350,
        opaque: true,
        barrierDismissible: false,
      );
    },
    LoginScreenRoute.name: (routeData) {
      final args = routeData.argsAs<LoginScreenRouteArgs>(
          orElse: () => const LoginScreenRouteArgs());
      return _i5.CustomPage<dynamic>(
        routeData: routeData,
        child: _i3.LoginScreen(key: args.key),
        transitionsBuilder: _i5.TransitionsBuilders.slideLeft,
        durationInMilliseconds: 150,
        opaque: true,
        barrierDismissible: false,
      );
    },
    SignUpScreenRoute.name: (routeData) {
      final args = routeData.argsAs<SignUpScreenRouteArgs>(
          orElse: () => const SignUpScreenRouteArgs());
      return _i5.CustomPage<dynamic>(
        routeData: routeData,
        child: _i4.SignUpScreen(key: args.key),
        transitionsBuilder: _i5.TransitionsBuilders.slideLeft,
        durationInMilliseconds: 150,
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(
          SplashScreenRoute.name,
          path: '/',
        ),
        _i5.RouteConfig(
          HomeScreenRoute.name,
          path: '/home',
        ),
        _i5.RouteConfig(
          LoginScreenRoute.name,
          path: '/login',
        ),
        _i5.RouteConfig(
          SignUpScreenRoute.name,
          path: '/signup',
        ),
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashScreenRoute extends _i5.PageRouteInfo<void> {
  const SplashScreenRoute()
      : super(
          SplashScreenRoute.name,
          path: '/',
        );

  static const String name = 'SplashScreenRoute';
}

/// generated route for
/// [_i2.HomeScreen]
class HomeScreenRoute extends _i5.PageRouteInfo<void> {
  const HomeScreenRoute()
      : super(
          HomeScreenRoute.name,
          path: '/home',
        );

  static const String name = 'HomeScreenRoute';
}

/// generated route for
/// [_i3.LoginScreen]
class LoginScreenRoute extends _i5.PageRouteInfo<LoginScreenRouteArgs> {
  LoginScreenRoute({_i6.Key? key})
      : super(
          LoginScreenRoute.name,
          path: '/login',
          args: LoginScreenRouteArgs(key: key),
        );

  static const String name = 'LoginScreenRoute';
}

class LoginScreenRouteArgs {
  const LoginScreenRouteArgs({this.key});

  final _i6.Key? key;

  @override
  String toString() {
    return 'LoginScreenRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i4.SignUpScreen]
class SignUpScreenRoute extends _i5.PageRouteInfo<SignUpScreenRouteArgs> {
  SignUpScreenRoute({_i6.Key? key})
      : super(
          SignUpScreenRoute.name,
          path: '/signup',
          args: SignUpScreenRouteArgs(key: key),
        );

  static const String name = 'SignUpScreenRoute';
}

class SignUpScreenRouteArgs {
  const SignUpScreenRouteArgs({this.key});

  final _i6.Key? key;

  @override
  String toString() {
    return 'SignUpScreenRouteArgs{key: $key}';
  }
}
