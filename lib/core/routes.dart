import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:institutionapp/pages/inicial_page.dart';
import 'package:institutionapp/pages/item_register_page.dart';
import 'package:institutionapp/pages/legal_entities_profile_page.dart';
import 'package:institutionapp/pages/legal_entities_login_page.dart';

class RouteNames {
  static const String legal_entities_login = "legal_entities_login";
  static const String inicial = "inicial";
  static const String legal_entities_profile_page = "legal_entities_profile_page";
  static const String item_register_page = "item_register_page";
}

class AppRountersConfiguration {
  static GoRouter returnRouter() {
    return GoRouter(
      initialLocation: '/item_register_page',
      routes: [
        GoRoute(
          path: '/inicial',
          name: RouteNames.inicial,
          pageBuilder: (context, state) {
            return const MaterialPage(
              child: InicialPage(),
              fullscreenDialog: true,
            );
          },
        ),
        GoRoute(
          path: '/item_register_page',
          name: RouteNames.item_register_page,
          pageBuilder: (context, state) {
            return  MaterialPage(
              child: ItemRegisterPage(),
              fullscreenDialog: true,
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
      ],
    );
  }
}
