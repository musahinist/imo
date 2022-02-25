// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const SplashView());
    },
    HomeRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const HomeView());
    },
    SampleItemListRoute.name: (routeData) {
      final args = routeData.argsAs<SampleItemListRouteArgs>(
          orElse: () => const SampleItemListRouteArgs());
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: SampleItemListView(key: args.key, items: args.items));
    },
    SettingsRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const SettingsView());
    },
    SampleItemDetailsRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const SampleItemDetailsView());
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(SplashRoute.name, path: '/'),
        RouteConfig(HomeRoute.name, path: '/'),
        RouteConfig(SampleItemListRoute.name, path: '/sample'),
        RouteConfig(SettingsRoute.name, path: '/settings'),
        RouteConfig(SampleItemDetailsRoute.name, path: '/sample_item')
      ];
}

/// generated route for
/// [SplashView]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute() : super(SplashRoute.name, path: '/');

  static const String name = 'SplashRoute';
}

/// generated route for
/// [HomeView]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [SampleItemListView]
class SampleItemListRoute extends PageRouteInfo<SampleItemListRouteArgs> {
  SampleItemListRoute(
      {Key? key,
      List<SampleItem> items = const [
        SampleItem(1),
        SampleItem(2),
        SampleItem(3)
      ]})
      : super(SampleItemListRoute.name,
            path: '/sample',
            args: SampleItemListRouteArgs(key: key, items: items));

  static const String name = 'SampleItemListRoute';
}

class SampleItemListRouteArgs {
  const SampleItemListRouteArgs(
      {this.key,
      this.items = const [SampleItem(1), SampleItem(2), SampleItem(3)]});

  final Key? key;

  final List<SampleItem> items;

  @override
  String toString() {
    return 'SampleItemListRouteArgs{key: $key, items: $items}';
  }
}

/// generated route for
/// [SettingsView]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute() : super(SettingsRoute.name, path: '/settings');

  static const String name = 'SettingsRoute';
}

/// generated route for
/// [SampleItemDetailsView]
class SampleItemDetailsRoute extends PageRouteInfo<void> {
  const SampleItemDetailsRoute()
      : super(SampleItemDetailsRoute.name, path: '/sample_item');

  static const String name = 'SampleItemDetailsRoute';
}
