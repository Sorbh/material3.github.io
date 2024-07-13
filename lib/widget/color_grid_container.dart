import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:material3_color_scheme/main.dart';
import 'package:material3_color_scheme/widget/hover_container.dart';
import 'package:seo/seo.dart';

class ColorGridContainer extends StatelessWidget {
  const ColorGridContainer({
    super.key,
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
