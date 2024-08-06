import 'dart:io';

import 'package:echo1/screen/echo_feed_screen.dart';
import 'package:echo1/screen/echo_login_screen.dart';
import 'package:echo1/screen/echo_onboarding_screen.dart';
import 'package:echo1/screen/echo_splash_screen.dart';
import 'package:echo1/theme/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isIOS) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: 'AIzaSyBgEieoxYym7cgHuRfSWrrNp5GGnO4r2cA',
        appId: '1:706999363077:ios:7028784345d697bc469e6c',
        projectId: 'echo1-71629',
        messagingSenderId: '706999363077',
        storageBucket: 'echo1-71629.appspot.com',
      ),
    );
  } else {
    await Firebase.initializeApp();
  }

  runApp(
    PeamanApp(
      title: "Echo",
      theme: AppTheme.lightColorPalette,
      darkTheme: AppTheme.darkColorPalette,
      onGenerateRoute: (settings, def) {
        switch (settings.name) {
          case PeamanWrapper.route:
            return PeamanRouter.buildRoute(
              settings,
              const PeamanWrapper(
                loginScreen: EchoLoginScreen(),
                onboardingScreen: EchoOnboardingScreen(
                  file: null,
                ),
                splashScreen: EchoSplashScreen(),
                homeScreen: EchoFeedScreen(),
              ),
            );
        }
        return def();
      },
    ),
  );
}
