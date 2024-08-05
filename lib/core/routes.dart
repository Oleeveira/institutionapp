import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:institutionapp/pages/bottom_bar_state.dart';
import 'package:institutionapp/pages/home_page.dart';
import 'package:institutionapp/pages/item_register_page.dart';
import 'package:institutionapp/pages/legal_entities_profile_page.dart';
import 'package:institutionapp/pages/legal_entities_login_page.dart';

class RouteNames {
  static const String legal_entities_login = "legal_entities_login";
  static const String inicial = "inicial";
  static const String legal_entities_profile_page = "legal_entities_profile_page";
  static const String item_register_page = "item_register_page";
  static const String home_page = "home_page";
  static const String bottom_bar_state = "bar_state";
}

class AppRountersConfiguration {
  static GoRouter returnRouter() {
    return GoRouter(
      initialLocation: '/bar_state',
      routes: [
        GoRoute(
          path: '/item_register_page',
          name: RouteNames.item_register_page,
          pageBuilder: (context, state) {
            return  MaterialPage(
              child: ItemRegisterPage(),
            );
          },
        ),
        GoRoute(
          path: '/home_page',
          name: RouteNames.home_page,
          pageBuilder: (context, state) {
            return  const MaterialPage(
              child: HomePage(),
            );
          },
        ),
        GoRoute(
          path: '/legal_entities_login',
          name: RouteNames.legal_entities_login,
          pageBuilder: (context, state) {
            return  MaterialPage(
              child: LegalEntitiesLoginPage(),
            );
          },
        ),
        GoRoute(
          path: '/legal_entities_profile_page',
          name: RouteNames.legal_entities_profile_page,
          pageBuilder: (context, state) {
            return const MaterialPage(
              child: LegalEntitiesProfilePage(),
            );
          },
        ),
        GoRoute(
          path: '/bar_state',
          name: RouteNames.bottom_bar_state,
          pageBuilder: (context, state) {
            return const MaterialPage(
              child: BottomBar(),
            );
          },
        ),
      ],
    );
  }
}
