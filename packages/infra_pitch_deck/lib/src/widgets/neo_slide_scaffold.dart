import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../theme/neo_colors.dart';

/// Shared slide container with animated gradient and glow accents.
class NeoSlideScaffold extends StatelessWidget {
  const NeoSlideScaffold({
    required this.child,
    this.padding = const EdgeInsets.symmetric(horizontal: 64, vertical: 48),
    this.gradient,
    this.enableOrbits = true,
    super.key,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final Gradient? gradient;
  final bool enableOrbits;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final gradientColors =
        gradient ??
        const LinearGradient(
          colors: <Color>[NeoColors.background, NeoColors.backgroundAlt],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        );

    return Container(
      decoration: BoxDecoration(gradient: gradientColors),
      child: Stack(
        children: <Widget>[
          if (enableOrbits) ..._buildOrbits(theme),
          Padding(padding: padding, child: child),
        ],
      ),
    );
  }

  List<Widget> _buildOrbits(ThemeData theme) {
    final random = Random(hashCode);

    return List<Widget>.generate(3, (int index) {
      final size = 240 + index * 80.0;
      final offset = Offset(
        random.nextDouble() * 200 - 100,
        -160 + random.nextDouble() * 120,
      );

      return Positioned(
        top: offset.dy,
        right: offset.dx.abs(),
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: RadialGradient(
              colors: <Color>[
                theme.colorScheme.primary.neoOpacity(0.24 / (index + 1)),
                Colors.transparent,
              ],
            ),
          ),
        ).animate().fadeIn(duration: 800.ms, delay: (index * 120).ms),
      );
    });
  }
}
