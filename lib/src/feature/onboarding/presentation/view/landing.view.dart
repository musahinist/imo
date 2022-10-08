import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/style/typography.dart';
import '../../../../product/config/constant/asset_constant.dart';
import '../../../../product/router/router.dart';

class LandingView extends StatelessWidget {
  const LandingView({Key? key}) : super(key: key);
  static const routeName = '/landing';

  @override
  Widget build(BuildContext context) {
    return const _LandingViewBody();
  }
}

class _LandingViewBody extends StatelessWidget {
  const _LandingViewBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SvgPicture.asset(
                AssetConstant.logo,
                width: .3.sw,
              ),
              SvgPicture.asset(
                AssetConstant.chemistryLab,
                width: 1.sw,
              ),
              Column(
                children: [
                  const Text(
                    "Let's get started!.",
                    style: MyTypography.xlargeSemiBoldText,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Paste your first link into \nthe field to shorten it.',
                    style: MyTypography.xlargeRegularText,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: ElevatedButton(
                  onPressed: () {
                    context.router.navigate(const OnboardingRoute());
                    //   context.read<LoginBloc>().add(const LoginEvent(true));
                  },
                  child: Text(
                    'Start'.toUpperCase(),
                    style: MyTypography.xlargeSemiBoldText,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
