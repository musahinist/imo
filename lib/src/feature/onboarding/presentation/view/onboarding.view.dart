import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../product/l10n/l10n.dart';
import '../../../../product/router/router.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({Key? key}) : super(key: key);
  static const routeName = '/onboarding';

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      setState(() {});
      // if (_tabController.index == 2) {
      //   Future.delayed(const Duration(seconds: 2), () {
      //     context.router.replaceAll([const SignInRoute()]);
      //   });
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          TabBarView(
            controller: _tabController,
            children: [
              Container(
                color: Colors.purple,
                child: Center(
                  child: Text(l10n.page1),
                ),
              ),
              Container(
                color: Colors.amber,
                child: Center(
                  child: Text(l10n.page2),
                ),
              ),
              Container(
                color: Colors.blue,
                child: const Center(
                  child: Text('Page 3'),
                ),
              ),
            ],
          ),
          SafeArea(
            child: Align(
              alignment: Alignment.topRight,
              child: TextButton.icon(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                ),
                label: const Text('Skip'),
                icon: const Icon(Icons.arrow_forward),
                onPressed: () {
                  context.router.replaceAll([const SignInRoute()]);
                },
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Visibility(
                    visible: _tabController.index > 0,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        _tabController.animateTo(_tabController.index - 1);
                      },
                    ),
                  ),
                  Visibility(
                    visible: _tabController.index < 2,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_forward),
                      onPressed: () {
                        _tabController.animateTo(_tabController.index + 1);
                      },
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 24.0),
                child: TabPageSelector(
                  controller: _tabController,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
