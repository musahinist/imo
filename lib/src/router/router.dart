import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:imo/src/feature/sample_feature/sample_item.dart';

import '../feature/home/view/home.view.dart';
import '../feature/home/view/idea_form.view.dart';
import '../feature/sample_feature/sample_item_details_view.dart';
import '../feature/sample_feature/sample_item_list_view.dart';

import '../feature/splash/splah.view.dart';
import '../settings/settings_view.dart';

part 'router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'View,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: SplashView,
      initial: true,
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
