import 'dart:ui';

import 'package:flutter/material.dart';

import '../helpers/triangle.dart';
import 'second.dart';

class First extends StatefulWidget {
  const First({Key? key}) : super(key: key);

  @override
  State<First> createState() => _FirstState();
}

class _FirstState extends State<First> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final List<Animation<Offset>> _animations = [];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);
    _animations.add(Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(2, 1),
    ).animate(_controller));
    _animations.add(Tween<Offset>(
      begin: const Offset(3, 0.0),
      end: const Offset(1, 2.5),
    ).animate(_controller));
    _animations.add(Tween<Offset>(
      begin: const Offset(1.0, 1.0),
      end: const Offset(0.0, 2.0),
    ).animate(_controller));
    _animations.add(Tween<Offset>(
      begin: const Offset(2.0, 0.5),
      end: const Offset(3.0, 1.0),
    ).animate(_controller));

    _animations.add(Tween<Offset>(
      begin: const Offset(3.0, 0.5),
      end: const Offset(2.5, 0.5),
    ).animate(_controller));
    _animations.add(Tween<Offset>(
      begin: const Offset(0.5, 1.0),
      end: const Offset(2.0, 4.0),
    ).animate(_controller));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            const SizedBox(
              width: double.infinity,
              height: double.infinity,
            ),
            SlideTransition(
              position: _animations[1],
              child: Container(
                width: 150,
                height: 150,
                decoration: const BoxDecoration(
                  color: Color(0xFF7E49F5),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            SlideTransition(
              position: _animations[2],
              child: Container(
                width: 150,
                height: 150,
                decoration: const BoxDecoration(
                  color: Color(0xffEF8BC7),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            SlideTransition(
              position: _animations[3],
              child: Container(
                width: 200,
                height: 100,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                ),
              ),
            ),
            SlideTransition(
              position: _animations[4],
              child: Container(
                width: 200,
                height: 100,
                decoration: const BoxDecoration(
                  color: Colors.deepPurple,
                ),
              ),
            ),
            SlideTransition(
              position: _animations[5],
              child: SizedBox(
                width: 200,
                height: 200,
                child: CustomPaint(
                  painter: TrianglePainter(const Color(0xffED6D60)),
                ),
              ),
            ),
            SlideTransition(
              position: _animations[0],
              child: SizedBox(
                width: 200,
                height: 200,
                child: CustomPaint(
                  painter: TrianglePainter(
                    const Color(0xffF4A261),
                  ),
                ),
              ),
            ),
            BackdropFilter(
              filter: ImageFilter.blur(
                  sigmaX: 25, sigmaY: 25, tileMode: TileMode.clamp),
              child: Container(
                color: Colors.transparent,
              ),
            ),
            Positioned(
              right: 10,
              bottom: 10,
              child: FilledButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Second()),
                  );
                },
                style: FilledButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  textStyle: const TextStyle(fontSize: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                ),
                child: const Text('Next'),
              ),
            ),
            Positioned(
              top: 30,
              left: 50,
              child: Image.asset(
                'assets/logo.png',
                width: 250,
                height: 250,
              ),
            ),
            Positioned(
              top: 150,
              left: 50,
              child: Image.asset(
                'assets/logo_write.png',
                width: 300,
                height: 300,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Image.asset(
                'assets/first_image.png',
                width: 300,
                height: 400,
              ),
            )
          ],
        ),
      ),
    );
  }
}
