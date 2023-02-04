import 'dart:developer';

import 'package:flutter/material.dart';

class AnimatedScrollViewItem extends StatefulWidget {
  const AnimatedScrollViewItem({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  State<AnimatedScrollViewItem> createState() => _AnimatedScrollViewItemState();
}

class _AnimatedScrollViewItemState extends State<AnimatedScrollViewItem>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    )..forward();

    _scaleAnimation = Tween<double>(begin: 0.5, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: widget.child,
    );
  }
}

// import 'package:animations/core/components/text/custom_text.dart';
// import 'package:animations/core/constants/app_constants.dart';
// import 'package:flutter/material.dart';
// import 'package:sizer/sizer.dart';

// class CustomAnimatedButton extends StatefulWidget {
//   CustomAnimatedButton({
//     super.key,
//     this.height = 50,
//     this.width = 80,
//     this.color = COLOR_PRIMARY,
//     required this.title,
//     this.textstyle,
//     this.isLoading,
//     this.padding,
//     required this.onTap,
//   });

//   final VoidCallback onTap;
//   final bool? isLoading;
//   final double? height;
//   final double? width;
//   final Color? color;
//   final String title;
//   Color? textColor;
//   double? fontSize;
//   final TextStyle? textstyle;
//   final EdgeInsetsGeometry? padding;
//   @override
//   State<CustomAnimatedButton> createState() => _CustomAnimatedButtonState();
// }

// class _CustomAnimatedButtonState extends State<CustomAnimatedButton>
//     with SingleTickerProviderStateMixin {
//   late double _scale;
//   late AnimationController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 230),
//       lowerBound: 0.0,
//       upperBound: 0.1,
//     )..addListener(() {
//         setState(() {});
//       });
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   void _tapDown(TapDownDetails details) async {
//     log("on tap down");
//     await _controller.forward();
//     _controller.isCompleted ? _controller.reverse() : null;
//   }

//   void _tapUp(TapUpDetails details) {
//     log("on tap up");
//     _controller.reverse();
//   }

//   @override
//   Widget build(BuildContext context) {
//     _scale = 1 - _controller.value;
//     return GestureDetector(
//       // behavior: HitTestBehavior.translucent,
//       onTap: widget.onTap,
//       onTapDown: _tapDown,
//       onTapUp: _tapUp,
//       onTapCancel: () => _controller.reverse(from: _controller.value),
//       child: Transform.scale(
//         scale: _scale,
//         child: Container(
//           height: widget.height ?? hp(6.8),
//           width: wp(92),
//           padding: widget.padding ?? const EdgeInsets.all(0),
//           decoration: BoxDecoration(
//             color: widget.isLoading ?? false
//                 ? widget.color != null
//                     ? Theme.of(context).primaryColor.withOpacity(0.5)
//                     : COLOR_PRIMARY.withOpacity(0.5)
//                 : widget.color ?? Theme.of(context).primaryColor,
//             // color:  Theme.of(context).primaryColor,
//             borderRadius: const BorderRadius.all(
//               Radius.circular(8),
//             ),
//           ),
//           child: widget.isLoading ?? false
//               ? const Center(
//                   child: CircularProgressIndicator(
//                     color: COLOR_PRIMARY,
//                   ),
//                 )
//               : Center(
//                   child: Text(
//                     widget.title,
//                     style: widget.textstyle ??
//                         textMediumTextStyle.copyWith(
//                           color: Colors.white,
//                         ),
//                   ),
//                 ),
//         ),
//       ),
//     );
//   }
// }

class CustomAnimatedScale extends StatefulWidget {
  const CustomAnimatedScale({
    super.key,
    required this.onTap,
    required this.child,
  });

  final VoidCallback onTap;
  final Widget child;
  @override
  State<CustomAnimatedScale> createState() => _CustomAnimatedScale();
}

class _CustomAnimatedScale extends State<CustomAnimatedScale>
    with SingleTickerProviderStateMixin {
  late double _scale;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 230),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _tapDown(TapDownDetails details) async {
    await _controller.forward();
    // _controller.isCompleted ? _controller.reverse() : null;
  }

  void _tapUp(TapUpDetails details) {
    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - _controller.value;
    return GestureDetector(
      // behavior: HitTestBehavior.translucent,
      onTap: widget.onTap,
      onTapDown: _tapDown,
      onTapUp: _tapUp,
      onTapCancel: () => _controller.reverse(from: _controller.value),
      child: Transform.scale(
        scale: _scale,
        child: widget.child,
      ),
    );
  }
}
