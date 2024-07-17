import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material3_color_scheme/core/core.dart';
import 'package:material3_color_scheme/presentation/home/widget/color_grid_container.dart';
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
                          colorTap: () {
                            AppRouter.gotoColorRoleScreen(context, 'Primary');
                          },
                          onColorTap: () {
                            AppRouter.gotoColorRoleScreen(context, 'On Primary');
                          },
                        ),
                      ),
                      widthDivider,
                      Expanded(
                        child: ColorGridContainer(
                          colorTitle: 'Secondary',
                          color: colorScheme.secondary,
                          colorTap: () => AppRouter.gotoColorRoleScreen(context, 'Secondary'),
                          onColorTitle: 'On Secondary',
                          onColor: colorScheme.onSecondary,
                          onColorTap: () => AppRouter.gotoColorRoleScreen(context, 'On Secondary'),
                        ),
                      ),
                      widthDivider,
                      Expanded(
                        child: ColorGridContainer(
                          colorTitle: 'Tertiary',
                          color: colorScheme.tertiary,
                          colorTap: () => AppRouter.gotoColorRoleScreen(context, 'Tertiary'),
                          onColorTitle: 'On Tertiary',
                          onColor: colorScheme.onTertiary,
                          onColorTap: () => AppRouter.gotoColorRoleScreen(context, 'On Tertiary'),
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
                    colorTap: () => AppRouter.gotoColorRoleScreen(context, 'Error'),
                    onColorTitle: 'On Error',
                    onColor: colorScheme.onError,
                    onColorTap: () => AppRouter.gotoColorRoleScreen(context, 'On Error'),
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
                          colorTap: () => AppRouter.gotoColorRoleScreen(context, 'Primary Container'),
                          onColorTitle: 'On Primary Container',
                          onColor: colorScheme.onPrimaryContainer,
                          onColorTap: () => AppRouter.gotoColorRoleScreen(context, 'On Primary Container'),
                        ),
                      ),
                      widthDivider,
                      Expanded(
                        child: ColorGridContainer(
                          colorTitle: 'Secondary Container',
                          color: colorScheme.secondaryContainer,
                          colorTap: () => AppRouter.gotoColorRoleScreen(context, 'Secondary Container'),
                          onColorTitle: 'On Secondary Container',
                          onColor: colorScheme.onSecondaryContainer,
                          onColorTap: () => AppRouter.gotoColorRoleScreen(context, 'On Secondary Container'),
                        ),
                      ),
                      widthDivider,
                      Expanded(
                        child: ColorGridContainer(
                          colorTitle: 'Tertiary Container',
                          color: colorScheme.tertiaryContainer,
                          colorTap: () => AppRouter.gotoColorRoleScreen(context, 'Tertiary Container'),
                          onColorTitle: 'On Tertiary Container',
                          onColor: colorScheme.onTertiaryContainer,
                          onColorTap: () => AppRouter.gotoColorRoleScreen(context, 'On Tertiary Container'),
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
                    colorTap: () => AppRouter.gotoColorRoleScreen(context, 'Error Container'),
                    onColorTitle: 'On Error Container',
                    onColor: colorScheme.onErrorContainer,
                    onColorTap: () => AppRouter.gotoColorRoleScreen(context, 'On Error Container'),
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
                          colorTap: () => AppRouter.gotoColorRoleScreen(context, 'Primary Fixed'),
                          colorDimTitle: 'Primary Fixed Dim',
                          colorDim: colorScheme.primaryFixedDim,
                          colorDimTap: () => AppRouter.gotoColorRoleScreen(context, 'Primary Fixed Dim'),
                          onColorTitle: 'On Primary Fixed',
                          onColor: colorScheme.onPrimaryFixed,
                          onColorTap: () => AppRouter.gotoColorRoleScreen(context, 'On Primary Fixed'),
                          onColorVarientTitle: 'On Primary Fixed Variant',
                          onColorVarient: colorScheme.onPrimaryFixedVariant,
                          onColorVarientTap: () => AppRouter.gotoColorRoleScreen(context, 'On Primary Fixed Variant'),
                        ),
                      ),
                      widthDivider,
                      Expanded(
                        child: ColorGridContainer(
                          colorTitle: 'Secondary Fixed',
                          color: colorScheme.secondaryFixed,
                          colorTap: () => AppRouter.gotoColorRoleScreen(context, 'Secondary Fixed'),
                          colorDimTitle: 'Secondary Fixed Dim',
                          colorDim: colorScheme.secondaryFixedDim,
                          colorDimTap: () => AppRouter.gotoColorRoleScreen(context, 'Secondary Fixed Dim'),
                          onColorTitle: 'On Secondary Fixed',
                          onColor: colorScheme.onSecondaryFixed,
                          onColorTap: () => AppRouter.gotoColorRoleScreen(context, 'On Secondary Fixed'),
                          onColorVarientTitle: 'On Secondary Fixed Variant',
                          onColorVarient: colorScheme.onSecondaryFixedVariant,
                          onColorVarientTap: () => AppRouter.gotoColorRoleScreen(context, 'On Secondary Fixed Variant'),
                        ),
                      ),
                      widthDivider,
                      Expanded(
                        child: ColorGridContainer(
                          colorTitle: 'Tertiary Fixed',
                          color: colorScheme.tertiaryFixed,
                          colorTap: () => AppRouter.gotoColorRoleScreen(context, 'Tertiary Fixed'),
                          colorDimTitle: 'Tertiary Fixed Dim',
                          colorDim: colorScheme.tertiaryFixedDim,
                          colorDimTap: () => AppRouter.gotoColorRoleScreen(context, 'Tertiary Fixed Dim'),
                          onColorTitle: 'On Tertiary Fixed',
                          onColor: colorScheme.onTertiaryFixed,
                          onColorTap: () => AppRouter.gotoColorRoleScreen(context, 'On Tertiary Fixed'),
                          onColorVarientTitle: 'On Tertiary Fixed Variant',
                          onColorVarient: colorScheme.onTertiaryFixedVariant,
                          onColorVarientTap: () => AppRouter.gotoColorRoleScreen(context, 'On Tertiary Fixed Variant'),
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
                          colorTap: () => AppRouter.gotoColorRoleScreen(context, 'Surface Dim'),
                          onColor: colorScheme.onSurface,
                        ),
                      ),
                      Expanded(
                        child: ColorGridContainer(
                          colorTitle: 'Surface',
                          color: colorScheme.surface,
                          colorTap: () => AppRouter.gotoColorRoleScreen(context, 'Surface'),
                          onColor: colorScheme.onSurface,
                        ),
                      ),
                      Expanded(
                        child: ColorGridContainer(
                          colorTitle: 'Surface Bright',
                          color: colorScheme.surfaceBright,
                          colorTap: () => AppRouter.gotoColorRoleScreen(context, 'Surface Bright'),
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
                    onColorTap: () => AppRouter.gotoColorRoleScreen(context, 'Inverse Surface'),

                    onColorVarient: colorScheme.onInverseSurface,
                    onColorVarientTitle: 'On Inverse Surface',
                    onColorVarientTap: () => AppRouter.gotoColorRoleScreen(context, 'On Inverse Surface'),
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
                          colorTap: () => AppRouter.gotoColorRoleScreen(context, 'Surface Container Lowest'),
                          onColor: colorScheme.onSurface,
                        ),
                      ),
                      Expanded(
                        child: ColorGridContainer(
                          color: colorScheme.surfaceContainerLow,
                          colorTitle: 'Surface Container Low',
                          colorTap: () => AppRouter.gotoColorRoleScreen(context, 'Surface Container Low'),
                          onColor: colorScheme.onSurface,
                        ),
                      ),
                      Expanded(
                        child: ColorGridContainer(
                          color: colorScheme.surfaceContainer,
                          colorTitle: 'Surface Container',
                          colorTap: () => AppRouter.gotoColorRoleScreen(context, 'Surface Container'),
                          onColor: colorScheme.onSurface,
                        ),
                      ),
                      Expanded(
                        child: ColorGridContainer(
                          color: colorScheme.surfaceContainerHigh,
                          colorTitle: 'Surface Container High',
                          colorTap: () => AppRouter.gotoColorRoleScreen(context, 'Surface Container High'),
                          onColor: colorScheme.onSurface,
                        ),
                      ),
                      Expanded(
                        child: ColorGridContainer(
                          color: colorScheme.surfaceContainerHighest,
                          colorTitle: 'Surface Container Highest',
                          colorTap: () => AppRouter.gotoColorRoleScreen(context, 'Surface Container Highest'),
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
                          onColorTap: () => AppRouter.gotoColorRoleScreen(context, 'Inverse Primary'),
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
                          onColorTap: () => AppRouter.gotoColorRoleScreen(context, 'On Surface'),
                          color: colorScheme.surfaceContainerLowest,
                        ),
                      ),
                      Expanded(
                        child: ColorGridContainer(
                          onColor: colorScheme.onSurfaceVariant,
                          onColorTitle: 'On Surface Variant',
                          onColorTap: () => AppRouter.gotoColorRoleScreen(context, 'On Surface Variant'),
                          color: colorScheme.surfaceContainerLowest,
                        ),
                      ),
                      Expanded(
                        child: ColorGridContainer(
                          onColor: colorScheme.outline,
                          onColorTitle: 'Outline',
                          onColorTap: () => AppRouter.gotoColorRoleScreen(context, 'Outline'),
                          color: colorScheme.onSurface,
                        ),
                      ),
                      Expanded(
                        child: ColorGridContainer(
                          onColor: colorScheme.outlineVariant,
                          onColorTitle: 'Outline Variant',
                          onColorTap: () => AppRouter.gotoColorRoleScreen(context, 'Outline Variant'),
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
                          onColorTap: () => AppRouter.gotoColorRoleScreen(context, 'Scrim'),
                          color: Colors.white,
                        ),
                      ),
                      widthDivider,
                      Expanded(
                        child: ColorGridContainer(
                          onColor: colorScheme.shadow,
                          onColorTitle: 'Shadow',
                          onColorTap: () => AppRouter.gotoColorRoleScreen(context, 'Shadow'),
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
