import 'package:flutter/material.dart';

class AnimatedImageAnimation extends StatefulWidget {
  final String imageUrl;
  const AnimatedImageAnimation({super.key, required this.imageUrl});

  @override
  State<AnimatedImageAnimation> createState() => _AnimatedImageAnimationState();
}

class _AnimatedImageAnimationState extends State<AnimatedImageAnimation> {
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    // Trigger the animation after a short delay
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _isVisible = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: const Duration(
        milliseconds: 500,
      ),
      curve: Curves.easeInOut,
      right: _isVisible ? 0 : -150,
      child: _isVisible
          ? Image.network(
              widget.imageUrl, // Replace with your image URL
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            )
          : Container(),
    );
  }
}
