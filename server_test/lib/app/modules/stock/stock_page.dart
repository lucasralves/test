import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:servertest/app/modules/stock/widgets/add_new_category_widget.dart';
import 'package:servertest/app/modules/stock/widgets/edit_category_name_widget.dart';
import 'package:servertest/app/modules/stock/widgets/get_category_content_widget.dart';
import 'package:servertest/app/modules/stock/widgets/get_main_categories_widget.dart';
import 'package:servertest/app/modules/stock/widgets/get_main_categories_widget2.dart';
import 'package:servertest/app/modules/stock/widgets/remove_category_widget.dart';
import 'stock_controller.dart';

class StockPage extends StatefulWidget {
  final String title;
  const StockPage({Key key, this.title = "Stock"}) : super(key: key);

  @override
  _StockPageState createState() => _StockPageState();
}

class _StockPageState extends ModularState<StockPage, StockController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[

              GetMainCategoriesWidget2(
                key: UniqueKey(),
                action: controller.getMainCategories,
                path: '/stock/categories/all',
              ),

              GetCategoryContentWidget(
                key: UniqueKey(),
                path: '/stock/categories/?id={id_categoria}',
                action: controller.getCategoryContent,
              ),

              AddNewCategoryWidget(
                key: UniqueKey(),
                action: controller.addNewCategory,
                path: '/stock/categories/ \'application/json\' ',
              ),

              EditCategoryNameWidget(
                path: '/stock/categories/{id_categoria}/',
                action: controller.editCategoryName,
                key: UniqueKey(),
              ),

              RemoveCategoryWidget(
                key: UniqueKey(),
                action: controller.deleteCategory,
                path: '/stock/categories/{id_categoria}/',
              ),

            ],
          ),
        ),
      ),
    );
  }
}
