import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:payment/Features/checkout/presentation/views/my_cart_view.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) {
        return const MyApp();
      },
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: MyCartView());
  }
}

//   Create a Payment Intent (amount, currency)
//  init Payment Sheet(paymentIntentClientSecret)
//  presentPaymentSheet()
