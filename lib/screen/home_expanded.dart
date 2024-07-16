import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material3_color_scheme/widget/color_grid_container.dart';
import 'package:seo/seo.dart';

class HomeExpanded extends StatelessWidget {
  const HomeExpanded(
      {super.key,
      required this.title,
      required this.seedColor,
      required this.brightness,
      required this.onColorPickerTap,
      required this.onBrightnessTap});
  final String title;
  final Color seedColor;
  final Brightness brightness;
  final VoidCallback onColorPickerTap;
  final VoidCallback onBrightnessTap;
  @override
  Widget build(BuildContext context) {
    const widthDivider = SizedBox(width: 8);
    const heightDivider = SizedBox(height: 8);

    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorScheme.inversePrimary,
        title: Seo.text(text: title, style: TextTagStyle.h1, child: Text(title)),
        centerTitle: false,
        actions: [
          Container(
            height: 32,
            width: 120,
            decoration: BoxDecoration(color: seedColor, borderRadius: BorderRadius.circular(8)),
            alignment: Alignment.center,
            child: Text(
              'Seed Color',
              style: textTheme.titleSmall!.copyWith(fontWeight: FontWeight.bold, color: colorScheme.onPrimary),
            ),
          ),
          const SizedBox(width: 12),
          OutlinedButton.icon(
            onPressed: onColorPickerTap,
            icon: const Icon(CupertinoIcons.color_filter),
            label: const Text('Select Color'),
          ),
          IconButton(
            onPressed: onBrightnessTap,
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
                        child: ColorGridContainer(
                          colorTitle: 'Primary',
                          color: colorScheme.primary,
                          onColorTitle: 'On Primary',
                          onColor: colorScheme.onPrimary,
                        ),
                      ),
                      widthDivider,
                      Expanded(
                        child: ColorGridContainer(
                          colorTitle: 'Secondary',
                          color: colorScheme.secondary,
                          onColorTitle: 'On Secondary',
                          onColor: colorScheme.onSecondary,
                        ),
                      ),
                      widthDivider,
                      Expanded(
                        child: ColorGridContainer(
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
                  child: ColorGridContainer(
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
                        child: ColorGridContainer(
                          colorTitle: 'Primary Container',
                          color: colorScheme.primaryContainer,
                          onColorTitle: 'On Primary Container',
                          onColor: colorScheme.onPrimaryContainer,
                        ),
                      ),
                      widthDivider,
                      Expanded(
                        child: ColorGridContainer(
                          colorTitle: 'Secondary Container',
                          color: colorScheme.secondaryContainer,
                          onColorTitle: 'On Secondary Container',
                          onColor: colorScheme.onSecondaryContainer,
                        ),
                      ),
                      widthDivider,
                      Expanded(
                        child: ColorGridContainer(
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
                  child: ColorGridContainer(
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
                        child: ColorGridContainer(
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
                        child: ColorGridContainer(
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
                        child: ColorGridContainer(
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
                        child: ColorGridContainer(
                          colorTitle: 'Surface Dim',
                          color: colorScheme.surfaceDim,
                          onColor: colorScheme.onSurface,
                        ),
                      ),
                      Expanded(
                        child: ColorGridContainer(
                          colorTitle: 'Surface',
                          color: colorScheme.surface,
                          onColor: colorScheme.onSurface,
                        ),
                      ),
                      Expanded(
                        child: ColorGridContainer(
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
                  child: ColorGridContainer(
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
                        child: ColorGridContainer(
                          color: colorScheme.surfaceContainerLowest,
                          colorTitle: 'Surface Container Lowest',
                          onColor: colorScheme.onSurface,
                        ),
                      ),
                      Expanded(
                        child: ColorGridContainer(
                          color: colorScheme.surfaceContainerLow,
                          colorTitle: 'Surface Container Low',
                          onColor: colorScheme.onSurface,
                        ),
                      ),
                      Expanded(
                        child: ColorGridContainer(
                          color: colorScheme.surfaceContainer,
                          colorTitle: 'Surface Container',
                          onColor: colorScheme.onSurface,
                        ),
                      ),
                      Expanded(
                        child: ColorGridContainer(
                          color: colorScheme.surfaceContainerHigh,
                          colorTitle: 'Surface Container High',
                          onColor: colorScheme.onSurface,
                        ),
                      ),
                      Expanded(
                        child: ColorGridContainer(
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
                        child: ColorGridContainer(
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
                        child: ColorGridContainer(
                          onColor: colorScheme.onSurface,
                          onColorTitle: 'On Surface',
                          color: colorScheme.surfaceContainerLowest,
                        ),
                      ),
                      Expanded(
                        child: ColorGridContainer(
                          onColor: colorScheme.onSurfaceVariant,
                          onColorTitle: 'On Surface Variant',
                          color: colorScheme.surfaceContainerLowest,
                        ),
                      ),
                      Expanded(
                        child: ColorGridContainer(
                          onColor: colorScheme.outline,
                          onColorTitle: 'Outline',
                          color: colorScheme.onSurface,
                        ),
                      ),
                      Expanded(
                        child: ColorGridContainer(
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
                        child: ColorGridContainer(
                          onColor: colorScheme.scrim,
                          onColorTitle: 'Scrim',
                          color: Colors.white,
                        ),
                      ),
                      widthDivider,
                      Expanded(
                        child: ColorGridContainer(
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
    );
  }
}
