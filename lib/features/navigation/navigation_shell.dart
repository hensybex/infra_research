import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:infra/features/common/widgets/language_switcher.dart';
import 'package:infra/features/navigation/nav_config.dart';
import 'package:infra/l10n/app_localizations.dart';

class NavigationShell extends StatelessWidget {
  const NavigationShell({super.key, required this.shell});

  final StatefulNavigationShell shell;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final configs = researchNavItems;
    final destinations = configs
        .map(
          (config) => NavigationDestination(
            icon: Icon(config.icon),
            selectedIcon: Icon(config.selectedIcon),
            label: config.labelBuilder(l10n),
          ),
        )
        .toList();
    final currentLabel = configs[shell.currentIndex].labelBuilder(l10n);
    return Scaffold(
      appBar: AppBar(
        title: Text(currentLabel),
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: LanguageSwitcher(compact: true),
          ),
        ],
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        child: shell,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: shell.currentIndex,
        destinations: destinations,
        onDestinationSelected: (index) {
          shell.goBranch(index, initialLocation: index == shell.currentIndex);
        },
      ),
    );
  }
}
