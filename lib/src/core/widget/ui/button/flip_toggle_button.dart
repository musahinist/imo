import 'dart:math';

import 'package:flutter/material.dart';

class FlipToggleButton extends StatefulWidget {
  const FlipToggleButton({
    Key? key,
    required this.children,
    required this.value,
    required this.onFlip,
  }) : super(key: key);

  final Map<dynamic, Widget> children;

  final dynamic value;
  final Function(dynamic) onFlip;

  @override
  State<FlipToggleButton> createState() => _FlipWidgetState();
}

class _FlipWidgetState extends State<FlipToggleButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> rotateAnime;
  // late T value;
  @override
  void initState() {
    super.initState();
    //  value = widget.value;
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    rotateAnime = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(48),
      onTap: () {
        if (_controller.isCompleted) {
          _controller.reverse();
          widget.onFlip(widget.children.keys.first);
        } else {
          _controller.forward();
          widget.onFlip(widget.children.keys.last);
        }
      },
      child: AnimatedBuilder(
        animation: rotateAnime,
        builder: (context, child) {
          return Transform(
            transform: Matrix4.rotationY(pi * rotateAnime.value),
            alignment: Alignment.center,
            child: rotateAnime.value <= 0.5
                ? widget.children.values.first
                : Transform(
                    transform: Matrix4.rotationY(pi),
                    child: widget.children.values.last,
                    alignment: Alignment.center,
                  ),
          );
        },
        // child: ,
      ),
    );
  }
}
