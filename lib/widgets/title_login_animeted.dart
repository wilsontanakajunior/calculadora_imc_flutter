import 'package:flutter/material.dart';

class TitleLoginAnimated extends StatefulWidget {
  const TitleLoginAnimated({super.key});

  @override
  State<TitleLoginAnimated> createState() => _TitleLoginAnimatedState();
}

class _TitleLoginAnimatedState extends State<TitleLoginAnimated>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late AnimationController _animationVibrationController;
  late Animation<Offset> _slideAnimationRight;
  late Animation<Offset> _slideAnimationLeft;
  late Animation<double> _vibrationAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animationVibrationController = AnimationController(
      duration: const Duration(milliseconds: 1700),
      vsync: this,
    );

    _slideAnimationRight = Tween<Offset>(
      begin: const Offset(-1, 0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
    _slideAnimationLeft = Tween<Offset>(
      begin: const Offset(1, 0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
    _vibrationAnimation = Tween<double>(
      begin: -18,
      end: 30,
    ).animate(
      CurvedAnimation(
        parent: _animationVibrationController,
        curve: Curves.easeInExpo,
      ),
    );
    _animationVibrationController.repeat(reverse: true);
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationVibrationController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedBuilder(
          animation: _animationVibrationController,
          builder: (BuildContext context, Widget? child) {
            return SlideTransition(
              position: _slideAnimationLeft,
              child: Transform.translate(
                offset: Offset(0, _vibrationAnimation.value),
                child: const Text(
                  "IMC",
                  style: TextStyle(
                    decorationColor: Colors.black,
                    letterSpacing: 0,
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    // backgroundColor: Colors.black,
                  ),
                ),
              ),
            );
          },
        ),
        SlideTransition(
          position: _slideAnimationRight,
          child: const Text(
            "Track",
            style: TextStyle(
              color: Colors.white,
              fontSize: 60,
              letterSpacing: 2.5,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
