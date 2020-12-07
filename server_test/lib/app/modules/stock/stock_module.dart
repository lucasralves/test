import 'stock_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'stock_page.dart';

class StockModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $StockController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => StockPage()),
      ];

  static Inject get to => Inject<StockModule>.of();
}
