import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:payment/core/widgets/custom_button.dart';

class CustomButtonBlocConsumer extends StatelessWidget {
  const CustomButtonBlocConsumer({super.key, required this.isPaypal});

  final bool isPaypal;
  @override
  Widget build(BuildContext context) {
    return CustomButton(onTap: () {}, text: 'Continue');
  }
}
