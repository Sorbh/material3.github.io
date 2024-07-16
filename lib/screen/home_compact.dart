import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material3_color_scheme/widget/color_grid_container.dart';
import 'package:seo/seo.dart';

class HomeCompact extends StatelessWidget {
  const HomeCompact(
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
    const height2 = 80.0;
    const height3 = 120.0;
    const height4 = 160.0;

    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorScheme.inversePrimary,
        title: Seo.text(text: title, style: TextTagStyle.h1, child: Text(title)),
        centerTitle: false,
      ),

      backgroundColor: colorScheme.surface,
      body: ListView(
        children: [
          heightDivider,
          Container(
            decoration: BoxDecoration(
              color: colorScheme.inversePrimary,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            alignment: Alignment.centerRight,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
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
                const SizedBox(width: 12),
                IconButton(
                  onPressed: onBrightnessTap,
                  icon: Icon(brightness == Brightness.light ? CupertinoIcons.sun_max : CupertinoIcons.sun_max_fill),
                ),
              ],
            ),
          ),
          heightDivider,
          SizedBox(
            height: height3,
            child: Row(
              children: [
                widthDivider,
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
              ],
            ),
          ),
          heightDivider,
          SizedBox(
            height: height3,
            child: Row(
              children: [
                widthDivider,
                Expanded(
                  child: ColorGridContainer(
                    colorTitle: 'Tertiary',
                    color: colorScheme.tertiary,
                    onColorTitle: 'On Tertiary',
                    onColor: colorScheme.onTertiary,
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
          SizedBox(
            height: height3,
            child: Row(
              children: [
                widthDivider,
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
              ],
            ),
          ),
          heightDivider,
          SizedBox(
            height: height3,
            child: Row(
              children: [
                widthDivider,
                Expanded(
                  child: ColorGridContainer(
                    colorTitle: 'Tertiary Container',
                    color: colorScheme.tertiaryContainer,
                    onColorTitle: 'On Tertiary Container',
                    onColor: colorScheme.onTertiaryContainer,
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
          SizedBox(
            height: height4,
            child: Row(
              children: [
                widthDivider,
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
              ],
            ),
          ),
          heightDivider,
          SizedBox(
            height: height4,
            child: Row(
              children: [
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
          SizedBox(
            height: height2,
            child: Row(
              children: [
                widthDivider,
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
                widthDivider,
              ],
            ),
          ),
          heightDivider,
          SizedBox(
            height: height2,
            child: Row(
              children: [
                widthDivider,
                Expanded(
                  child: ColorGridContainer(
                    color: colorScheme.inverseSurface,
                    colorTitle: 'Inverse Surface',
                    onColor: colorScheme.onInverseSurface,
                  ),
                ),
                Expanded(
                  child: ColorGridContainer(
                    color: colorScheme.onInverseSurface,
                    colorTitle: 'On Inverse Surface',
                    onColor: colorScheme.inverseSurface,
                  ),
                ),
                Expanded(
                  child: ColorGridContainer(
                    color: colorScheme.inversePrimary,
                    colorTitle: 'Inverse Primary',
                    onColor: colorScheme.onPrimaryContainer,
                  ),
                ),
                widthDivider,
              ],
            ),
          ),
          heightDivider,
          SizedBox(
            height: height3,
            child: Row(
              children: [
                widthDivider,
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
                widthDivider,
              ],
            ),
          ),
          heightDivider,
          SizedBox(
            height: height2,
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
                widthDivider,
              ],
            ),
          ),
          heightDivider,
          SizedBox(
            height: height2,
            child: Row(
              children: [
                widthDivider,
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
