import 'package:flutter/material.dart';
import 'package:flutter_api_getx_matjer/logic/controller/auth_controller.dart';
import 'package:flutter_api_getx_matjer/logic/controller/payment_controller.dart';
import 'package:flutter_api_getx_matjer/routes/routes.dart';
import 'package:flutter_api_getx_matjer/utils/them.dart';
import 'package:flutter_api_getx_matjer/view/widget/text_utils.dart';
import 'package:get/get.dart';

class DeliverContinerWidget extends StatefulWidget {
  const DeliverContinerWidget({super.key});

  @override
  State<DeliverContinerWidget> createState() => _DeliverContinerWidgetState();
}

class _DeliverContinerWidgetState extends State<DeliverContinerWidget> {
  final TextEditingController phoneController = TextEditingController();
  final controller = Get.find<PaymentController>();
  final authController = Get.find<AuthController>();
  int radioContinerIndex = 1;
  bool changeColors = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildRadioContiner(
            name: authController.displyUserName.value,
            title: "Suiko shop",
            phone: "218+91-9412446",
            address: "Libay Masrutue",
            icon: Container(),
            value: 1,
            color: changeColors ? Colors.white : Colors.grey.shade400,
            onChenged: (int? value) {
              setState(() {
                radioContinerIndex = value!;
                changeColors = !changeColors;
              });
            }),
        SizedBox(
          height: 10,
        ),
        Obx(
          () => buildRadioContiner(
              name: authController.displyUserName.value,
              title: "Delivery",
              phone: controller.phoneNumber.value,
              address: controller.address.value,
              value: 2,
              color: changeColors ? Colors.grey.shade400 : Colors.white,
              icon: InkWell(
                onTap: () {
                  Get.defaultDialog(
                    title: "Enter Your Phon Number",
                    titleStyle: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    backgroundColor: Colors.white,
                    radius: 20,
                    textCancel: "Cancel",
                    cancelTextColor: Colors.black,
                    textConfirm: "Save",
                    confirmTextColor: Colors.black,
                    onCancel: () {
                      Get.toNamed(Routes.payMentSecreen);
                    },
                    onConfirm: () {
                      controller.phoneNumber.value = phoneController.text;
                      Get.back();
                    },
                    buttonColor: Get.isDarkMode ? pinkClr : mainColor,
                    content: Padding(
                      padding: EdgeInsets.all(15),
                      child: TextField(
                        controller: phoneController,
                        cursorColor: Colors.black,
                        keyboardType: TextInputType.number,
                        onSubmitted: (value) {
                          phoneController.text = value;
                        },
                        maxLength: 16,
                        decoration: InputDecoration(
                          fillColor: Get.isDarkMode
                              ? pinkClr.withOpacity(0.2)
                              : mainColor.withOpacity(0.2),
                          focusColor: Colors.red,
                          prefixIcon: Icon(
                            Icons.phone,
                            color: Get.isDarkMode ? pinkClr : mainColor,
                          ),
                          hintText: "Enter Your Phone Number",
                          hintStyle: TextStyle(
                            color: Colors.black45,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              phoneController.clear();
                            },
                            icon: Icon(
                              Icons.close,
                              color: Colors.black,
                            ),
                          ),
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(13)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(13)),
                          errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(13)),
                          focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(13)),
                        ),
                      ),
                    ),
                  );
                },
                child: Icon(
                  Icons.contact_phone,
                  color: Get.isDarkMode ? pinkClr : mainColor,
                  size: 22,
                ),
              ),
              onChenged: (int? value) {
                setState(() {
                  radioContinerIndex = value!;
                  changeColors = !changeColors;
                });
                controller.updatePosition();
              }),
        ),
      ],
    );
  }

  Widget buildRadioContiner(
      {required Color color,
      required int value,
      required Function onChenged,
      required String name,
      required String title,
      required String phone,
      required String address,
      required Widget icon}) {
    return Container(
      height: 120,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: color,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(
              0.2,
            ),
            spreadRadius: 3.0,
            blurRadius: 5.0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Radio(
            value: value,
            groupValue: radioContinerIndex,
            onChanged: (int? value) {
              onChenged(value);
            },
          ),
          SizedBox(
            width: 10,
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextUtils(
                  text: title,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                const SizedBox(
                  height: 5,
                ),
                TextUtils(
                  text: name,
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text("🇱🇾  "),
                    TextUtils(
                      text: phone,
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),
                    const SizedBox(
                      width: 120,
                    ),
                    SizedBox(
                      child: icon,
                    )
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                TextUtils(
                  text: address,
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
