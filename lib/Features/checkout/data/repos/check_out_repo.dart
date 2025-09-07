import 'package:dartz/dartz.dart';
import 'package:payment/Features/checkout/data/models/payment_intent_input_model.dart';
import 'package:payment/core/errors/failure.dart';

abstract class CheckOutRepo {
  Future<Either<Failure, void>> makePayment(
    PaymentIntentInputModel paymentIntentInputModel,
  );
}
