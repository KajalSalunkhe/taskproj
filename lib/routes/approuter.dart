// import 'package:flutter/material.dart';
// import 'package:mycard/src/pages/camera_screen.dart';
// import 'package:mycard/src/pages/education_screen.dart';
// import 'package:mycard/src/pages/home_screen.dart';
// import 'package:mycard/src/pages/myfirstscreen.dart';
// import 'package:mycard/src/pages/profile.dart';
// import 'package:mycard/src/pages/project.dart';
// import 'package:mycard/src/pages/services.dart';
// import 'package:mycard/src/pages/splash_screen.dart';
// import 'package:mycard/src/pages/translation_screen.dart';

// class AppRouter {
//   static const String splash = "/";
//   static const String translation = "/translation";
//   static const String home = "/home";
//   static const String education = "/education";
//   static const String first = "/first";
//   static const String service = "/service";
//   static const String project = "/project";
//   static const String profile = "/profile";
//   static const String camera = "/camera";

//   static Route generateRoute(RouteSettings routeSettings) {
//     return MaterialPageRoute(
//         builder: (context) {
//           return getScreen(routeSettings);
//         },
//         settings: routeSettings);
//   }

//   static Widget getScreen(RouteSettings routeSettings) {
//     switch (routeSettings.name) {
//       case splash:
//         return const SplashScreen();

//       case translation:
//         final args = routeSettings.arguments as Map<String, dynamic>?;
//         final previousNav = args?["previousNavigation"] as String?;
//         return TranslationScreen(
//           previousNavigation: previousNav,
//         );
//       case home:
//         return const HomeScreen();
//       case education:
//         return EducationScreen();
//       case first:
//         return MyFirstScreen();
//       case service:
//         return ServicesScreen();
//       case project:
//         return ProjectScreen();
//       case profile:
//         return ProfileScreen();
//       case camera:
//         return CameraScreen();
//       default:
//         return const SizedBox();
//     }
//   }
// }
