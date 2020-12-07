// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $StockController = BindInject(
  (i) => StockController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StockController on _StockControllerBase, Store {
  final _$mainCategoriesAtom =
      Atom(name: '_StockControllerBase.mainCategories');

  @override
  String get mainCategories {
    _$mainCategoriesAtom.reportRead();
    return super.mainCategories;
  }

  @override
  set mainCategories(String value) {
    _$mainCategoriesAtom.reportWrite(value, super.mainCategories, () {
      super.mainCategories = value;
    });
  }

  final _$categoryContentAtom =
      Atom(name: '_StockControllerBase.categoryContent');

  @override
  String get categoryContent {
    _$categoryContentAtom.reportRead();
    return super.categoryContent;
  }

  @override
  set categoryContent(String value) {
    _$categoryContentAtom.reportWrite(value, super.categoryContent, () {
      super.categoryContent = value;
    });
  }

  final _$mainCategoryAtom = Atom(name: '_StockControllerBase.mainCategory');

  @override
  bool get mainCategory {
    _$mainCategoryAtom.reportRead();
    return super.mainCategory;
  }

  @override
  set mainCategory(bool value) {
    _$mainCategoryAtom.reportWrite(value, super.mainCategory, () {
      super.mainCategory = value;
    });
  }

  final _$newCategoryResponseAtom =
      Atom(name: '_StockControllerBase.newCategoryResponse');

  @override
  String get newCategoryResponse {
    _$newCategoryResponseAtom.reportRead();
    return super.newCategoryResponse;
  }

  @override
  set newCategoryResponse(String value) {
    _$newCategoryResponseAtom.reportWrite(value, super.newCategoryResponse, () {
      super.newCategoryResponse = value;
    });
  }

  final _$editCategoryResponseAtom =
      Atom(name: '_StockControllerBase.editCategoryResponse');

  @override
  String get editCategoryResponse {
    _$editCategoryResponseAtom.reportRead();
    return super.editCategoryResponse;
  }

  @override
  set editCategoryResponse(String value) {
    _$editCategoryResponseAtom.reportWrite(value, super.editCategoryResponse,
        () {
      super.editCategoryResponse = value;
    });
  }

  final _$deleteCategoryResponseAtom =
      Atom(name: '_StockControllerBase.deleteCategoryResponse');

  @override
  String get deleteCategoryResponse {
    _$deleteCategoryResponseAtom.reportRead();
    return super.deleteCategoryResponse;
  }

  @override
  set deleteCategoryResponse(String value) {
    _$deleteCategoryResponseAtom
        .reportWrite(value, super.deleteCategoryResponse, () {
      super.deleteCategoryResponse = value;
    });
  }

  final _$getMainCategoriesAsyncAction =
      AsyncAction('_StockControllerBase.getMainCategories');

  @override
  Future<void> getMainCategories() {
    return _$getMainCategoriesAsyncAction.run(() => super.getMainCategories());
  }

  final _$getCategoryContentAsyncAction =
      AsyncAction('_StockControllerBase.getCategoryContent');

  @override
  Future<void> getCategoryContent() {
    return _$getCategoryContentAsyncAction
        .run(() => super.getCategoryContent());
  }

  final _$addNewCategoryAsyncAction =
      AsyncAction('_StockControllerBase.addNewCategory');

  @override
  Future<void> addNewCategory() {
    return _$addNewCategoryAsyncAction.run(() => super.addNewCategory());
  }

  final _$editCategoryNameAsyncAction =
      AsyncAction('_StockControllerBase.editCategoryName');

  @override
  Future<void> editCategoryName() {
    return _$editCategoryNameAsyncAction.run(() => super.editCategoryName());
  }

  final _$deleteCategoryAsyncAction =
      AsyncAction('_StockControllerBase.deleteCategory');

  @override
  Future<void> deleteCategory() {
    return _$deleteCategoryAsyncAction.run(() => super.deleteCategory());
  }

  final _$_StockControllerBaseActionController =
      ActionController(name: '_StockControllerBase');

  @override
  void changeMainCategoryStatus() {
    final _$actionInfo = _$_StockControllerBaseActionController.startAction(
        name: '_StockControllerBase.changeMainCategoryStatus');
    try {
      return super.changeMainCategoryStatus();
    } finally {
      _$_StockControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
mainCategories: ${mainCategories},
categoryContent: ${categoryContent},
mainCategory: ${mainCategory},
newCategoryResponse: ${newCategoryResponse},
editCategoryResponse: ${editCategoryResponse},
deleteCategoryResponse: ${deleteCategoryResponse}
    ''';
  }
}
