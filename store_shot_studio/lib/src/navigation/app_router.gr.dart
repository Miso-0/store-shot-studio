// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    StudioRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const StudioPage(),
      );
    }
  };
}

/// generated route for
/// [StudioPage]
class StudioRoute extends PageRouteInfo<void> {
  const StudioRoute({List<PageRouteInfo>? children})
      : super(
          StudioRoute.name,
          initialChildren: children,
        );

  static const String name = 'StudioRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
