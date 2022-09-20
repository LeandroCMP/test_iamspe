import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingComponent extends StatelessWidget {
  final bool isLoading;
  final Widget? child;
  final Color? color;

  const LoadingComponent({
    Key? key,
    required this.isLoading,
    required this.child,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(
            child: LoadingAnimationWidget.inkDrop(
              color: color ?? Colors.blue,
              size: 40,
            ),
          )
        : child!;
  }
}
