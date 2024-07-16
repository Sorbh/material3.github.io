import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:material3_color_scheme/presentation/shared/hover_container.dart';
import 'package:seo/seo.dart';

class ColorGridContainer extends StatelessWidget {
  const ColorGridContainer({
    super.key,
    this.colorTitle,
    this.color,
    this.colorTap,
    this.colorDimTitle,
    this.colorDim,
    this.colorDimTap,
    this.onColorTitle,
    this.onColor,
    this.onColorTap,
    this.onColorVarientTitle,
    this.onColorVarient,
    this.onColorVarientTap,
  });
  final String? colorTitle;
  final Color? color;
  final VoidCallback? colorTap;

  final String? colorDimTitle;
  final Color? colorDim;
  final VoidCallback? colorDimTap;

  final String? onColorTitle;
  final Color? onColor;
  final VoidCallback? onColorTap;

  final String? onColorVarientTitle;
  final Color? onColorVarient;
  final VoidCallback? onColorVarientTap;
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
                      onTap: colorTap,
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
                      onTap: colorDimTap,
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
              // onTap: () {
              //   copyToClipboard(context, colorToHex(onColor!));
              // },
              onTap: onColorTap,
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
              // onTap: () {
              //   copyToClipboard(context, colorToHex(onColorVarient!));
              // },
              onTap: onColorVarientTap,
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
    return Seo.text(
      text: title,
      style: TextTagStyle.h1,
      child: RichText(
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
      ),
    );
  }
}
