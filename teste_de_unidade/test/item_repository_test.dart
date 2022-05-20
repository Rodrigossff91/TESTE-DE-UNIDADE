import 'package:test/test.dart';
import 'package:teste_de_unidade/item.dart';
import 'package:teste_de_unidade/item_repository.dart';

void main() {
  test('Buscar Todos asyncrono forma 1', () async {
    // Preparação
    var repository = ItemRepository();

    // Ação/execução

    var items = await repository.buscarTodos();

    //Verificação

    expect(items, isNotEmpty);
  });

  test('Buscar Todos asyncrono forma 2', () {
    // Preparação
    var repository = ItemRepository();

    // Ação/execução

    var buscarTodos = repository.buscarTodos();

    //Verificação

    expect(buscarTodos, completion(isNotEmpty));
  });

  test('Buscar item por id', () {
    // Preparação
    var repository = ItemRepository();

    // Ação/execução

    var item = repository.buscarPorId(1);

    //Verificação

    // expect(
    //     item, allOf([isNotEmpty, equals(Item(name: 'Motorola', price: 2000))]));

    expect(item, isNotNull);
    expect(item, Item(name: 'Motorola', price: 2000));
  });
}
