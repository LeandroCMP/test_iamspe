import 'package:flutter_modular/flutter_modular.dart';
import 'package:iamspeapp/app/modules/accredited_network/accredited_view.dart';

class AccreditedModule extends Module {
  @override
  final List<Bind> binds = [
    /*Bind.lazySingleton(
      (i) => AccreditedController(accreditedNetworkService: i()),
    )*/
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (_, args) => const AccreditedPage(),
    ),
  ];
}
