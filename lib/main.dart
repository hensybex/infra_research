import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:infra/core/localization/language_controller.dart';
import 'package:infra/core/theme/app_theme.dart';
import 'package:infra/data/repositories/document_repository.dart';
import 'package:infra/data/services/document_registry.dart';
import 'package:infra/l10n/app_localizations.dart';
import 'package:infra/router/app_router.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DocumentRegistry.ensureInitialized();
  runApp(const InfraApp());
}

class InfraApp extends StatefulWidget {
  const InfraApp({super.key});

  @override
  State<InfraApp> createState() => _InfraAppState();
}

class _InfraAppState extends State<InfraApp> {
  late final AppRouter _router;

  @override
  void initState() {
    super.initState();
    _router = AppRouter();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LanguageController()),
        ChangeNotifierProxyProvider<LanguageController, DocumentRepository>(
          create: (_) => DocumentRepository(),
          update: (_, controller, repository) {
            final repo = repository ?? DocumentRepository();
            repo.setLanguage(controller.language);
            return repo;
          },
        ),
      ],
      child: Consumer<LanguageController>(
        builder: (context, languageController, _) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            locale: languageController.locale,
            onGenerateTitle: (context) =>
                AppLocalizations.of(context)?.appTitle ?? 'Infra Research Hub',
            theme: AppTheme.light(),
            routerConfig: _router.router,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: AppLocalizations.supportedLocales,
          );
        },
      ),
    );
  }
}
