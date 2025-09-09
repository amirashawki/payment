class InitPaymentSheetInputModel {
  final String customerId;
  final String ephemeralKey;
  final String clientSecret;

  const InitPaymentSheetInputModel({
    required this.customerId,
    required this.ephemeralKey,
    required this.clientSecret,
  });
}
