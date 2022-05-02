import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../config/constant/asset.dart';

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
      appBar: AppBar(
        backgroundColor: Colors.indigo[900],
        // title: const Text('Sign In'),
        elevation: 0,
        actions: [
          TextButton.icon(
            style: TextButton.styleFrom(
              primary: Colors.white,
            ),
            label: const Text('Skip'),
            icon: const Icon(Icons.arrow_forward),
            onPressed: () {
              // Navigator.of(context).push(
              //   MaterialPageRoute(
              //     builder: (_) => const SignInView(),
              //   ),
              // );
            },
          ),
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          const CurvedBackground(),
          Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 36.0, bottom: 64),
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      _Page(
                        asset: Asset.svg.chemistryLab,
                        content: 'Easy to Create and Edit',
                      ),
                      _Page(
                        asset: Asset.svg.chemistryLab,
                        content: 'Well Designed Template',
                      ),
                      _Page(
                        asset: Asset.svg.chemistryLab,
                        content: 'East to Export and Share',
                      ),
                    ],
                  ),
                ),
              ),
              _Pagination(tabController: _tabController),
            ],
          ),
        ],
      ),
    );
  }
}

class _Page extends StatelessWidget {
  const _Page({
    Key? key,
    required this.content,
    required this.asset,
  }) : super(key: key);
  final String content;
  final String asset;
  @override
  Widget build(BuildContext context) {
    String type = asset.split('.').last;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        // if(type=='riv')
        //   SizedBox(
        //       // height: .5.sh,
        //       // width: 1.sw,
        //       child: RiveAnimation.asset(
        //         asset,
        //         fit: BoxFit.fitHeight,
        //       )),
        if (type == 'svg')
          SvgPicture.asset(
            asset,
            width: 1.sw,
            height: .4.sh,
          ),
        Center(child: Text(content)),
      ],
    );
  }
}

class _Pagination extends StatelessWidget {
  const _Pagination({
    Key? key,
    required TabController tabController,
  })  : _tabController = tabController,
        super(key: key);

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}

class CurvedBackground extends StatelessWidget {
  const CurvedBackground({
    Key? key,
    this.height = 240,
  }) : super(key: key);
  final double height;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Transform.scale(
        scale: 1.4,
        child: Container(
          height: height,
          transform: Matrix4.translationValues(0, -40, 0),
          decoration: BoxDecoration(
            color: Colors.indigo[900],
            borderRadius: BorderRadius.vertical(
              bottom: Radius.elliptical(MediaQuery.of(context).size.width, 160),
            ),
          ),
        ),
      ),
    );
  }
}
