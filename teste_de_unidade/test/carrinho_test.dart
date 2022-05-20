import 'package:test/test.dart';
import 'package:teste_de_unidade/carrinho.dart';
import 'package:teste_de_unidade/item.dart';

void main() {
  group('Testes de calculo de valor total do carrinho ', () {
    test('Deve calcular o valor total do carrinho', () {
      // Preparação
      var items = [
        Item(name: 'Motorola', price: 3000),
        Item(name: 'Iphone', price: 10000),
        Item(name: 'Carregador', price: 200)
      ];

      final carrinho = Carrinho(items: items);

      // Acão ou Execução
      var valorTotalDoCarrinho = carrinho.totalCarrinho();

      // Verificação
      expect(valorTotalDoCarrinho, 13200);
    });
    test('Deve calcular o valor total do carrinho vazio', () {
      // Preparação
      var items = <Item>[];

      final carrinho = Carrinho(items: items);

      // Acão ou Execução
      var valorTotalDoCarrinho = carrinho.totalCarrinho();

      // Verificação
      expect(valorTotalDoCarrinho, 0);
    });
  });

  group('Teste de valor total de carrinho com imposto', () {
    test('Deve calcular valor total do carrinho com imposto 10%', () {
      var items = [
        Item(name: 'Motorola', price: 3000),
        Item(name: 'Iphone', price: 10000),
        Item(name: 'Carregador', price: 200)
      ];

      final carrinho = Carrinho(items: items);

      var valorTotalDoCarrinhoComImposto = carrinho.totalCarrinhoComImposto();

      expect(valorTotalDoCarrinhoComImposto, 14520);
    });

    test('Deve retornar valor sem imposto se for menor que 5000', () {
      var items = [
        Item(name: 'Motorola', price: 1000),
        Item(name: 'Iphone', price: 1000),
        Item(name: 'Carregador', price: 1000)
      ];

      final carrinho = Carrinho(items: items);

      var valorTotalDoCarrinhoComImposto = carrinho.totalCarrinhoComImposto();

      expect(valorTotalDoCarrinhoComImposto, 3000);
    });

    test('Deve retornar valor com imposto se for igual a 5000', () {
      var items = [
        Item(name: 'Motorola', price: 2500),
        Item(name: 'Iphone', price: 2500),
        // Item(name: 'Carregador', price: 1000)
      ];

      final carrinho = Carrinho(items: items);

      var valorTotalDoCarrinhoComImposto = carrinho.totalCarrinhoComImposto();

      expect(valorTotalDoCarrinhoComImposto, 5500);
    });

    test(
        'Deve retornar valor com imposto de 20% se o valor total for maior que 20000',
        () {
      var items = [
        Item(name: 'Motorola', price: 10000),
        Item(name: 'Iphone', price: 11000),
        // Item(name: 'Carregador', price: 1000)
      ];

      final carrinho = Carrinho(items: items);

      var valorTotalDoCarrinhoComImposto = carrinho.totalCarrinhoComImposto();

      expect(valorTotalDoCarrinhoComImposto, 25200);
    });

    test(
        'Deve retornar valor com imposto de 10% se o valor total for igual a 20000',
        () {
      var items = [
        Item(name: 'Motorola', price: 10000),
        Item(name: 'Iphone', price: 10000),
        // Item(name: 'Carregador', price: 1000)
      ];

      final carrinho = Carrinho(items: items);

      var valorTotalDoCarrinhoComImposto = carrinho.totalCarrinhoComImposto();

      expect(valorTotalDoCarrinhoComImposto, 22000);
    });
  });

  group('Teste de igualdade', () {
    test('Teste de igualdade', () {
      var items = [
        Item(name: 'Motorola', price: 3000),
        Item(name: 'Iphone', price: 10000),
        Item(name: 'Carregador', price: 200)
      ];

      final carrinho = Carrinho(items: items);

      expect(
          carrinho.items,
          contains(
            Item(name: 'Motorola', price: 3000),
          ));
    });

    test('Teste de igualdade por quantidade e iguadade por tipos', () {
      var items = [
        Item(name: 'Motorola', price: 3000),
        Item(name: 'Iphone', price: 10000),
        Item(name: 'Carregador', price: 200)
      ];

      final carrinho = Carrinho(items: items);

      expect(
        carrinho.items.length,
        3,
      );

      expect(
        carrinho.items,
        isA<List<Item>>(),
      );
    });

    // test('Teste de igualdade por Excpetion', () {
    //   var items = <Item>[];

    //   final carrinho = Carrinho(items: items);

    //   var call = carrinho.totalCarrinho;

    //   expect(() => call(), throwsException);
    // });

    // test('Teste de igualdade por Excpetion Customizada', () {
    //   var items = <Item>[];

    //   final carrinho = Carrinho(items: items);

    //   var call = carrinho.totalCarrinho;

    //   expect(() => call(), throwsA(isA<CarrinhoException>()));
    // });
  });
}
