import 'package:teste_de_unidade/item.dart';
import 'package:teste_de_unidade/item_repository.dart';

class ItemService {
  IItemRepository repository;
  ItemService({
    required this.repository,
  });

  Future<List<Item>> buscarTodos() => repository.buscarTodos();
  List<Item> buscarTodosSync() => repository.buscarTodosSync();
  Item buscarPorId(int id) => repository.buscarPorId(1);
}
