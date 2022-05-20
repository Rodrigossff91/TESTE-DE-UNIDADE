import 'package:teste_de_unidade/item.dart';

class Carrinho {
  List<Item> items;
  Carrinho({
    required this.items,
  });

  double totalCarrinho() {
    var total = 0.0;

    // items.forEach((element) {
    //   total += element.price;
    // });

    // if (items.isEmpty) {
    //   throw CarrinhoException();
    // }

    return items.fold(0, (totalValue, item) => totalValue += item.price);
  }

  double totalCarrinhoComImposto() {
    var valorTotal = totalCarrinho();
    var imposto = 0.10;

    if (valorTotal < 5000) return valorTotal;
    if (valorTotal > 20000) imposto = 0.20;

    return valorTotal += (valorTotal * imposto);
  }
}

class CarrinhoException implements Exception {}
