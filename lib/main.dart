import 'dart:ui';

import 'package:firebase_analytics_web/firebase_analytics_web.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material3_color_scheme/firebase_options.dart';
import 'package:material3_color_scheme/widget/hover_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final analytics = FirebaseAnalyticsWeb();
  analytics.setAnalyticsCollectionEnabled(true);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Color Scheme for Material 3',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
          useMaterial3: true,
          textTheme: GoogleFonts.nunitoTextTheme()),
      home: const MyHomePage(title: 'Color Scheme for Material 3'),
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
  late Color color;
  final textController = TextEditingController();
  @override
  void initState() {
    analytics.setCurrentScreen(screenName: runtimeType.toString());
    brightness = PlatformDispatcher.instance.platformBrightness;
    color = Colors.green;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final colorScheme = ColorScheme.fromSeed(brightness: brightness, seedColor: color);
    final textTheme = themeData.textTheme.apply(bodyColor: colorScheme.onSurface, displayColor: colorScheme.onSurface);
    const widthDivider = SizedBox(width: 8);
    const heightDivider = SizedBox(height: 8);
    return Theme(
      data: themeData.copyWith(colorScheme: colorScheme),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: colorScheme.inversePrimary,
          title: Text(widget.title),
          centerTitle: false,
          actions: [
            Container(
              height: 32,
              width: 120,
              decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(8)),
              alignment: Alignment.center,
              child: Text(
                'Seed Color',
                style: textTheme.titleSmall!.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(width: 12),
            OutlinedButton.icon(
              onPressed: () {
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
                            pickerColor: color,
                            onColorChanged: (value) {
                              setState(() {
                                color = value;
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
              },
              icon: const Icon(CupertinoIcons.color_filter),
              label: const Text('Select Color'),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  brightness = brightness == Brightness.light ? Brightness.dark : Brightness.light;
                });
              },
              icon: Icon(brightness == Brightness.light ? CupertinoIcons.sun_max : CupertinoIcons.sun_max_fill),
            ),
            const SizedBox(width: 24),
          ],
        ),

        backgroundColor: colorScheme.surface,
        body: Column(
          children: [
            heightDivider,
            Expanded(
              flex: 3,
              child: Row(
                children: [
                  widthDivider,
                  Expanded(
                    flex: 3,
                    child: Row(
                      children: [
                        Expanded(
                          child: _ColorGridContainer(
                            colorTitle: 'Primary',
                            color: colorScheme.primary,
                            onColorTitle: 'On Primary',
                            onColor: colorScheme.onPrimary,
                          ),
                        ),
                        widthDivider,
                        Expanded(
                          child: _ColorGridContainer(
                            colorTitle: 'Secondary',
                            color: colorScheme.secondary,
                            onColorTitle: 'On Secondary',
                            onColor: colorScheme.onSecondary,
                          ),
                        ),
                        widthDivider,
                        Expanded(
                          child: _ColorGridContainer(
                            colorTitle: 'Tertiary',
                            color: colorScheme.tertiary,
                            onColorTitle: 'On Tertiary',
                            onColor: colorScheme.onTertiary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  widthDivider,
                  Expanded(
                    flex: 1,
                    child: _ColorGridContainer(
                      colorTitle: 'Error',
                      color: colorScheme.error,
                      onColorTitle: 'On Error',
                      onColor: colorScheme.onError,
                    ),
                  ),
                  widthDivider,
                ],
              ),
            ),
            heightDivider,
            Expanded(
              flex: 3,
              child: Row(
                children: [
                  widthDivider,
                  Expanded(
                    flex: 3,
                    child: Row(
                      children: [
                        Expanded(
                          child: _ColorGridContainer(
                            colorTitle: 'Primary Container',
                            color: colorScheme.primaryContainer,
                            onColorTitle: 'On Primary Container',
                            onColor: colorScheme.onPrimaryContainer,
                          ),
                        ),
                        widthDivider,
                        Expanded(
                          child: _ColorGridContainer(
                            colorTitle: 'Secondary Container',
                            color: colorScheme.secondaryContainer,
                            onColorTitle: 'On Secondary Container',
                            onColor: colorScheme.onSecondaryContainer,
                          ),
                        ),
                        widthDivider,
                        Expanded(
                          child: _ColorGridContainer(
                            colorTitle: 'Tertiary Container',
                            color: colorScheme.tertiaryContainer,
                            onColorTitle: 'On Tertiary Container',
                            onColor: colorScheme.onTertiaryContainer,
                          ),
                        ),
                      ],
                    ),
                  ),
                  widthDivider,
                  Expanded(
                    flex: 1,
                    child: _ColorGridContainer(
                      colorTitle: 'Error Container',
                      color: colorScheme.errorContainer,
                      onColorTitle: 'On Error Container',
                      onColor: colorScheme.onErrorContainer,
                    ),
                  ),
                  widthDivider,
                ],
              ),
            ),
            heightDivider,
            Expanded(
              flex: 4,
              child: Row(
                children: [
                  widthDivider,
                  Expanded(
                    flex: 3,
                    child: Row(
                      children: [
                        Expanded(
                          child: _ColorGridContainer(
                            colorTitle: 'Primary Fixed',
                            color: colorScheme.primaryFixed,
                            colorDimTitle: 'Primary Fixed Dim',
                            colorDim: colorScheme.primaryFixedDim,
                            onColorTitle: 'On Primary Fixed',
                            onColor: colorScheme.onPrimaryFixed,
                            onColorVarientTitle: 'On Primary Fixed Variant',
                            onColorVarient: colorScheme.onPrimaryFixedVariant,
                          ),
                        ),
                        widthDivider,
                        Expanded(
                          child: _ColorGridContainer(
                            colorTitle: 'Secondary Fixed',
                            color: colorScheme.secondaryFixed,
                            colorDimTitle: 'Secondary Fixed Dim',
                            colorDim: colorScheme.secondaryFixedDim,
                            onColorTitle: 'On Secondary Fixed',
                            onColor: colorScheme.onSecondaryFixed,
                            onColorVarientTitle: 'On Secondary Fixed Variant',
                            onColorVarient: colorScheme.onSecondaryFixedVariant,
                          ),
                        ),
                        widthDivider,
                        Expanded(
                          child: _ColorGridContainer(
                            colorTitle: 'Tertiary Fixed',
                            color: colorScheme.tertiaryFixed,
                            colorDimTitle: 'Tertiary Fixed Dim',
                            colorDim: colorScheme.tertiaryFixedDim,
                            onColorTitle: 'On Tertiary Fixed',
                            onColor: colorScheme.onTertiaryFixed,
                            onColorVarientTitle: 'On Tertiary Fixed Variant',
                            onColorVarient: colorScheme.onTertiaryFixedVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                  widthDivider,
                  Expanded(
                    flex: 1,
                    child: Container(),
                  ),
                  widthDivider,
                ],
              ),
            ),
            heightDivider,
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  widthDivider,
                  Expanded(
                    flex: 3,
                    child: Row(
                      children: [
                        Expanded(
                          child: _ColorGridContainer(
                            colorTitle: 'Surface Dim',
                            color: colorScheme.surfaceDim,
                            onColor: colorScheme.onSurface,
                          ),
                        ),
                        Expanded(
                          child: _ColorGridContainer(
                            colorTitle: 'Surface',
                            color: colorScheme.surface,
                            onColor: colorScheme.onSurface,
                          ),
                        ),
                        Expanded(
                          child: _ColorGridContainer(
                            colorTitle: 'Surface Bright',
                            color: colorScheme.surfaceBright,
                            onColor: colorScheme.onSurface,
                          ),
                        ),
                      ],
                    ),
                  ),
                  widthDivider,
                  Expanded(
                    flex: 1,
                    child: _ColorGridContainer(
                      color: colorScheme.onInverseSurface,

                      onColor: colorScheme.inverseSurface,
                      onColorTitle: 'Inverse Surface',

                      onColorVarient: colorScheme.onInverseSurface,
                      onColorVarientTitle: 'On Inverse Surface',
                      // color: colorScheme.inverseSurface,
                    ),
                  ),
                  widthDivider,
                ],
              ),
            ),
            heightDivider,
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  widthDivider,
                  Expanded(
                    flex: 3,
                    child: Row(
                      children: [
                        Expanded(
                          child: _ColorGridContainer(
                            color: colorScheme.surfaceContainerLowest,
                            colorTitle: 'Surface Container Lowest',
                            onColor: colorScheme.onSurface,
                          ),
                        ),
                        Expanded(
                          child: _ColorGridContainer(
                            color: colorScheme.surfaceContainerLow,
                            colorTitle: 'Surface Container Low',
                            onColor: colorScheme.onSurface,
                          ),
                        ),
                        Expanded(
                          child: _ColorGridContainer(
                            color: colorScheme.surfaceContainer,
                            colorTitle: 'Surface Container',
                            onColor: colorScheme.onSurface,
                          ),
                        ),
                        Expanded(
                          child: _ColorGridContainer(
                            color: colorScheme.surfaceContainerHigh,
                            colorTitle: 'Surface Container High',
                            onColor: colorScheme.onSurface,
                          ),
                        ),
                        Expanded(
                          child: _ColorGridContainer(
                            color: colorScheme.surfaceContainerHighest,
                            colorTitle: 'Surface Container Highest',
                            onColor: colorScheme.onSurface,
                          ),
                        ),
                      ],
                    ),
                  ),
                  widthDivider,
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 1,
                          child: _ColorGridContainer(
                            onColor: colorScheme.inversePrimary,
                            onColorTitle: 'Inverse Primary',
                            color: colorScheme.onPrimaryContainer,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(),
                        ),
                      ],
                    ),
                  ),
                  widthDivider,
                ],
              ),
            ),
            heightDivider,
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  widthDivider,
                  Expanded(
                    flex: 3,
                    child: Row(
                      children: [
                        widthDivider,
                        Expanded(
                          child: _ColorGridContainer(
                            onColor: colorScheme.onSurface,
                            onColorTitle: 'On Surface',
                            color: colorScheme.surfaceContainerLowest,
                          ),
                        ),
                        Expanded(
                          child: _ColorGridContainer(
                            onColor: colorScheme.onSurfaceVariant,
                            onColorTitle: 'On Surface Variant',
                            color: colorScheme.surfaceContainerLowest,
                          ),
                        ),
                        Expanded(
                          child: _ColorGridContainer(
                            onColor: colorScheme.outline,
                            onColorTitle: 'Outline',
                            color: colorScheme.onSurface,
                          ),
                        ),
                        Expanded(
                          child: _ColorGridContainer(
                            onColor: colorScheme.outlineVariant,
                            onColorTitle: 'Outline Variant',
                            color: colorScheme.onSurface,
                          ),
                        ),
                      ],
                    ),
                  ),
                  widthDivider,
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        Expanded(
                          child: _ColorGridContainer(
                            onColor: colorScheme.scrim,
                            onColorTitle: 'Scrim',
                            color: Colors.white,
                          ),
                        ),
                        widthDivider,
                        Expanded(
                          child: _ColorGridContainer(
                            onColor: colorScheme.shadow,
                            onColorTitle: 'Shadow',
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  widthDivider,
                ],
              ),
            ),
            heightDivider,
          ],
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}

class _ColorGridContainer extends StatelessWidget {
  const _ColorGridContainer({
    this.colorTitle,
    this.color,
    this.colorDimTitle,
    this.colorDim,
    this.onColorTitle,
    this.onColor,
    this.onColorVarientTitle,
    this.onColorVarient,
  });
  final String? colorTitle;
  final Color? color;

  final String? colorDimTitle;
  final Color? colorDim;

  final String? onColorTitle;
  final Color? onColor;

  final String? onColorVarientTitle;
  final Color? onColorVarient;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (colorTitle != null || colorDimTitle != null)
          Expanded(
            flex: 2,
            child: Row(
              children: [
                if (colorTitle != null)
                  Expanded(
                    flex: 1,
                    child: HoverContainer(
                      decoration: BoxDecoration(color: color),
                      onTap: () {
                        copyToClipboard(context, colorToHex(color!));
                      },
                      child: ColorNameText(
                        color: color!,
                        title: colorTitle!,
                        textColor: onColor,
                      ),
                    ),
                  ),
                if (colorDimTitle != null)
                  Expanded(
                    flex: 1,
                    child: HoverContainer(
                      decoration: BoxDecoration(color: colorDim),
                      onTap: () {
                        copyToClipboard(context, colorToHex(colorDim!));
                      },
                      child: ColorNameText(
                        color: colorDim!,
                        title: colorDimTitle!,
                        textColor: onColor,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        if (onColorTitle != null)
          Expanded(
            flex: 1,
            child: HoverContainer(
              decoration: BoxDecoration(color: onColor),
              onTap: () {
                copyToClipboard(context, colorToHex(onColor!));
              },
              child: ColorNameText(
                color: onColor!,
                title: onColorTitle!,
                textColor: color,
                lineBreak: false,
              ),
            ),
          ),
        if (onColorVarientTitle != null)
          Expanded(
            flex: 1,
            child: HoverContainer(
              decoration: BoxDecoration(color: onColorVarient),
              onTap: () {
                copyToClipboard(context, colorToHex(onColorVarient!));
              },
              child: ColorNameText(
                color: onColorVarient!,
                title: onColorVarientTitle!,
                textColor: colorTitle != null ? color : onColor,
                lineBreak: false,
              ),
            ),
          ),
      ],
    );
  }
}

class ColorNameText extends StatelessWidget {
  const ColorNameText({
    super.key,
    required this.color,
    required this.title,
    this.textColor,
    this.lineBreak = true,
  });
  final Color color;
  final String title;
  final Color? textColor;
  final bool lineBreak;
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: Theme.of(context).textTheme.titleMedium!.copyWith(color: textColor),
        children: [
          TextSpan(text: title),
          TextSpan(
            text: '${lineBreak ? '\n' : ' '} #${colorToHex(color)}',
            style: Theme.of(context).textTheme.bodySmall!.copyWith(color: textColor),
          )
        ],
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
