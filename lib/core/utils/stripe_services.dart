import 'package:payment/Features/checkout/data/models/payment_intent_input_model.dart';
import 'package:payment/Features/checkout/data/models/payment_intent_model/payment_intent_model.dart';
import 'package:payment/core/utils/api_keys.dart';
import 'package:payment/core/utils/api_services.dart';

class StripeServices {
  //   Create a Payment Intent (amount, currency)
  //  init Payment Sheet(paymentIntentClientSecret)
  //  presentPaymentSheet()
  Future<PaymentIntentModel> createPaymentIntent(
    PaymentIntentInputModel paymentIntentInputModel,
  ) async {
    var response = await ApiServices().post(
      url: 'https://api.stripe.com/v1/payment_intents',
      body: PaymentIntentModel().toJson(),
      token: ApiKeys.secretKey,
    );
    var paymentIntentModel = PaymentIntentModel.fromJson(response);
    return paymentIntentModel;

  }
}
