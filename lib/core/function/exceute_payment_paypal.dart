import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:payment/Features/checkout/presentation/views/my_cart_view.dart';
import 'package:payment/Features/checkout/presentation/views/thank_you_view.dart';
import 'package:payment/core/function/get_transcrationdata.dart';
import 'package:payment/core/utils/api_keys.dart';

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
          log("onSuccess: $params");
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const ThankYouView()),

            (route) {
              if (route.settings.name == '/') {
                return true;
              }
              return false;
            },
          );
        },
        onError: (error) {
          log("onError: $error");
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(error.toString()),
              duration: Duration(seconds: 1000),
            ),
          );
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const MyCartView()),

            (route) {
              return false;
            },
          );
        },
        onCancel: () {
          log('cancelled:');
        },
      ),
    ),
  );
}
