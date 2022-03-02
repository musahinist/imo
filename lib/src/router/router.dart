import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:imo/src/feature/home/presentation/view/home.view.dart';
import 'package:imo/src/feature/sample_feature/sample_item.dart';
import 'package:imo/src/feature/shorten/presentation/view/shorten.view.dart';

import '../feature/home/presentation/view/idea_form.view.dart';
import '../feature/landing/presentation/view/landing.view.dart';
import '../feature/sample_feature/sample_item_details_view.dart';
import '../feature/sample_feature/sample_item_list_view.dart';

import '../feature/settings/settings_view.dart';
import '../feature/splash/splah.view.dart';

part 'router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'View,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: SplashView,
      initial: true,
    ),
    AutoRoute(
      path: LandingView.routeName,
      page: LandingView,
    ),
    AutoRoute(
      path: ShortenView.routeName,
      page: ShortenView,
    ),
    AutoRoute(
      path: HomeView.routeName,
      page: HomeView,
    ),
    AutoRoute(
      path: IdeaFormView.routeName,
      page: IdeaFormView,
    ),
    AutoRoute(
      path: SampleItemListView.routeName,
      page: SampleItemListView,
    ),
    AutoRoute(
      page: SettingsView,
      path: SettingsView.routeName,
    ),
    AutoRoute(
      page: SampleItemDetailsView,
      path: SampleItemDetailsView.routeName,
    )
  ],
)

// extend the generated private router
class AppRouter extends _$AppRouter {}
