import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Material3 Color Scheme',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
          useMaterial3: true,
          textTheme: GoogleFonts.nunitoTextTheme()),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    const widthDivider = SizedBox(width: 8);
    const heightDivider = SizedBox(height: 8);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      backgroundColor: Colors.grey.shade200,
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
                        child: _NameBaadMe(
                          title: 'Primary',
                          color: colorScheme.primary,
                          onTitle: 'On Primary',
                          onColor: colorScheme.onPrimary,
                        ),
                      ),
                      widthDivider,
                      Expanded(
                        child: _NameBaadMe(
                          title: 'Secondary',
                          color: colorScheme.secondary,
                          onTitle: 'On Secondary',
                          onColor: colorScheme.onSecondary,
                        ),
                      ),
                      widthDivider,
                      Expanded(
                        child: _NameBaadMe(
                          title: 'Tertiary',
                          color: colorScheme.tertiary,
                          onTitle: 'On Tertiary',
                          onColor: colorScheme.onTertiary,
                        ),
                      ),
                    ],
                  ),
                ),
                widthDivider,
                Expanded(
                  flex: 1,
                  child: _NameBaadMe(
                    title: 'Error',
                    color: colorScheme.error,
                    onTitle: 'On Error',
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
                        child: _NameBaadMe(
                          title: 'Primary Container',
                          color: colorScheme.primaryContainer,
                          onTitle: 'On Primary Container',
                          onColor: colorScheme.onPrimaryContainer,
                        ),
                      ),
                      widthDivider,
                      Expanded(
                        child: _NameBaadMe(
                          title: 'Secondary Container',
                          color: colorScheme.secondaryContainer,
                          onTitle: 'On Secondary Container',
                          onColor: colorScheme.onSecondaryContainer,
                        ),
                      ),
                      widthDivider,
                      Expanded(
                        child: _NameBaadMe(
                          title: 'Tertiary Container',
                          color: colorScheme.tertiaryContainer,
                          onTitle: 'On Tertiary Container',
                          onColor: colorScheme.onTertiaryContainer,
                        ),
                      ),
                    ],
                  ),
                ),
                widthDivider,
                Expanded(
                  flex: 1,
                  child: _NameBaadMe(
                    title: 'Error Container',
                    color: colorScheme.errorContainer,
                    onTitle: 'On Error Container',
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
                        child: _NameBaadMe(
                          title: 'Primary Fixed',
                          color: colorScheme.primaryFixed,
                          secondTitle: 'Primary Fixed Dim',
                          secondColor: colorScheme.primaryFixedDim,
                          onTitle: 'On Primary Fixed',
                          onColor: colorScheme.onPrimaryFixed,
                          secondOnTitle: 'On Primary Fixed Variant',
                          secondOnColor: colorScheme.onPrimaryFixedVariant,
                        ),
                      ),
                      widthDivider,
                      Expanded(
                        child: _NameBaadMe(
                          title: 'Secondary Fixed',
                          color: colorScheme.secondaryFixed,
                          secondTitle: 'Secondary Fixed Dim',
                          secondColor: colorScheme.secondaryFixedDim,
                          onTitle: 'On Secondary Fixed',
                          onColor: colorScheme.onSecondaryFixed,
                          secondOnTitle: 'On Secondary Fixed Variant',
                          secondOnColor: colorScheme.onSecondaryFixedVariant,
                        ),
                      ),
                      widthDivider,
                      Expanded(
                        child: _NameBaadMe(
                          title: 'Tertiary Fixed',
                          color: colorScheme.tertiaryFixed,
                          secondTitle: 'Tertiary Fixed Dim',
                          secondColor: colorScheme.tertiaryFixedDim,
                          onTitle: 'On Tertiary Fixed',
                          onColor: colorScheme.onTertiaryFixed,
                          secondOnTitle: 'On Tertiary Fixed Variant',
                          secondOnColor: colorScheme.onTertiaryFixedVariant,
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
                        child: Container(
                          width: double.maxFinite,
                          height: double.maxFinite,
                          decoration: BoxDecoration(color: colorScheme.surfaceDim),
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            'Surface Dim',
                            style: textTheme.titleMedium!.copyWith(color: colorScheme.onSurface),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: double.maxFinite,
                          height: double.maxFinite,
                          decoration: BoxDecoration(color: colorScheme.surface),
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            'Surface',
                            style: textTheme.titleMedium!.copyWith(color: colorScheme.onSurface),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: double.maxFinite,
                          height: double.maxFinite,
                          decoration: BoxDecoration(color: colorScheme.surfaceBright),
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            'Surface Bright',
                            style: textTheme.titleMedium!.copyWith(color: colorScheme.onSurface),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                widthDivider,
                Expanded(
                  flex: 1,
                  child: Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            width: double.maxFinite,
                            height: double.maxFinite,
                            decoration: BoxDecoration(color: colorScheme.inverseSurface),
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              'Inverse Surface',
                              style: textTheme.titleMedium!.copyWith(color: colorScheme.onInverseSurface),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            width: double.maxFinite,
                            height: double.maxFinite,
                            decoration: BoxDecoration(color: colorScheme.onInverseSurface),
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              'On Inverse Surface',
                              style: textTheme.titleMedium!.copyWith(color: colorScheme.inverseSurface),
                            ),
                          ),
                        ),
                      ],
                    ),
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
                        child: Container(
                          width: double.maxFinite,
                          height: double.maxFinite,
                          decoration: BoxDecoration(color: colorScheme.surfaceContainerLowest),
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            'Surface Container Lowest',
                            style: textTheme.titleMedium!.copyWith(color: colorScheme.onSurface),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: double.maxFinite,
                          height: double.maxFinite,
                          decoration: BoxDecoration(color: colorScheme.surfaceContainerLow),
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            'Surface Container Low',
                            style: textTheme.titleMedium!.copyWith(color: colorScheme.onSurface),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: double.maxFinite,
                          height: double.maxFinite,
                          decoration: BoxDecoration(color: colorScheme.surfaceContainer),
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            'Surface Container',
                            style: textTheme.titleMedium!.copyWith(color: colorScheme.onSurface),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: double.maxFinite,
                          height: double.maxFinite,
                          decoration: BoxDecoration(color: colorScheme.surfaceContainerHigh),
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            'Surface Container High',
                            style: textTheme.titleMedium!.copyWith(color: colorScheme.onSurface),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: double.maxFinite,
                          height: double.maxFinite,
                          decoration: BoxDecoration(color: colorScheme.surfaceContainerHighest),
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            'Surface Container Highest',
                            style: textTheme.titleMedium!.copyWith(color: colorScheme.onSurface),
                          ),
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
                        child: Container(
                          width: double.maxFinite,
                          height: double.maxFinite,
                          decoration: BoxDecoration(color: colorScheme.inversePrimary),
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            'Inverse Primary',
                            style: textTheme.titleMedium!.copyWith(color: colorScheme.onPrimaryContainer),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(),
                        // child: Container(
                        //   width: double.maxFinite,
                        //   height: double.maxFinite,
                        //   decoration: BoxDecoration(color: colorScheme.onInverseSurface),
                        //   child: Text(
                        //     'On Inverse Surface',
                        //     style: textTheme.titleMedium!.copyWith(color: colorScheme.inverseSurface),
                        //   ),
                        // ),
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
                        child: Container(
                          width: double.maxFinite,
                          height: double.maxFinite,
                          decoration: BoxDecoration(color: colorScheme.onSurface),
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            'On Surface',
                            style: textTheme.titleMedium!.copyWith(color: colorScheme.surfaceContainerLowest),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: double.maxFinite,
                          height: double.maxFinite,
                          decoration: BoxDecoration(color: colorScheme.onSurfaceVariant),
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            'On Surface Variant',
                            style: textTheme.titleMedium!.copyWith(color: colorScheme.surfaceContainerLowest),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: double.maxFinite,
                          height: double.maxFinite,
                          decoration: BoxDecoration(color: colorScheme.outline),
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            'Outline',
                            style: textTheme.titleMedium!.copyWith(color: colorScheme.onSurface),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: double.maxFinite,
                          height: double.maxFinite,
                          decoration: BoxDecoration(color: colorScheme.outlineVariant),
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            'Outline Variant',
                            style: textTheme.titleMedium!.copyWith(color: colorScheme.onSurface),
                          ),
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
                        child: Container(
                          width: double.maxFinite,
                          height: double.maxFinite,
                          decoration: BoxDecoration(color: colorScheme.scrim),
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            'Scrim',
                            style: textTheme.titleMedium!.copyWith(color: colorScheme.surfaceContainerLowest),
                          ),
                        ),
                      ),
                      widthDivider,
                      Expanded(
                        child: Container(
                          width: double.maxFinite,
                          height: double.maxFinite,
                          decoration: BoxDecoration(color: colorScheme.shadow),
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            'Shadow',
                            style: textTheme.titleMedium!.copyWith(color: colorScheme.surfaceContainerLowest),
                          ),
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
    );
  }
}

class _NameBaadMe extends StatelessWidget {
  const _NameBaadMe({
    required this.title,
    required this.color,
    required this.onTitle,
    required this.onColor,
    this.secondTitle,
    this.secondColor,
    this.secondOnTitle,
    this.secondOnColor,
  });
  final String title;
  final Color color;
  final String? secondTitle;
  final Color? secondColor;
  final String onTitle;
  final Color onColor;
  final String? secondOnTitle;
  final Color? secondOnColor;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  width: double.maxFinite,
                  height: double.maxFinite,
                  decoration: BoxDecoration(color: color),
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    title,
                    style: textTheme.titleMedium!.copyWith(color: onColor),
                  ),
                ),
              ),
              if (secondTitle != null)
                Expanded(
                  flex: 1,
                  child: Container(
                    width: double.maxFinite,
                    height: double.maxFinite,
                    decoration: BoxDecoration(color: secondColor),
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      secondTitle!,
                      style: textTheme.titleMedium!.copyWith(color: secondOnColor),
                    ),
                  ),
                ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            width: double.maxFinite,
            decoration: BoxDecoration(color: onColor),
            padding: const EdgeInsets.all(8),
            child: Text(
              onTitle,
              style: textTheme.titleMedium!.copyWith(color: color),
            ),
          ),
        ),
        if (secondOnTitle != null)
          Expanded(
            flex: 1,
            child: Container(
              width: double.maxFinite,
              decoration: BoxDecoration(color: secondOnColor),
              padding: const EdgeInsets.all(8),
              child: Text(
                secondOnTitle!,
                style: textTheme.titleMedium!.copyWith(color: secondColor),
              ),
            ),
          ),
      ],
    );
  }
}
