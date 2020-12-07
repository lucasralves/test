import 'package:models/models.dart';

abstract class StockRepository {
  Future<String> getMainCategories();
  Future<String> getCategoryContent({String id});
  Future<String> addNewCategory({String name, bool main});
  Future<String> editCategoryName({String name, String idParent, String id});
  Future<String> deleteCategory({String id});
}