import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:servertest/app/modules/stock/stock_controller.dart';
import 'package:servertest/app/modules/stock/stock_module.dart';

void main() {
  initModule(StockModule());
  // StockController stock;
  //
  setUp(() {
    //     stock = StockModule.to.get<StockController>();
  });

  group('StockController Test', () {
    //   test("First Test", () {
    //     expect(stock, isInstanceOf<StockController>());
    //   });

    //   test("Set Value", () {
    //     expect(stock.value, equals(0));
    //     stock.increment();
    //     expect(stock.value, equals(1));
    //   });
  });
}
