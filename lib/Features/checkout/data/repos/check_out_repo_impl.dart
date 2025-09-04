import 'package:dartz/dartz.dart';
import 'package:payment/Features/checkout/data/models/payment_intent_input_model.dart';
import 'package:payment/Features/checkout/data/repos/check_out_repo.dart';
import 'package:payment/core/errors/failure.dart';
import 'package:payment/core/utils/stripe_services.dart';

class CheckOutRepoImpl implements CheckOutRepo {
  @override
  Future<Either<Failure, void>> makePayment(
    PaymentIntentInputModel paymentIntentInputModel,
  ) async {
    try {
  await StripeServices().makePayment(
    paymentIntentInputModel: paymentIntentInputModel,
  );
  return  Right(null);
}  catch (e) {
  return Left(ServerFailure(e.toString()));
}
  }
}
