// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';
// // import 'package:url_launcher/url_launcher.dart';
// import 'paymob_controller.dart';

// class PayHomeScreen extends StatelessWidget {
//   const PayHomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: true,
//       appBar: AppBar(
//         title: const Text("Paymob Integration"),
//       ),
//       body: const Center(),
//     );
//   }

//   Future<void> pay(price) async {
//     PaymobController().getPaymentKey(price, "EGP").then(
//       (String paymentKey) {
//         launchUrl(
//           Uri.parse(
//               "https://accept.paymob.com/api/acceptance/iframes/826182?payment_token=$paymentKey"),
//         );
//       },
//     );
//   }
// }
