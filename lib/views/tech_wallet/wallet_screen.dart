import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:repairoo/const/text_styles.dart';
import 'package:repairoo/views/tech_wallet/wallet_detail.dart';

// import 'package:repairoo/views/tech_wallet/wallet_detail.dart';
import 'package:repairoo/widgets/custom_input_fields.dart';

import '../../const/color.dart';
import '../../widgets/app_bars.dart';

class Wallet extends StatefulWidget {
  Wallet({super.key});

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  final TextEditingController bankName = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController iban = TextEditingController();
  final TextEditingController acc_number = TextEditingController();
  String? selectedBank;
  final List<Map<String, String>> banks = [
    {'name': 'ADCB', 'image': 'assets/images/bank.png'},
    {'name': 'HSBC', 'image': 'assets/images/hsbc.png'},
    {'name': 'DIB', 'image': 'assets/images/duabi_islamic.jpg'},
    {'name': 'Standard Chartered', 'image': 'assets/images/standard_charter.png'},
    {'name': 'CBD', 'image': 'assets/images/standard_charter.png'},
  ];


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus(); // Close the keyboard when tapping outside
      },
      child: Scaffold(
        appBar: MyAppBar(
          isMenu: false,
          isNotification: false,
          isTitle: true,
          title: 'Wallet',
          isSecondIcon: false,
          onBackTap: () {
            Get.back();
          },
        ),
        backgroundColor: AppColors.secondary,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 120.h,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 0.h),
                  // height: 356.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(13.31.r)),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 13.0.h),
                          child: Text(
                            'Add Bank Account',
                            style: jost600(19.sp, AppColors.secondary),
                          ),
                        ),
                        SizedBox(
                          height: 26.h,
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: 40.h,
                              child: DropdownButtonFormField<String>(
                                value: selectedBank,
                                hint: Text(
                                  "Bank Name",
                                  style: jost400(14.65.sp, AppColors.primary),
                                ),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: AppColors.secondary,
                                  contentPadding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(13.0.r),
                                  ),
                                ),
                                icon: Icon(
                                  Icons.keyboard_arrow_down_sharp,
                                  color: Colors.black, // Set the dropdown icon color to black
                                ),
                                items: banks.map((bank) {
                                  return DropdownMenuItem<String>(
                                    value: bank['name'],
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          bank['image']!,
                                          width: 24.w,
                                          height: 24.h,
                                        ),
                                        SizedBox(width: 10.w),
                                        Text(bank['name']!),
                                      ],
                                    ),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    selectedBank = value;
                                  });
                                },
                              ),
                            ),

                            SizedBox(
                              height: 11.h,
                            ),
                            SizedBox(
                                height: 40.h,
                                child: CustomInputField(
                                  controller: name,
                                  hintText: "Full Name",
                                  contentPadding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 12.w),
                                )),
                            SizedBox(
                              height: 11.h,
                            ),
                            SizedBox(
                                height: 40.h,
                                child: CustomInputField(
                                  controller: iban,
                                  hintText: "IBAN",
                                  contentPadding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 12.w
                                  ),
                                )),
                            SizedBox(
                              height: 11.h,
                            ),
                            SizedBox(
                                height: 40.h,
                                child: CustomInputField(
                                  controller: acc_number,
                                  contentPadding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 12.w),

                                  hintText: "Account Number",


                                )),
                            SizedBox(
                              height: 26.h,
                            ),
                          ],
                        ),

                        GestureDetector(
                          onTap: () {
                            final selectedBankData = banks.firstWhere(
                                  (bank) => bank['name'] == selectedBank,
                              orElse: () => {'name': '', 'image': ''},
                            );
                            Get.to(WalletDetail(
                              name: name.text,
                              iban: iban.text,
                              bankName: selectedBankData['name']?? "Aljazeera",
                              bankImage: selectedBankData['image']??"assets/images/bank.png",
                              accNumber: acc_number.text,));
                          },
                          child: Container(
                            height: 51.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(13.31.r),
                                color: AppColors.secondary),
                            child: Center(
                                child: Text(
                                  "Add",
                                  style: jost600(19.sp, AppColors.primary),
                                )),
                          ),
                        ),
                        SizedBox(
                          height: 27.h,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}