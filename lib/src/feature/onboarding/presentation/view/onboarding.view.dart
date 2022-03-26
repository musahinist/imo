import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../router/router.dart';

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
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          TabBarView(
            controller: _tabController,
            children: [
              Column(
                //  alignment: Alignment.topCenter,
                children: [
                  Transform.scale(
                    scale: 1.4,
                    child: Container(
                      height: 240,
                      transform: Matrix4.translationValues(0, -40, 0),
                      decoration: BoxDecoration(
                        color: Colors.indigo[900],
                        borderRadius: BorderRadius.vertical(
                            bottom: Radius.elliptical(
                                MediaQuery.of(context).size.width, 160)),
                      ),
                    ),
                  ),
                  const Center(
                    child: Text('Well Designed Template'),
                  ),
                ],
              ),
              Column(
                //  alignment: Alignment.topCenter,
                children: [
                  Transform.scale(
                    scale: 1.4,
                    child: Container(
                      height: 240,
                      transform: Matrix4.translationValues(0, -40, 0),
                      decoration: BoxDecoration(
                        color: Colors.indigo[900],
                        borderRadius: BorderRadius.vertical(
                            bottom: Radius.elliptical(
                                MediaQuery.of(context).size.width, 160)),
                      ),
                    ),
                  ),
                  const Center(
                    child: Text('East to Export and Share'),
                  ),
                ],
              ),
              Column(
                //  alignment: Alignment.topCenter,
                children: [
                  Transform.scale(
                    scale: 1.4,
                    child: Container(
                      height: 240,
                      transform: Matrix4.translationValues(0, -40, 0),
                      decoration: BoxDecoration(
                        color: Colors.indigo[900],
                        borderRadius: BorderRadius.vertical(
                            bottom: Radius.elliptical(
                                MediaQuery.of(context).size.width, 160)),
                      ),
                    ),
                  ),
                  const Center(
                    child: Text('Easy to Create and Edit'),
                  ),
                ],
              ),
            ],
          ),
          SafeArea(
            child: Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextButton.icon(
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                  ),
                  label: const Text('Skip'),
                  icon: const Icon(Icons.arrow_forward),
                  onPressed: () {
                    context.router.replaceAll([const SignInRoute()]);
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TabPageSelector(
                  controller: _tabController,
                ),
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
