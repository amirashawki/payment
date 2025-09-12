import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment/Features/checkout/presentation/manger/cubit/payment_cubit.dart';
import 'package:payment/Features/checkout/presentation/views/thank_you_view.dart';
import 'package:payment/core/function/exceute_payment_Stripe.dart';
import 'package:payment/core/function/exceute_payment_paypal.dart';
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
          log(state.errorMessage);
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
            if (isPaypal == false) {
              exceutePaymentStripe(context);
            } else {
              exceutepaymentPaypal(context);
            }
          },
          text: 'Continue',
        );
      },
    );
  }
}
