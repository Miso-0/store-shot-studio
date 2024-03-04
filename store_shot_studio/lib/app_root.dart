import 'package:flutter/material.dart';
import 'package:store_shot_studio/src/core/themes/light_theme.dart';
import 'package:store_shot_studio/src/navigation/app_router.dart';

class AppRoot extends StatelessWidget {
  AppRoot({super.key});
  final _autoRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: lightTheme,
      debugShowCheckedModeBanner: false,
      routerDelegate: _autoRouter.delegate(),
      routeInformationParser: _autoRouter.defaultRouteParser(),
    );
  }
}
