import 'package:flutter/material.dart';

import '../theme/neo_colors.dart';

class NeoBadge extends StatelessWidget {
  const NeoBadge({required this.label, this.icon, super.key});

  final String label;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: NeoColors.surface.neoOpacity(0.6),
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: NeoColors.primary.neoOpacity(0.4)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          if (icon != null) ...<Widget>[
            Icon(icon, size: 16, color: NeoColors.primary),
            const SizedBox(width: 8),
          ],
          Text(
            label,
            style: theme.textTheme.labelLarge?.copyWith(
              color: NeoColors.textPrimary,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.4,
            ),
          ),
        ],
      ),
    );
  }
}
