import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:payment/Features/checkout/data/models/amount_model/amount_model.dart';
import 'package:payment/Features/checkout/data/models/amount_model/details.dart';
import 'package:payment/Features/checkout/data/models/item_list_model/item.dart';
import 'package:payment/Features/checkout/data/models/item_list_model/item_list_model.dart';
import 'package:payment/Features/checkout/presentation/manger/cubit/payment_cubit.dart';
import 'package:payment/Features/checkout/presentation/views/thank_you_view.dart';
import 'package:payment/core/utils/api_keys.dart';
import 'package:payment/core/widgets/custom_button.dart';

class CustomButtonBlocConsumer extends StatelessWidget {
  const CustomButtonBlocConsumer({super.key, required this.isPaypal});

  final bool isPaypal;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if (state is PaymentSuccess) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const ThankYouView()),
          );
        } else if (state is PaymentFailure) {
          Navigator.pop(context);
          print(state.errorMessage);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
              duration: Duration(seconds: 1000),
            ),
          );
        }
      },
      builder: (context, state) {
        return CustomButton(
          isLoading: state is PaymentLoading ? true : false,
          onTap: () {
            // PaymentIntentInputModel paymentIntentInputModel =
            //     PaymentIntentInputModel(
            //       amount: '1000',
            //       currency: 'USD',
            //       customerId: 'cus_T0oYLeECeHFea1',
            //     );
            // BlocProvider.of<PaymentCubit>(
            //   context,
            // ).makePayment(paymentIntentInputModel: paymentIntentInputModel);

            exceutepaymentPaypal(context);
          },
          text: 'Continue',
        );
      },
    );
  }

  void exceutepaymentPaypal(BuildContext context) {
    var transcrionsData = getTranscrionsData();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => PaypalCheckoutView(
          sandboxMode: true,
          clientId: ApiKeys.clientId,
          secretKey: ApiKeys.secretKeyPaypal,
          transactions: [
            {
              "amount": transcrionsData.amount.toJson(),
              "description": "The payment transaction description.",
              "item_list": transcrionsData.itemlist.toJson(),
            },
          ],
          note: "Contact us for any questions on your order.",
          onSuccess: (Map params) async {
            print("onSuccess: $params");
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const ThankYouView()),
            );
          },
          onError: (error) {
            print("onError: $error");
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(error.toString()),
                duration: Duration(seconds: 1000),
              ),
            );
          },
          onCancel: () {
            print('cancelled:');
          },
        ),
      ),
    );
  }
}

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
