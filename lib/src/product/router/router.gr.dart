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
        routeData: routeData,
        child: const SplashView(),
      );
    },
    LandingRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const LandingView(),
      );
    },
    OnboardingRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const OnboardingView(),
      );
    },
    SignInRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const SignInView(),
      );
    },
    SignUpRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const SignUpView(),
      );
    },
    ShortenRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const ShortenView(),
      );
    },
    HomeRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const HomeView(),
      );
    },
    IdeaFormRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const IdeaFormView(),
      );
    },
    TaskDetailRoute.name: (routeData) {
      final args = routeData.argsAs<TaskDetailRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: TaskDetailView(
          key: args.key,
          task: args.task,
        ),
      );
    },
    SampleItemListRoute.name: (routeData) {
      final args = routeData.argsAs<SampleItemListRouteArgs>(
          orElse: () => const SampleItemListRouteArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: SampleItemListView(
          key: args.key,
          items: args.items,
        ),
      );
    },
    SettingsRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const SettingsView(),
      );
    },
    SampleItemDetailsRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const SampleItemDetailsView(),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          SplashRoute.name,
          path: '/',
        ),
        RouteConfig(
          LandingRoute.name,
          path: '/landing',
        ),
        RouteConfig(
          OnboardingRoute.name,
          path: '/onboarding',
        ),
        RouteConfig(
          SignInRoute.name,
          path: '/signIn',
        ),
        RouteConfig(
          SignUpRoute.name,
          path: '/signup',
        ),
        RouteConfig(
          ShortenRoute.name,
          path: '/shorten',
        ),
        RouteConfig(
          HomeRoute.name,
          path: '/home',
        ),
        RouteConfig(
          IdeaFormRoute.name,
          path: '/ideform',
        ),
        RouteConfig(
          TaskDetailRoute.name,
          path: '/task-detail',
        ),
        RouteConfig(
          SampleItemListRoute.name,
          path: '/sample',
        ),
        RouteConfig(
          SettingsRoute.name,
          path: '/settings',
        ),
        RouteConfig(
          SampleItemDetailsRoute.name,
          path: '/sample_item',
        ),
      ];
}

/// generated route for
/// [SplashView]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute()
      : super(
          SplashRoute.name,
          path: '/',
        );

  static const String name = 'SplashRoute';
}

/// generated route for
/// [LandingView]
class LandingRoute extends PageRouteInfo<void> {
  const LandingRoute()
      : super(
          LandingRoute.name,
          path: '/landing',
        );

  static const String name = 'LandingRoute';
}

/// generated route for
/// [OnboardingView]
class OnboardingRoute extends PageRouteInfo<void> {
  const OnboardingRoute()
      : super(
          OnboardingRoute.name,
          path: '/onboarding',
        );

  static const String name = 'OnboardingRoute';
}

/// generated route for
/// [SignInView]
class SignInRoute extends PageRouteInfo<void> {
  const SignInRoute()
      : super(
          SignInRoute.name,
          path: '/signIn',
        );

  static const String name = 'SignInRoute';
}

/// generated route for
/// [SignUpView]
class SignUpRoute extends PageRouteInfo<void> {
  const SignUpRoute()
      : super(
          SignUpRoute.name,
          path: '/signup',
        );

  static const String name = 'SignUpRoute';
}

/// generated route for
/// [ShortenView]
class ShortenRoute extends PageRouteInfo<void> {
  const ShortenRoute()
      : super(
          ShortenRoute.name,
          path: '/shorten',
        );

  static const String name = 'ShortenRoute';
}

/// generated route for
/// [HomeView]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '/home',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [IdeaFormView]
class IdeaFormRoute extends PageRouteInfo<void> {
  const IdeaFormRoute()
      : super(
          IdeaFormRoute.name,
          path: '/ideform',
        );

  static const String name = 'IdeaFormRoute';
}

/// generated route for
/// [TaskDetailView]
class TaskDetailRoute extends PageRouteInfo<TaskDetailRouteArgs> {
  TaskDetailRoute({
    Key? key,
    required Task task,
  }) : super(
          TaskDetailRoute.name,
          path: '/task-detail',
          args: TaskDetailRouteArgs(
            key: key,
            task: task,
          ),
        );

  static const String name = 'TaskDetailRoute';
}

class TaskDetailRouteArgs {
  const TaskDetailRouteArgs({
    this.key,
    required this.task,
  });

  final Key? key;

  final Task task;

  @override
  String toString() {
    return 'TaskDetailRouteArgs{key: $key, task: $task}';
  }
}

/// generated route for
/// [SampleItemListView]
class SampleItemListRoute extends PageRouteInfo<SampleItemListRouteArgs> {
  SampleItemListRoute({
    Key? key,
    List<SampleItem> items = const [
      SampleItem(1),
      SampleItem(2),
      SampleItem(3)
    ],
  }) : super(
          SampleItemListRoute.name,
          path: '/sample',
          args: SampleItemListRouteArgs(
            key: key,
            items: items,
          ),
        );

  static const String name = 'SampleItemListRoute';
}

class SampleItemListRouteArgs {
  const SampleItemListRouteArgs({
    this.key,
    this.items = const [SampleItem(1), SampleItem(2), SampleItem(3)],
  });

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
  const SettingsRoute()
      : super(
          SettingsRoute.name,
          path: '/settings',
        );

  static const String name = 'SettingsRoute';
}

/// generated route for
/// [SampleItemDetailsView]
class SampleItemDetailsRoute extends PageRouteInfo<void> {
  const SampleItemDetailsRoute()
      : super(
          SampleItemDetailsRoute.name,
          path: '/sample_item',
        );

  static const String name = 'SampleItemDetailsRoute';
}
