// import 'package:flutter/material.dart';

// class SplashPage extends StatefulWidget {
//   const SplashPage({super.key, required this.isFirstRun});

//   final bool isFirstRun;

//   @override
//   State<SplashPage> createState() => _SplashPageState();
// }

// class _SplashPageState extends State<SplashPage> {
//   @override
//   void initState() {
//     _init();
//     super.initState();
//   }

//   void _init() {
//     WidgetsBinding.instance.addPostFrameCallback((_) => _navigate());
//   }

//   void _navigate() {
//     if (widget.isFirstRun) {
//       InAppReview.instance.requestReview();
//     }
//     if (RemoteConfigService.usePrivacy) {
//       if (widget.isFirstRun) {
//         Navigator.of(context).pushReplacementNamed(AppRoutes.onBoarding);
//       } else {
//         Navigator.of(context).pushReplacementNamed(AppRoutes.home);
//       }
//     } else {
//       Navigator.of(context).pushReplacementNamed(AppRoutes.privacy);
//     }
//     FlutterNativeSplash.remove();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold();
//   }
// }
