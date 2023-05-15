
import 'package:demo_localization/theme/theme_service.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home_page.dart';
import 'im_loader.dart';
import 'l10n/l10.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: L10n.all,
      path: 'http://localhost:8080/l10n/',
      fallbackLocale: L10n.all[0],
      startLocale: L10n.all[0],
      assetLoader: ImAssetLoader(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeData theme = ThemeData();
  @override
  void initState() {
    _getTheme('default');
    super.initState();
  }

  _getTheme(String? themeId) async {
    ThemeService().setTheme(themeId);
  }

  @override
  Widget build(BuildContext context) {
    // context.setLocale(L10n.all[0]);
    return ChangeNotifierProvider(
      create: (_) => ThemeService(),
      child: Consumer<ThemeService>(
          builder: (context, ThemeService themeService, child) {
          return MaterialApp(
            key: ValueKey(context.locale),
            title: 'Localization Demo',
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            theme: themeService.theme,
            home: const HomePage(),
          );
        }
      ),
    );
  }
}
