import 'package:auto_route/annotations.dart';
import 'package:qtasnim_test/app/home_page.dart';
import 'package:qtasnim_test/app/set_item_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: HomePage, initial: true),
    AutoRoute(page: SetItemPage)
  ],
)
class $AppRouter {}