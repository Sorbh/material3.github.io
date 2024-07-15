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
import 'package:material3_color_scheme/firebase_options.dart';
import 'package:material3_color_scheme/screen/home_compact.dart';
import 'package:material3_color_scheme/screen/home_expanded.dart';
import 'package:material3_color_scheme/screen/home_medium.dart';
import 'package:seo/seo.dart';

void main() async {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

    final analytics = FirebaseAnalyticsWeb();
    analytics.setAnalyticsCollectionEnabled(true);

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
      child: MaterialApp(
        title: 'Color Scheme for Material 3',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
            useMaterial3: true,
            textTheme: GoogleFonts.nunitoTextTheme()),
        home: const MyHomePage(title: 'Color Scheme for Material 3'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final analytics = FirebaseAnalyticsWeb();
  late Brightness brightness;
  late Color seedColor;
  final textController = TextEditingController();
  @override
  void initState() {
    analytics.setCurrentScreen(screenName: runtimeType.toString());
    brightness = PlatformDispatcher.instance.platformBrightness;
    seedColor = Colors.green;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final colorScheme = ColorScheme.fromSeed(brightness: brightness, seedColor: seedColor);
    return Theme(
      data: themeData.copyWith(colorScheme: colorScheme),
      child: LayoutBuilder(builder: (context, constraints) {
        return constraints.maxWidth < 600
            ? HomeCompact(
                title: widget.title,
                seedColor: seedColor,
                brightness: brightness,
                onColorPickerTap: colorPicker,
                onBrightnessTap: toggleBrighness)
            : 600 < constraints.maxWidth && constraints.maxWidth < 1200
                ? HomeMedium(
                    title: widget.title,
                    seedColor: seedColor,
                    brightness: brightness,
                    onColorPickerTap: colorPicker,
                    onBrightnessTap: toggleBrighness)
                : HomeExpanded(
                    title: widget.title,
                    seedColor: seedColor,
                    brightness: brightness,
                    onColorPickerTap: colorPicker,
                    onBrightnessTap: toggleBrighness,
                  );
      }),
    );
  }

  void colorPicker() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          scrollable: true,
          titlePadding: const EdgeInsets.all(0),
          contentPadding: const EdgeInsets.all(0),
          content: Column(
            children: [
              ColorPicker(
                pickerColor: seedColor,
                onColorChanged: (value) {
                  setState(() {
                    seedColor = value;
                  });
                },
                colorPickerWidth: 300,
                pickerAreaHeightPercent: 0.7,
                enableAlpha: true, // hexInputController will respect it too.
                displayThumbColor: true,
                paletteType: PaletteType.hsvWithHue,
                labelTypes: const [],
                pickerAreaBorderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(2),
                  topRight: Radius.circular(2),
                ),
                hexInputController: textController,
                portraitOnly: true,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: CupertinoTextField(
                  controller: textController,
                  prefix: const Padding(padding: EdgeInsets.only(left: 8), child: Icon(Icons.tag)),
                  suffix: IconButton(
                    icon: const Icon(Icons.content_paste_rounded),
                    onPressed: () => copyToClipboard(context, textController.text),
                  ),
                  autofocus: true,
                  maxLength: 9,
                  inputFormatters: [
                    UpperCaseTextFormatter(),
                    FilteringTextInputFormatter.allow(RegExp(kValidHexPattern)),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  void toggleBrighness() {
    setState(() {
      brightness = brightness == Brightness.light ? Brightness.dark : Brightness.light;
    });
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
