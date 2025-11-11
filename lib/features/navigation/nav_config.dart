import 'package:flutter/material.dart';
import 'package:infra/l10n/app_localizations.dart';

typedef NavLabelBuilder = String Function(AppLocalizations l10n);

typedef ReportBuilder = Widget Function();

class ResearchNavConfig {
  ResearchNavConfig({
    required this.route,
    required this.icon,
    required this.selectedIcon,
    required this.labelBuilder,
    this.reportId,
  });

  final String route;
  final IconData icon;
  final IconData selectedIcon;
  final NavLabelBuilder labelBuilder;
  final String? reportId;

  bool get isProfile => reportId == null;
}

final researchNavItems = [
  ResearchNavConfig(
    route: '/dr1',
    icon: Icons.hub_outlined,
    selectedIcon: Icons.hub,
    labelBuilder: (l10n) => l10n.navDr1,
    reportId: 'dr1_architecture_validation_full',
  ),
  ResearchNavConfig(
    route: '/dr2',
    icon: Icons.account_tree_outlined,
    selectedIcon: Icons.account_tree,
    labelBuilder: (l10n) => l10n.navDr2,
    reportId: 'dr2_solution_pathing_full',
  ),
  ResearchNavConfig(
    route: '/dr25',
    icon: Icons.gavel_outlined,
    selectedIcon: Icons.gavel,
    labelBuilder: (l10n) => l10n.navDr25,
    reportId: 'dr2_5_market_access_full',
  ),
  ResearchNavConfig(
    route: '/dr3',
    icon: Icons.trending_up_outlined,
    selectedIcon: Icons.trending_up,
    labelBuilder: (l10n) => l10n.navDr3,
    reportId: 'dr3_value_pricing_full',
  ),
  ResearchNavConfig(
    route: '/profile',
    icon: Icons.person_outline,
    selectedIcon: Icons.person,
    labelBuilder: (l10n) => l10n.navProfile,
  ),
];

Map<String, String> researchSlugToRoute() {
  return {
    for (final item in researchNavItems)
      if (item.reportId != null) item.reportId!: item.route,
  };
}
