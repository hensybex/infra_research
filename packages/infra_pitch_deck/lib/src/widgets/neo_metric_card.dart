import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/neo_colors.dart';

class NeoMetricCard extends StatelessWidget {
  const NeoMetricCard({
    required this.metric,
    required this.caption,
    required this.description,
    this.icon,
    this.delay = Duration.zero,
    this.tight = false,
    super.key,
  });

  final String metric;
  final String caption;
  final String description;
  final IconData? icon;
  final Duration delay;
  final bool tight;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final card = Container(
      padding: EdgeInsets.all(tight ? 20 : 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: NeoColors.primary.neoOpacity(0.28)),
        gradient: const LinearGradient(
          colors: <Color>[Color(0x33252545), Color(0x00252545)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: Color(0x33000000),
            blurRadius: 24,
            offset: Offset(0, 12),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              if (icon != null) ...<Widget>[
                Icon(icon, color: NeoColors.accent, size: 24),
                const SizedBox(width: 10),
              ],
              Expanded(
                child: Text(
                  caption,
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: NeoColors.textSecondary,
                    letterSpacing: 0.6,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            metric,
            style: GoogleFonts.ibmPlexMono(
              fontSize: 44,
              fontWeight: FontWeight.w600,
              letterSpacing: -1,
              color: NeoColors.textPrimary,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            description,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: NeoColors.textSecondary,
              height: 1.4,
            ),
          ),
          if (tight) const SizedBox(height: 4),
        ],
      ),
    );

    return card
        .animate()
        .fadeIn(duration: 420.ms, delay: delay)
        .moveY(begin: 20, end: 0, curve: Curves.easeOut);
  }
}
