import 'package:flutter/material.dart';
import 'package:qrlogistix/app/domain/enumerators/enumerators.dart';
import 'package:qrlogistix/app/ui/models/models.dart';
import 'package:qrlogistix/app/ui/views/packages/PendingPackageView.dart';
import 'package:qrlogistix/app/ui/views/views.dart';

class AppRoutes {
  static const _checkAuthViewRoute = 'check-auth';
  static const _loginViewRoute = 'login';
  static const _recoverPasswordViewRoute = 'recover-password';
  static const _zoneHomeViewRoute = 'zone-home';
  static const _zoneDetailViewRoute = 'zone-detail';
  static const _packageHomeViewRoute = 'package-home';
  static const initialRoute = _loginViewRoute;

  static final _menuOptions = <MenuOptionModel>[
    // Check Auth
    MenuOptionModel(
      route: _checkAuthViewRoute,
      name: 'Check Auth',
      view: const CheckAuthView(),
      icon: Icons.home,
    ),

    // Login Home
    MenuOptionModel(
      route: _loginViewRoute,
      name: 'Login',
      view: const LoginView(),
      icon: Icons.home,
    ),

    // Recover password
    MenuOptionModel(
      route: _recoverPasswordViewRoute,
      name: 'Recover password',
      view: const RecoverPasswordView(),
      icon: Icons.home,
    ),

    // Package Home
    MenuOptionModel(
      route: _packageHomeViewRoute,
      name: 'Packages',
      view: PendingPackageView(),
      icon: Icons.home,
    ),

    // Zone Home
    MenuOptionModel(
      route: _zoneHomeViewRoute,
      name: 'Zones',
      view: const ZoneHomeView(),
      icon: Icons.home,
    ),

    // Zone Detail
    MenuOptionModel(
      route: _zoneDetailViewRoute,
      name: 'Zone Detail',
      view: const ZoneDetailView(),
      icon: Icons.home,
    ),
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> response = {};
    for (var option in _menuOptions) {
      response.addAll({option.route: (BuildContext context) => option.view});
    }

    return response;
  }

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => const ZoneHomeView(),
    );
  }

  static String getViewRoute(ViewRoutesEnum route) => getViewData(route).route;

  static MenuOptionModel getViewData(ViewRoutesEnum route) {
    late String viewRoute;
    switch (route) {
      case ViewRoutesEnum.checkAuth:
        viewRoute = _checkAuthViewRoute;
        break;
      case ViewRoutesEnum.recoverPassword:
        viewRoute = _recoverPasswordViewRoute;
        break;
      case ViewRoutesEnum.zoneDetail:
        viewRoute = _zoneDetailViewRoute;
        break;
      case ViewRoutesEnum.zoneHome:
        viewRoute = _zoneHomeViewRoute;
        break;
      case ViewRoutesEnum.packageHome:
        viewRoute = _packageHomeViewRoute;
        break;
      default:
        viewRoute = _loginViewRoute;
        break;
    }

    return _menuOptions.firstWhere((element) => element.route == viewRoute);
  }
}
