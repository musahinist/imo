import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:imo/src/config/style/typography.dart';

import '../../../../config/constant/asset.dart';
import '../../../auth/bloc/login_bloc.dart';

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
                AssetSvg.logo,
                width: .3.sw,
              ),
              SvgPicture.asset(
                AssetSvg.illustration,
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
                    context.read<LoginBloc>().add(const LoginEvent(true));
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
