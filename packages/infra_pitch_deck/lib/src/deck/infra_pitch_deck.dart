import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../theme/neo_theme.dart';
import 'slides/01_cover.dart';
import 'slides/02_why_now.dart';
import 'slides/03_duo.dart';
import 'slides/04_proof_points.dart';
import 'slides/05_north_star.dart';
import 'slides/06_roadmap_overview.dart';
import 'slides/07_console_copilot_deepdive.dart';
import 'slides/08_partner_hub_superapp.dart';
import 'slides/09_support_modules_matrix.dart';
import 'slides/10_discovery_catalog_walkthrough.dart';
import 'slides/11_financials_roi.dart';
import 'slides/12_risks_guardrails.dart';
import 'slides/13_operating_model.dart';
import 'slides/14_portfolio_snapshots.dart';
import 'slides/15_call_to_action.dart';

class InfraPitchDeck extends StatefulWidget {
  const InfraPitchDeck({super.key});

  @override
  State<InfraPitchDeck> createState() => _InfraPitchDeckState();
}

class _InfraPitchDeckState extends State<InfraPitchDeck> {
  late final List<Widget> _slides = <Widget>[
    CoverSlide(),
    WhyNowSlide(),
    DuoSlide(),
    ProofPointsSlide(),
    NorthStarSlide(),
    RoadmapOverviewSlide(),
    ConsoleCopilotDeepdiveSlide(),
    PartnerHubSuperappSlide(),
    SupportModulesMatrixSlide(),
    DiscoveryCatalogWalkthroughSlide(),
    FinancialsRoiSlide(),
    RisksGuardrailsSlide(),
    OperatingModelSlide(),
    PortfolioSnapshotsSlide(),
    CallToActionSlide(),
  ];

  @override
  Widget build(BuildContext context) {
    return ResponsiveBreakpoints.builder(
      breakpoints: const <Breakpoint>[
        Breakpoint(start: 0, end: 1023, name: MOBILE),
        Breakpoint(start: 1024, end: 1439, name: TABLET),
        Breakpoint(start: 1440, end: 1919, name: DESKTOP),
        Breakpoint(start: 1920, end: double.infinity, name: '4K'),
      ],
      child: Builder(
        builder: (BuildContext context) {
          final double targetWidth = ResponsiveValue<double>(
            context,
            defaultValue: 1480,
            conditionalValues: const <Condition<double>>[
              Condition.smallerThan(name: DESKTOP, value: 1320),
              Condition.smallerThan(name: TABLET, value: 1080),
              Condition.smallerThan(name: MOBILE, value: 760),
            ],
          ).value;

          return ResponsiveScaledBox(
            width: targetWidth,
            child: FlutterDeckApp(
              themeMode: ThemeMode.dark,
              darkTheme: NeoTheme.deckDark(),
              configuration: FlutterDeckConfiguration(
                transition: const FlutterDeckTransition.fade(),
                progressIndicator: const FlutterDeckProgressIndicator.gradient(
                  gradient: LinearGradient(
                    colors: <Color>[Color(0xFF6EE7FF), Color(0xFFC084FC)],
                  ),
                  backgroundColor: Colors.transparent,
                ),
                header: const FlutterDeckHeaderConfiguration(showHeader: false),
                footer: const FlutterDeckFooterConfiguration(showFooter: false),
                controls: const FlutterDeckControlsConfiguration(
                  presenterToolbarVisible: false,
                  gestures: FlutterDeckGesturesConfiguration.mobileOnly(),
                  shortcuts: FlutterDeckShortcutsConfiguration(),
                ),
              ),
              slides: _slides,
            ),
          );
        },
      ),
    );
  }
}
