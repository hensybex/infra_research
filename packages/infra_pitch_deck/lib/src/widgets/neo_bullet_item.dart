import 'package:flutter/material.dart';

import '../theme/neo_colors.dart';

class NeoBulletItem extends StatelessWidget {
  const NeoBulletItem({
    required this.text,
    this.style,
    this.bulletColor = NeoColors.accent,
    this.bulletSize = 8,
    this.icon,
    super.key,
  });

  final String text;
  final TextStyle? style;
  final Color bulletColor;
  final double bulletSize;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final TextStyle effectiveStyle =
        style ?? Theme.of(context).textTheme.bodyMedium ?? const TextStyle();

    final Widget marker = icon != null
        ? Icon(icon, color: bulletColor, size: bulletSize + 8)
        : Container(
            width: bulletSize,
            height: bulletSize,
            decoration: BoxDecoration(
              color: bulletColor,
              shape: BoxShape.circle,
            ),
          );

    return Align(
      alignment: Alignment.centerLeft,
      child: RichText(
        text: TextSpan(
          children: <InlineSpan>[
            WidgetSpan(alignment: PlaceholderAlignment.middle, child: marker),
            const WidgetSpan(
              alignment: PlaceholderAlignment.middle,
              child: SizedBox(width: 12),
            ),
            TextSpan(text: text, style: effectiveStyle),
          ],
        ),
      ),
    );
  }
}
