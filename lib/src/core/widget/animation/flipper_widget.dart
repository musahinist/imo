import 'dart:math';

import 'package:flutter/material.dart';

class FlipperWidget extends StatefulWidget {
  const FlipperWidget({Key? key, required this.front, required this.back})
      : super(key: key);
  final Widget front;
  final Widget back;

  @override
  State<FlipperWidget> createState() => _FlipWidgetState();
}

class _FlipWidgetState extends State<FlipperWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> rotateAnime;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    rotateAnime = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(48),
      onTap: () {
        if (_controller.isCompleted) {
          _controller.reverse();
        } else {
          _controller.forward();
        }
      },
      child: AnimatedBuilder(
        animation: rotateAnime,
        builder: (context, child) {
          return Transform(
            transform: Matrix4.rotationY(pi * rotateAnime.value),
            child: Center(
              child: rotateAnime.value <= 0.5 ? widget.front : widget.back,
            ),
            alignment: Alignment.center,
          );
        },
        // child: ,
      ),
    );
  }
}
