import 'package:auto_route/auto_route.dart';
import 'package:store_shot_studio/src/features/studio/presentation/pages/studio_page.dart';


part 'app_router.gr.dart';


@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: StudioRoute.page,initial: true)
  ];
}
