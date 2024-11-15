import 'package:flutter/material.dart';
import 'package:flutter_api_getx_matjer/utils/them.dart';
import 'package:flutter_api_getx_matjer/view/widget/text_utils.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({super.key});

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  int radioPaymentIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 15,
        right: 15,
      ),
      child: Column(
        children: [
          buildRadiopayment(
              name: "Paypal",
              image: "2.1 images/images/paypal.png",
              scale: 0.7,
              value: 1,
              onChange: (int? value) {
                setState(() {
                  radioPaymentIndex = value!;
                });
              }),
          const SizedBox(
            height: 10,
          ),
          buildRadiopayment(
              name: "Google Pay",
              image: "2.1 images/images/google.png",
              scale: 0.9,
              value: 2,
              onChange: (int? value) {
                setState(() {
                  radioPaymentIndex = value!;
                });
              }),
          const SizedBox(
            height: 10,
          ),
          buildRadiopayment(
              name: "Credit Card",
              image: "2.1 images/images/credit.png",
              scale: 0.6,
              value: 3,
              onChange: (int? value) {
                setState(() {
                  radioPaymentIndex = value!;
                });
              }),
        ],
      ),
    );
  }

  Widget buildRadiopayment({
    required String image,
    required double scale,
    required String name,
    required int value,
    required Function onChange,
  }) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.grey.shade300,
      ),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  image,
                  scale: scale,
                ),
                const SizedBox(
                  width: 10,
                ),
                TextUtils(
                  text: name,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ],
            ),
          ),
          Radio(
            value: value,
            fillColor: MaterialStateColor.resolveWith((states) => mainColor),
            groupValue: radioPaymentIndex,
            onChanged: (int? value) {
              onChange(value);
            },
          )
        ],
      ),
    );
  }
}
