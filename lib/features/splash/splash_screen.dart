import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<Offset>? _animation;
  // final authController = Get.put(AuthenticationController(getIt<LocationController>(), getIt<AppStorage>()));
  // final locationController = Get.put(LocationController());


  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    _animation = Tween<Offset>(
      begin: const Offset(0.0, 1.0),
      end: const Offset(0.0, -1.0),
    ).animate(CurvedAnimation(
      parent: _animationController!,
      curve: Curves.easeInOut,
    ));

    // authController.isAuthenticate(_animationController!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/splash.png',
          fit: BoxFit.cover,
          width: double.infinity,
          height: MediaQuery.sizeOf(context).height,
        ),
      ),
    );
  }
}

// SlideTransition(
// position: _animation!,
// child: Image.asset(
// 'assets/images/Logo.png',
// fit: BoxFit.cover,
// width: 200,
// ),
// )