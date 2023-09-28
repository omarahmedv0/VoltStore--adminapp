import '../constants/route_manager.dart';
import 'init_app.dart';

String initialRoute() {
  bool? auth = sharedPreferences.getBool('authOK');

  if (auth == true) {
    return RouteManager.home;
  } else {
    return RouteManager.login;
  }
}
