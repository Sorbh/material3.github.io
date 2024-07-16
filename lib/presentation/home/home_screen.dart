import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:material3_color_scheme/main.dart';
import 'package:material3_color_scheme/presentation/home/layout/layout.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Brightness brightness;
  late Color seedColor;
  final textController = TextEditingController();
  @override
  void initState() {
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
