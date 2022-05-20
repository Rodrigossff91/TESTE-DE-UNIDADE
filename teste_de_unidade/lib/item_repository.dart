import 'package:teste_de_unidade/item.dart';

abstract class IItemRepository {
  Future<List<Item>> buscarTodos();
  List<Item> buscarTodosSync();
  Item buscarPorId(int id);
}

class ItemRepository implements IItemRepository {
  @override
  Item buscarPorId(int id) {
    return Item(name: 'Motorola', price: 2000);
  }

  @override
  Future<List<Item>> buscarTodos() async {
    final items = [
      Item(name: 'Motorola', price: 2000),
      Item(name: 'Iphone', price: 2000),
      Item(name: 'Nokia', price: 2000)
    ];

    await Future.delayed(Duration(seconds: 1));

    return items;
  }

  @override
  List<Item> buscarTodosSync() {
    final items = [
      Item(name: 'Motorola', price: 2000),
      Item(name: 'Iphone', price: 2000),
      Item(name: 'Nokia', price: 2000)
    ];
    return items;
  }
}
