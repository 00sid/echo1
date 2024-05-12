import 'package:echo1/screen/echo_feed_screen.dart';
import 'package:echo1/screen/echo_login_screen.dart';
import 'package:echo1/screen/echo_splash_screen.dart';
import 'package:echo1/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:peaman_ui_components/peaman_ui_components.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Peaman.initializeApp();
  runApp(
    PeamanApp(
      title: "Echo",
      theme: AppTheme.lightColorPalette,
      darkTheme: ThemeData.dark(),
      onGenerateRoute: (settings, def) {
        switch (settings.name) {
          case PeamanWrapper.route:
            return PeamanRouter.buildRoute(
              settings,
              const PeamanWrapper(
                loginScreen: EchoLoginScreen(),
                skipOnboarding: true,
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
