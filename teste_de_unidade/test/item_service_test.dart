import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:teste_de_unidade/item.dart';
import 'package:teste_de_unidade/item_repository.dart';
import 'package:teste_de_unidade/item_service.dart';

// ! Nao fazer dessa forma
// class ItemRepositoryFake implements IItemRepository {
//   @override
//   Item buscarPorId(int id) {
//     return Item(name: 'Motorola', price: 2000);
//   }

//   @override
//   Future<List<Item>> buscarTodos() async {
//     final items = [
//       Item(name: 'Motorola', price: 2000),
//       Item(name: 'Iphone', price: 2000),
//       Item(name: 'Nokia', price: 2000)
//     ];

//     await Future.delayed(Duration(seconds: 1));

//     return items;
//   }

//   @override
//   List<Item> buscarTodosSync() {
//     final items = [
//       Item(name: 'Motorola', price: 2000),
//       Item(name: 'Iphone', price: 2000),
//       Item(name: 'Nokia', price: 2000)
//     ];
//     return items;
//   }
// }

class ItemRepositoryFake extends Mock implements IItemRepository {}

void main() {
  late IItemRepository iItemRepository;

  setUp(() {
    iItemRepository = ItemRepositoryFake();
  });

  test('Buscar Todos os items', () async {
    when(() => iItemRepository.buscarTodos())
        .thenAnswer((invocation) async => []);
    var service = ItemService(repository: iItemRepository);

    final items = await service.buscarTodos();
    expect(items, <Item>[]);
  });

  test('Buscar Todos os items Exception', () async {
    when(() => iItemRepository.buscarTodos()).thenThrow(Exception());

    var service = ItemService(repository: iItemRepository);

    final call = service.buscarTodos;
    expect(() => call(), throwsException);
  });

  test('Buscar por Id', () async {
    when(() => iItemRepository.buscarPorId(any()))
        .thenReturn(Item(name: 'Item', price: 10));

    var service = ItemService(repository: iItemRepository);

    final item = service.buscarPorId(1);

    verify(() => iItemRepository.buscarPorId(1)).called(1);
    expect(item, isNotNull);
  });
}
