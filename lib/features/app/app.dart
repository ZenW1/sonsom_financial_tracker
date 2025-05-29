import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:sonsom_financial_tracker/features/main/view/main_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


import '../../core/app_color.dart';
import '../../core/app_theme.dart';


class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: AppTheme.lightAppTheme,
      themeMode: ThemeMode.dark,
      color: AppColors.primary,
      debugShowCheckedModeBanner: false,
      // locale: const Locale('km_KH'),
      localizationsDelegates:  [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      // address support locale

      fallbackLocale: const Locale('en'),
      supportedLocales:const [
        Locale('en', 'EN'),
      ],
      home: const MainScreen(),
    );
  }
}
