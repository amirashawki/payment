import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment/Features/checkout/presentation/views/my_cart_view.dart';
import 'package:payment/core/utils/api_keys.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = ApiKeys.publishableKey;
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

// PaymentIntentModel Create a PaymentIntent ( amount, currency, customerId)
// Create  EphemeralKey (customerId)
// initPaymentSheet (paymentIntentClientSecret,ephemeralKeySecret,customerId)
// presentPaymentSheet ()
