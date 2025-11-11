import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/neo_colors.dart';

class NeoHeadline extends StatelessWidget {
  const NeoHeadline({
    required this.title,
    this.subtitle,
    this.alignment = CrossAxisAlignment.start,
    this.titleScale = 1,
    this.subtitleScale = 1.5,
    super.key,
  });

  final String title;
  final String? subtitle;
  final CrossAxisAlignment alignment;
  final double titleScale;
  final double subtitleScale;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final TextStyle? baseTitleStyle = theme.textTheme.displayLarge?.copyWith(
      fontFamily: GoogleFonts.spaceGrotesk().fontFamily,
      fontWeight: FontWeight.w700,
      letterSpacing: -1.4,
    );
    final TextStyle? scaledTitleStyle = baseTitleStyle?.copyWith(
      fontSize: baseTitleStyle.fontSize != null
          ? baseTitleStyle.fontSize! * titleScale
          : null,
    );

    final TextStyle? baseSubtitleStyle = theme.textTheme.titleLarge?.copyWith(
      color: NeoColors.textSecondary,
      fontWeight: FontWeight.w500,
      height: 1.35,
    );
    final TextStyle? scaledSubtitleStyle = baseSubtitleStyle?.copyWith(
      fontSize: baseSubtitleStyle.fontSize != null
          ? baseSubtitleStyle.fontSize! * subtitleScale
          : null,
    );

    return Column(
      crossAxisAlignment: alignment,
      children: <Widget>[
        Container(
          width: 64,
          height: 4,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[NeoColors.primary, NeoColors.secondary],
            ),
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
        ),
        const SizedBox(height: 24),
        Text(title, style: scaledTitleStyle),
        if (subtitle != null) ...<Widget>[
          const SizedBox(height: 16),
          Text(subtitle!, style: scaledSubtitleStyle),
        ],
      ],
    );
  }
}
