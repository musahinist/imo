import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../feature/auth/presentation/view/sign_in.view.dart';
import '../../feature/auth/presentation/view/sign_up.view.dart';
import '../../feature/home/data/model/task.dart';
import '../../feature/home/presentation/view/home.view.dart';
import '../../feature/home/presentation/view/idea_form.view.dart';
import '../../feature/home/presentation/view/task_detail.view.dart';
import '../../feature/onboarding/presentation/view/landing.view.dart';
import '../../feature/onboarding/presentation/view/onboarding.view.dart';
import '../../feature/onboarding/presentation/view/splash.view.dart';
import '../../feature/sample_feature/sample_item.dart';
import '../../feature/sample_feature/sample_item_details_view.dart';
import '../../feature/sample_feature/sample_item_list_view.dart';
import '../../feature/settings/settings_view.dart';
import '../../feature/shorten/presentation/view/shorten.view.dart';

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
      path: OnboardingView.routeName,
      page: OnboardingView,
    ),
    AutoRoute(
      path: SignInView.routeName,
      page: SignInView,
    ),
    AutoRoute(
      path: SignUpView.routeName,
      page: SignUpView,
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
      path: TaskDetailView.routeName,
      page: TaskDetailView,
    ),
    AutoRoute(
      path: SampleItemListView.routeName,
      page: SampleItemListView,
    ),
    AutoRoute(
      path: SettingsView.routeName,
      page: SettingsView,
    ),
    AutoRoute(
      path: SampleItemDetailsView.routeName,
      page: SampleItemDetailsView,
    )
  ],
)

// extend the generated private router
class AppRouter extends _$AppRouter {}
