import 'package:flutter/material.dart';

class AccordionListView extends StatelessWidget {
  const AccordionListView({
    Key? key,
    this.controller,
    required this.itemCount,
    this.heightFactor = 0.3,
    this.padding,
    required this.itemBuilder,
  }) : super(key: key);
  final double heightFactor;
  final Widget Function(BuildContext, int) itemBuilder;
  final ScrollController? controller;
  final EdgeInsetsGeometry? padding;
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: controller,
      itemCount: itemCount,
      padding: padding,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return Align(
            heightFactor: heightFactor.clamp(0.3, .7),
            alignment: Alignment.topCenter,
            child: itemBuilder(context, index));
      },
    );
  }
}
