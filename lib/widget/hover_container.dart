import 'package:flutter/material.dart';

class HoverContainer extends StatefulWidget {
  const HoverContainer({
    super.key,
    required this.child,
    this.width = double.maxFinite,
    this.height = double.maxFinite,
    this.decoration,
    this.padding = const EdgeInsets.all(8),
    this.onTap,
  });
  final double? width;
  final double? height;
  final BoxDecoration? decoration;
  final EdgeInsets? padding;
  final VoidCallback? onTap;
  final Widget child;

  @override
  State<HoverContainer> createState() => _HoverContainerState();
}

class _HoverContainerState extends State<HoverContainer> with TickerProviderStateMixin {
  bool scale = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          scale = true;
        });
      },
      onExit: (event) {
        setState(() {
          scale = false;
        });
      },
      child: AnimatedScale(
        scale: scale ? 1.04 : 1,
        duration: Durations.short1,
        curve: Curves.elasticOut,
        child: InkWell(
          onTap: widget.onTap,
          // splashColor: Colors.red,
          child: Container(
            width: widget.width,
            height: widget.height,
            decoration: widget.decoration,
            padding: widget.padding,
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
