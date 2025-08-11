import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:payment/core/utils/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onTap,
    required this.text,
    this.isLoading = false,
  });

  final void Function()? onTap;

  final String text;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: ShapeDecoration(
          color: const Color(0xFF34A853),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 20),
          child: Center(
            child: isLoading
                ? const CircularProgressIndicator()
                : Text(
                    text,
                    textAlign: TextAlign.center,
                    style: Styles.style22,
                  ),
          ),
        ),
      ),
    );
  }
}
