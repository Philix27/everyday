import 'package:flutter/material.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:get/get.dart';
import 'package:everyday/view/widgets/widgets.dart';

class PaymentController extends GetxController {
  static String publicKey = "pk_live_bcddf6973cdcbd5811ae519ab726adb9cce4091f";
  Rx<bool> _isPaymentSuccessful = Rx(false);
  Rx<bool> get isPaymentSuccessful => _isPaymentSuccessful;

  final plugin = PaystackPlugin();

  @override
  void onInit() {
    plugin.initialize(publicKey: publicKey);
    super.onInit();
  }

  // ignore: non_constant_identifier_names
  Future<void> takePayment(
    BuildContext context, {
    required String email,
    required String displayName,
    required String userId,
    required int amount,
  }) async {
    final Map<String, dynamic> paymentDetails = {
      'userID': userId,
      'email': email,
      'userName': displayName,
      'paymentPurpose': "everyday Subscription",
      'amountToPay': int.parse("${amount}00"),
    };

    Charge charge = Charge()
      ..amount = int.parse("${amount}00")
      ..email = email
      ..putMetaData(userId, paymentDetails)
      ..reference = DateTime.now().toString();
    // or ..accessCode = _getAccessCodeFrmInitialization()
    CheckoutResponse response = await plugin.checkout(
      context,
      method: CheckoutMethod.card, // Defaults to CheckoutMethod.selectable
      charge: charge,
    );

    //? On successfuk Payment
    if (response.status) {
      _isPaymentSuccessful.value = true;
      // ignore: todo
      // TODO: post subscription duration to db
      // ignore: todo
      // TODO: current dateTime + 6 months/1year

    } else {
      _isPaymentSuccessful.value = false;
      MyWidgets.errorSnackbar(title: 'Failed: Payment not successful');
    }
  }

  @override
  void onClose() {
    _isPaymentSuccessful = Rx(false);
  }
}
