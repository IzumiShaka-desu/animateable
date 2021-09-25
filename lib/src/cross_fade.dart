import 'package:flutter/material.dart';

///widget for provide fade animation
///
///when data(T) has changed
///the [initialData] , [data] , and [builder] is required.
///the [duration] is duration of animation (defaults is 300 millisseconds)
class CrossFade<T> extends StatefulWidget {
  ///initial data when widget initialized
  final T initialData;

  ///listened data, when it's changed will trigger fade animation
  final T data;

  ///the duration of animation (defaults is 300 millisseconds)
  final Duration duration;

  ///this function will build children widget
  final Widget Function(T data) builder;

  ///this function will triggered when fadeanimation triggered
  final VoidCallback? onFadeComplete;

  ///the [initialData] , [data] , and [builder] is required.
  ///the [duration] is duration of animation (defaults is 300 millisseconds)
  const CrossFade({
    Key? key,
    required this.initialData,
    required this.data,
    required this.builder,
    this.duration = const Duration(milliseconds: 300),
    this.onFadeComplete,
  }) : super(key: key);

  @override
  _CrossFadeState<T> createState() => _CrossFadeState<T>();
}

class _CrossFadeState<T> extends State<CrossFade<T>>
    with SingleTickerProviderStateMixin {
  ///controller of animation
  late final AnimationController controller;

  ///animation to listen
  late final Animation<double> animation;

  ///data will showed
  late T dataToShow;

  @override
  void initState() {
    super.initState();
    dataToShow = widget.initialData;
    controller = AnimationController(vsync: this, duration: widget.duration)

      ///add  controller listener
      ..addListener(() => setState(() {}))

      ///add controller status listener
      ..addStatusListener((status) {
        ///whem status completed animation controller will reversed
        ///and when dismissed its will trigger [onFadeComplete]
        if (status == AnimationStatus.completed) {
          dataToShow = widget.data;
          controller.reverse(from: 1.0);
        } else if (status == AnimationStatus.dismissed) {
          widget.onFadeComplete?.call();
        }
      });

    animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeIn,
        reverseCurve: Curves.easeOut,
      ),
    );
    if (widget.initialData != widget.data) {
      controller.forward(from: 0.0);
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(CrossFade<T> oldWidget) {
    ///check the widget it's updated or not
    ///when updated it's will trigger animation controller
    super.didUpdateWidget(oldWidget);
    if (widget.data != oldWidget.data) {
      dataToShow = oldWidget.data;
      controller.forward(from: 0.0);
    }
  }

  @override
  Widget build(BuildContext context) => Opacity(
        opacity: 1.0 - animation.value,
        child: widget.builder(dataToShow),
      );
}
