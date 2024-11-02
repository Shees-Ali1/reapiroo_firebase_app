import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:repairoo/const/color.dart';
import 'package:repairoo/controllers/signup_controller.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double? width; // Optional width
  final double? height; // Optional height
  final double? fontSize; // Optional height
  final Color? backgroundColor; // Optional background color
  final double? borderRadius; // Optional background color
  final Color? textColor; // Optional text color
  final BorderSide? borderSide; // Optional border side

  CustomElevatedButton({
    required this.text,
    required this.onPressed,
    this.width, // Add width
    this.height, // Add height
    this.backgroundColor, // Add background color
    this.textColor, // Add text color
    this.borderSide,
    this.fontSize,
    this.borderRadius, // Add border side
  });

  @override
  Widget build(BuildContext context) {
    final SignupController signupController = Get.find<SignupController>();

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ??
            AppColors.primary, // Use backgroundColor or default color
        shape: RoundedRectangleBorder(
          side: borderSide ??
              BorderSide(
                  color: Colors.black, width: 1), // Use borderSide or default
          borderRadius:
          BorderRadius.circular(borderRadius ?? 13.31.r), // Border radius
        ),
        minimumSize: Size(width ?? double.infinity,
            height ?? 51.h), // Use width and height or default values
      ),
      child: Obx(() {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 16.h),
          child: signupController.isLoading.value
              ? CircularProgressIndicator(
            color: Colors.white,
          )
              : Text(
            text,
            style: GoogleFonts.jost(
              fontWeight: FontWeight.w500,
              color: textColor ??
                  AppColors
                      .buttontext, // Use textColor or default text color
              fontSize: fontSize ?? 19.sp, // Text size
            ),
          ),
        );
      }),
    );
  }
}
