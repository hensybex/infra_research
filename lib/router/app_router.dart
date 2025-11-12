import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:infra/data/models/document_record.dart';
import 'package:infra/data/services/document_registry.dart';
import 'package:infra/features/detail/note_detail_screen.dart';
import 'package:infra/features/detail/report_detail_screen.dart';
import 'package:infra/features/navigation/nav_config.dart';
import 'package:infra/features/navigation/navigation_shell.dart';
import 'package:infra/features/profile/presentation_screen.dart';
import 'package:infra/features/profile/profile_screen.dart';

class AppRouter {
  AppRouter();

  final GoRouter router = GoRouter(
    initialLocation: '/profile',
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            NavigationShell(shell: navigationShell),
        branches: researchNavItems
            .map(
              (config) => StatefulShellBranch(
                routes: [
                  GoRoute(
                    path: config.route,
                    builder: (context, state) => config.isProfile
                        ? const ProfileScreen()
                        : ReportDetailScreen(reportId: config.reportId!),
                  ),
                ],
              ),
            )
            .toList(),
      ),
      GoRoute(
        path: '/report/:id',
        name: 'report',
        pageBuilder: (context, state) {
          final id = Uri.decodeComponent(state.pathParameters['id']!);
          return MaterialPage(child: ReportDetailScreen(reportId: id));
        },
      ),
      GoRoute(
        path: '/document/:slug',
        name: 'document',
        pageBuilder: (context, state) {
          final slug = Uri.decodeComponent(state.pathParameters['slug']!);
          final record = state.extra is DocumentRecord
              ? state.extra as DocumentRecord
              : DocumentRegistry.instance.resolveBySlug(slug);
          if (record == null) {
            return MaterialPage(
              child: Scaffold(
                appBar: AppBar(),
                body: Center(child: Text('Документ не найден: $slug')),
              ),
            );
          }
          return MaterialPage(child: NoteDetailScreen(record: record));
        },
      ),
      GoRoute(
        path: '/presentation',
        name: 'presentation',
        builder: (context, state) => const PresentationScreen(),
      ),
    ],
  );
}
