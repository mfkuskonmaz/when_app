import 'package:flutter/material.dart';

import 'router.dart';
import 'theme.dart';

class WhenApp extends StatelessWidget {
  const WhenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'WhenApp',
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
      routerConfig: appRouter,
    );
  }
}