import 'package:flutter/material.dart';
import 'package:material3_color_scheme/core/constant/global_constant.dart';
import 'package:seo/seo.dart';

class ColorRoleScreen extends StatelessWidget {
  const ColorRoleScreen({super.key, required this.color});
  final String color;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final colorRoleData = $globalConstant.colorRole.filter(color);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorScheme.inversePrimary,
        title: Seo.head(tags: [
          MetaTag(name: 'title', content: color),
          MetaTag(name: 'description', content: colorRoleData.desriptionl),
        ], child: Text(color)),
      ),
      body: colorRoleData != null
          ? Container(
              margin: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Seo.text(
                    text: colorRoleData.name,
                    style: TextTagStyle.h1,
                    child: Text(
                      colorRoleData.name,
                      style: textTheme.headlineMedium,
                    ),
                  ),
                  const SizedBox(height: 18),
                  Seo.text(
                    text: colorRoleData.desriptionl,
                    style: TextTagStyle.p,
                    child: Text(
                      colorRoleData.desriptionl,
                      style: textTheme.titleMedium,
                    ),
                  ),
                ],
              ),
            )
          : Seo.text(
              text: 'No Information available for color role $color',
              style: TextTagStyle.h1,
              child: Text('No Information available for color role $color', style: textTheme.headlineSmall)),
    );
  }
}
