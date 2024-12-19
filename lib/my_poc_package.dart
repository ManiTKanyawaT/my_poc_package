library my_poc_package;

import 'package:flutter/material.dart';

class AnimatedTextFormField extends StatefulWidget {
  final String labelText;
  final TextEditingController controller;

  const AnimatedTextFormField(
      {super.key, required this.labelText, required this.controller});

  @override
  State<AnimatedTextFormField> createState() => _AnimatedTextFormFieldState();
}

class _AnimatedTextFormFieldState extends State<AnimatedTextFormField>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Transform.scale(
          scale: _animation.value,
          child: TextFormField(
            controller: widget.controller,
            decoration: InputDecoration(
                labelText: widget.labelText, fillColor: Colors.amber),
            onTap: () {
              _animationController.forward();
            },
            onEditingComplete: () {
              _animationController.reverse();
            },
          ),
        );
      },
    );
  }
}
