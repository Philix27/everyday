import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:everyday/controller/payment_controller.dart';
import 'package:everyday/core/global_variables.dart';
import 'package:everyday/core/theme/styles.dart';
import 'package:everyday/models/invoice.dart';
import 'package:everyday/view/subscription/logo.dart';
import 'package:everyday/view/subscription/variables.dart';
import 'package:everyday/view/widgets/loading.dart';
import 'package:everyday/view/widgets/widgets.dart';

class SubscriptionPage extends StatefulWidget {
  const SubscriptionPage({Key? key}) : super(key: key);

  @override
  State<SubscriptionPage> createState() => _SubscriptionPageState();
}

class _SubscriptionPageState extends State<SubscriptionPage> {
  final ScrollController controller = ScrollController();

  final pay = PaymentController();

  // final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  final plugin = PaystackPlugin();

  bool _inProgress = false;

  @override
  void initState() {
    plugin.initialize(publicKey: paystackPublicKey);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Subscriptions',
          style: Styles.headlineText2!.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        controller: controller,
        child: Column(
          children: [
            FutureBuilder(
              future: MyGlobals.pricing.get(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) return Loading.spinKitFadingCircle();
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (BuildContext context, int index) {
                      final DocumentSnapshot postDoc =
                          snapshot.data!.docs[index];
                      final Invoice invoice = Invoice.fromMap(
                          postDoc.data() as Map<String, dynamic>);
                      return priceCard(context, () {
                        _handleCheckout(context, invoice.price);
                      }, invoice);
                    });
              },
            ),
          ],
        ),
      ),
    );
  }

  _handleCheckout(BuildContext context, int amount) async {
    setState(() => _inProgress = true);
    _formKey.currentState?.save();
    Charge charge = Charge()
      ..amount = int.parse("${amount}00") // In base currency
      ..accessCode = DateTime.now().millisecondsSinceEpoch.toString()
      ..email = 'customer@email.com';

    try {
      CheckoutResponse response = await plugin.checkout(
        context,
        method: CheckoutMethod.card,
        charge: charge,
        fullscreen: false,
        logo: MyLogo(),
      );
      print('Response = $response');
      setState(() => _inProgress = false);
      MyWidgets.snackbar(
        title: 'Reference: ${response.reference} ',
        message: "$response",
      );
    } catch (e) {
      setState(() => _inProgress = false);
      MyWidgets.errorSnackbar(
        title: "Check console for error",
      );

      rethrow;
    }
  }
}

Widget priceCard(
  BuildContext context,
  VoidCallback onTap,
  Invoice invoice,
) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: InkWell(
      onTap: onTap,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Text(
                MyGlobals.moneyFormater(invoice.price),
                style:
                    Styles.headlineText2!.copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 15),
              Text(
                "Videos",
                style: Styles.bodyText1!.copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 15),
              Text(
                "Access to all video lectures",
                style: Styles.bodyText2,
              ),
              const SizedBox(height: 15),
              Text(
                "Notes",
                style: Styles.bodyText1!.copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 15),
              Text(
                "Read and save notes to local storage",
                style: Styles.bodyText2,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
