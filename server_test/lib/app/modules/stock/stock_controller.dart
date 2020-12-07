import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:servertest/app/modules/stock/repository/stock_repository_implementation.dart';
import 'package:rxdart/rxdart.dart';

part 'stock_controller.g.dart';

@Injectable()
class StockController = _StockControllerBase with _$StockController;

abstract class _StockControllerBase with Store {

  StockRepositoryImplementation repo = new StockRepositoryImplementation();

  _StockControllerBase() {
    pedidos = BehaviorSubject<String>();
    pedidosOut = pedidos.stream;
    pedidosIn = pedidos.sink;

    pedidosAdd = BehaviorSubject<String>();
    pedidosOutAdd = pedidosAdd.stream;
    pedidosInAdd = pedidosAdd.sink;
  }

  //----------------------------------------------------------------------------
  Stream<String> _streamPedido;
  StreamSubscription _pedidoSubscription;
  BehaviorSubject<String> pedidos;
  Stream<String> pedidosOut;
  Sink<String> pedidosIn;

  @observable
  String mainCategories;

  @action
  Future<void> getMainCategories() async {
    _streamPedido = repo.getMainCategories().asStream();
    _pedidoSubscription = _streamPedido.listen((event) {
      pedidosIn.add(event);
    });
    mainCategories = await repo.getMainCategories();
    print('\nMAIN CATEGORIES');
    print(mainCategories);
  }

  //----------------------------------------------------------------------------
  String _categoryId;
  void changeCategoryId(String value) => _categoryId = value;

  @observable
  String categoryContent;

  @action
  Future<void> getCategoryContent() async {
    if (_categoryId == null || _categoryId.isEmpty) {
      categoryContent = 'Insira um ID.';
    } else {
      categoryContent = await repo.getCategoryContent(id: _categoryId);
      print('\nCATEGORY CONTENT');
      print(categoryContent);
    }
  }

  //----------------------------------------------------------------------------
  Stream<String> _streamPedidoAdd;
  StreamSubscription _pedidoSubscriptionAdd;
  BehaviorSubject<String> pedidosAdd;
  Stream<String> pedidosOutAdd;
  Sink<String> pedidosInAdd;

  String _categoryName;
  String _addCategoryParentId;
  @observable
  bool mainCategory = true;
  void changeCategoryName(String value) => _categoryName = value;
  void changeCategoryParentId(String value) => _addCategoryParentId = value;
  @action
  void changeMainCategoryStatus() {
    mainCategory = !mainCategory;
  }

  @observable
  String newCategoryResponse;

  @action
  Future<void> addNewCategory() async {
    if (_categoryName == null || _categoryName.isEmpty) {
      newCategoryResponse = 'Insira um nome.';
    } else if ((_addCategoryParentId == null || _addCategoryParentId.isEmpty) && !mainCategory) {
      newCategoryResponse = 'Insira um ID.';
    } else {
      _streamPedidoAdd = repo.addNewCategory(name: _categoryName, main: mainCategory, idParent: _addCategoryParentId).asStream();
      _pedidoSubscriptionAdd = _streamPedidoAdd.listen((event) {
        pedidosInAdd.add(event);
      });
      newCategoryResponse = await repo.addNewCategory(name: _categoryName, main: mainCategory, idParent: _addCategoryParentId);
      print('\nADD CATEGORY');
      print(newCategoryResponse);
    }
  }

  //----------------------------------------------------------------------------
  String _editCategoryName;
  String _editCategoryParentId;
  String _editCategoryId;
  void editChangeCategoryName(String value) => _editCategoryName = value;
  void editChangeCategoryParentId(String value) => _editCategoryParentId = value;
  void editChangeCategoryId(String value) => _editCategoryId = value;

  @observable
  String editCategoryResponse;

  @action
  Future<void> editCategoryName() async {
    if (_editCategoryName == null || _editCategoryName.isEmpty || _editCategoryId == null || _editCategoryId.isEmpty) {
      editCategoryResponse = 'Insira todos os dados.';
    } else {
      editCategoryResponse = await repo.editCategoryName(name: _editCategoryName, idParent: _editCategoryParentId, id: _editCategoryId);
      print('\nEDIT CATEGORY');
      print(editCategoryResponse);
    }
  }

  //----------------------------------------------------------------------------
  String _deleteCategoryId;
  void deleteChangeCategoryName(String value) => _deleteCategoryId = value;

  @observable
  String deleteCategoryResponse;

  @action
  Future<void> deleteCategory() async {
    print('Aqui 00');
    if (_deleteCategoryId == null || _deleteCategoryId.isEmpty) {
      print('Aqui 01');
      deleteCategoryResponse = 'Insira o ID.';
    } else {
      print('Aqui 02');
      deleteCategoryResponse = await repo.deleteCategory(id: _deleteCategoryId);
      print('\nEDIT CATEGORY');
      print(deleteCategoryResponse);
    }
  }

}
