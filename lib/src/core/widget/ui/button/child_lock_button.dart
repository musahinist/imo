import 'dart:math';

import 'package:flutter/material.dart';

class ChildLock extends StatefulWidget {
  const ChildLock({
    Key? key,
    required this.child,
    required this.onUnLock,
    this.followerAnchor = Alignment.bottomRight,
    this.targetAnchor = Alignment.topLeft,
  }) : super(key: key);
  final Widget child;
  final VoidCallback onUnLock;
  final Alignment followerAnchor;
  final Alignment targetAnchor;

  @override
  State<ChildLock> createState() => _ChildLockState();
}

class _ChildLockState extends State<ChildLock>
    with SingleTickerProviderStateMixin {
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;

  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    );
  }

  void buildPieProgress() {
    final overlay = Overlay.of(context);

    if (_overlayEntry != null) {
      _controller.reset();
      _overlayEntry!.remove();
      _overlayEntry = null;
    } else {
      _controller.forward();
      _controller.addListener(() {
        if (_controller.isCompleted) {
          overlay!.setState(() {});
          widget.onUnLock();
          print('unlock');
        }
      });
      _overlayEntry = OverlayEntry(builder: (_) {
        return Center(
          child: CompositedTransformFollower(
            targetAnchor: widget.targetAnchor,
            followerAnchor: widget.followerAnchor,
            link: _layerLink,
            child: FloatingActionButton(
              mini: true,
              backgroundColor: Colors.white,
              onPressed: null,
              child: SizedBox(
                width: 32,
                height: 32,
                child: Stack(
                  alignment: Alignment.center,
                  fit: StackFit.expand,
                  children: [
                    AnimatedBuilder(
                      animation: _controller,
                      builder: (context, child) {
                        return CustomPaint(
                          painter: PiePainter(
                            color: Colors.amber,
                            value: _controller.value * 2 * pi,
                          ),
                        );
                      },
                    ),
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 500),
                      child: _controller.isCompleted
                          ? const Icon(
                              Icons.lock_open,
                              size: 16,
                            )
                          : const Icon(
                              Icons.lock,
                              size: 16,
                            ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      });
      overlay!.insert(_overlayEntry!);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: Listener(
        onPointerDown: (_) {
          buildPieProgress();
        },
        onPointerUp: (_) {
          buildPieProgress();
        },
        child: widget.child,
      ),
    );
  }
}

// create pie painter with custom painter
class PiePainter extends CustomPainter {
  final double value;
  final Color color;

  const PiePainter({
    required this.value,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.red.shade100;

    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    // canvas.drawCircle(rect.center, rect.width / 2 + 8, paint);

    paint.color = color;

    canvas.drawArc(rect, 0, value, true, paint);
  }

  @override
  bool shouldRepaint(PiePainter oldDelegate) {
    return true; //oldDelegate.value != value || oldDelegate.color != color;
  }
}
