// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/cupertino.dart' as _i5;
import 'package:flutter/material.dart' as _i4;

import '../app/home_page.dart' as _i1;
import '../app/set_item_page.dart' as _i2;
import '../domain/uimodel/item.dart' as _i6;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.HomePage(),
      );
    },
    SetItemRoute.name: (routeData) {
      final args = routeData.argsAs<SetItemRouteArgs>(
          orElse: () => const SetItemRouteArgs());
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i2.SetItemPage(
          key: args.key,
          data: args.data,
        ),
      );
    },
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(
          HomeRoute.name,
          path: '/',
        ),
        _i3.RouteConfig(
          SetItemRoute.name,
          path: '/set-item-page',
        ),
      ];
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i3.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '/',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i2.SetItemPage]
class SetItemRoute extends _i3.PageRouteInfo<SetItemRouteArgs> {
  SetItemRoute({
    _i5.Key? key,
    _i6.ItemUiModel? data,
  }) : super(
          SetItemRoute.name,
          path: '/set-item-page',
          args: SetItemRouteArgs(
            key: key,
            data: data,
          ),
        );

  static const String name = 'SetItemRoute';
}

class SetItemRouteArgs {
  const SetItemRouteArgs({
    this.key,
    this.data,
  });

  final _i5.Key? key;

  final _i6.ItemUiModel? data;

  @override
  String toString() {
    return 'SetItemRouteArgs{key: $key, data: $data}';
  }
}
