import 'dart:async';
import 'dart:ui';

import 'package:firebase_analytics_web/firebase_analytics_web.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material3_color_scheme/core/app_router/app_router.dart';
import 'package:material3_color_scheme/firebase_options.dart';
import 'package:material3_color_scheme/presentation/home/layout/home_compact.dart';
import 'package:material3_color_scheme/presentation/home/layout/home_expanded.dart';
import 'package:material3_color_scheme/presentation/home/layout/home_medium.dart';
import 'package:seo/seo.dart';

void main() async {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

    final analytics = FirebaseAnalyticsWeb();
    analytics.setAnalyticsCollectionEnabled(true);
    // analytics.setCurrentScreen(screenName: 'HomeSceen');

    usePathUrlStrategy();

    runApp(const MyApp()); // starting point of app
  }, (error, stackTrace) {
    print("Error FROM OUT_SIDE FRAMEWORK ");
    print("--------------------------------");
    print("Error :  $error");
    print("StackTrace :  $stackTrace");
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return SeoController(
      enabled: true,
      tree: WidgetTree(context: context),
      child: MaterialApp.router(
        title: 'Color Scheme for Material 3',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
          useMaterial3: true,
          textTheme: GoogleFonts.nunitoTextTheme(),
        ),
        routerConfig: AppRouter.goRouter,
      ),
    );
  }
}

// Just an example of how to use/interpret/format text input's result.
void copyToClipboard(BuildContext context, String input) {
  String textToCopy = input.replaceFirst('#', '').toUpperCase();
  if (textToCopy.startsWith('FF') && textToCopy.length == 8) {
    textToCopy = textToCopy.replaceFirst('FF', '');
  }
  Clipboard.setData(ClipboardData(text: '#$textToCopy'));

  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text('$input copied'),
    duration: Durations.long2,
    behavior: SnackBarBehavior.floating,
  ));
}
