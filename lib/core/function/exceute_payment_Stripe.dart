import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment/Features/checkout/data/models/payment_intent_input_model.dart';
import 'package:payment/Features/checkout/presentation/manger/cubit/payment_cubit.dart';

void exceutePaymentStripe(BuildContext context) {
  PaymentIntentInputModel paymentIntentInputModel = PaymentIntentInputModel(
    amount: '1000',
    currency: 'USD',
    customerId: 'cus_T0oYLeECeHFea1',
  );
  BlocProvider.of<PaymentCubit>(
    context,
  ).makePayment(paymentIntentInputModel: paymentIntentInputModel);
}
