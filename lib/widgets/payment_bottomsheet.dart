import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:repairoo/const/color.dart';
import 'package:repairoo/const/images.dart';
import 'package:repairoo/const/text_styles.dart';
import 'package:repairoo/widgets/custom_button.dart';
import 'package:repairoo/widgets/custom_input_fields.dart';
import 'package:repairoo/widgets/promo_bottomsheet.dart';

class PaymentBottomsheet extends StatefulWidget {
  const PaymentBottomsheet({super.key, required this.price, });

  final String price;

  @override
  State<PaymentBottomsheet> createState() => _PaymentBottomsheetState();
}

class _PaymentBottomsheetState extends State<PaymentBottomsheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40.w),
          topRight: Radius.circular(40.w),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 26.h,),
            Container(
              padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 50.w),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(12.w),
              ),
              child: Column(
                children: [
                  SizedBox(height: 12.h,),
                  Text(
                    "79.00",
                    style: GoogleFonts.inter(
                      fontSize: 38.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.secondary
                    ),
                  ),
                  Text(
                    "AED",
                    style: GoogleFonts.inter(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.secondary
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30.h,),
            Align(
              alignment: Alignment.center,
              child: Text("Select payment Method.", style: jost600(16.sp, AppColors.primary), textAlign: TextAlign.center,),
            ),
            SizedBox(height: 50.h,),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(bottom: 12.h),
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 18),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(12.w), // Rounded corners
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(AppImages.white_wallet, width: 21.w, height: 17.h,),
                  SizedBox(width: 80.w), // Space between icon and text
                  Text(
                    'Pay via Wallet',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16, // Adjust size as per need
                    ),
                  ),
                  Expanded(child: SizedBox()),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(bottom: 12.h),
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 18),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(12.w), // Rounded corners
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,                children: [
                  Image.asset(AppImages.card, width: 28.w, height: 19.h,),
                SizedBox(width: 76.w),// Space between icon and text
                  Text(
                    'Pay via Card',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16, // Adjust size as per need
                    ),
                  ),
                Expanded(child: SizedBox()),

              ],
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(bottom: 49.h),
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 18),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(12.w), // Rounded corners
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(AppImages.apple_pay, width: 43.w, height: 43.h,),
                  SizedBox(width: 55.w), // Space between icon and text
                  Text(
                    '   Apple Pay',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16, // Adjust size as per need
                    ),
                  ),
                  Expanded(child: SizedBox()),

                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.back();
                Get.bottomSheet(
                    isScrollControlled: true,
                    isDismissible: true,
                    enableDrag: true,
                    PromoBottomsheet()
                );
              },
              child: Text("Use a promo Code", style: GoogleFonts.jost(
                fontSize: 19.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.primary,
                decoration: TextDecoration.underline,
              ), ),
            ),
            SizedBox(height: 29.h,),
          ],
        ),
      ),
    );
  }
}
