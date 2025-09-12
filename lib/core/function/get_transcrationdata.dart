import 'package:payment/Features/checkout/data/models/amount_model/amount_model.dart';
import 'package:payment/Features/checkout/data/models/amount_model/details.dart';
import 'package:payment/Features/checkout/data/models/item_list_model/item.dart';
import 'package:payment/Features/checkout/data/models/item_list_model/item_list_model.dart';

({AmountModel amount, ItemListModel itemlist}) getTranscrionsData() {
  var amount = AmountModel(
    total: '70',
    currency: 'USD',
    details: Details(subtotal: '70', shipping: '0', shippingDiscount: 0),
  );
  List<Item> items = [
    Item(name: "Apple", quantity: 4, price: '5', currency: "USD"),
    Item(name: "Pineapple", quantity: 5, price: '10', currency: "USD"),
  ];
  var itemsListModel = ItemListModel(items: items);
  return (amount: amount, itemlist: itemsListModel);
}
