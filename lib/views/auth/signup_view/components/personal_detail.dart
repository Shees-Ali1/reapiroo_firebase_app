import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../../../../const/color.dart';
import '../../../../const/images.dart';
import '../../../../const/text_styles.dart';
import '../../../../controllers/tech_controller.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/custom_input_fields.dart';
import '../../../../widgets/drop_down_widget.dart';
import '../../otp_verification/otp_verification.dart';

class PersonalDetailsForm extends StatefulWidget {
  const PersonalDetailsForm({
    Key? key,
  }) : super(key: key);

  @override
  State<PersonalDetailsForm> createState() => _PersonalDetailsFormState();
}

class _PersonalDetailsFormState extends State<PersonalDetailsForm> {
  final TextEditingController firstname = TextEditingController();
  final TextEditingController lastname = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TechController techController = Get.find();
  String? _imagePath; // Store the image path
  void _showImageSourceDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            "Choose an Option",
            style: jost400(
              16,
              AppColors.primary,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  _pickImage(ImageSource.gallery); // Pick image from gallery
                },
                child:
                    Text('Gallery', style: jost400(14.sp, AppColors.primary)),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  _pickImage(ImageSource.camera); // Take photo with camera
                },
                child: Text('Camera', style: jost400(14.sp, AppColors.primary)),
              ),
            ],
          ),
          backgroundColor: AppColors.secondary,
        );
      },
    );
  }

  /// Function to pick an image
  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
        source: source); // Use pickImage instead of getImage

    if (pickedFile != null) {
      setState(() {
        _imagePath = pickedFile.path; // Update the image path
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              'Enter Your Personal Details here.',
              style: jost600(15.17.sp, Color(0xff6B7280)),
            ),
          ),
          SizedBox(height: 56.h),

          /// First Name and Last Name TextFields
          Center(
            child: GestureDetector(
              onTap: () => _showImageSourceDialog(context),
              child: _imagePath != null
                  ? Container(
                      width: 106.w,
                      height: 106.h,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: FileImage(File(_imagePath!)),
                            fit: BoxFit.cover,
                          ),
                          color: Colors.white,
                          shape: BoxShape.circle),
                    )
                  : Container(
                      width: 106.w,
                      height: 106.h,
                      decoration: BoxDecoration(
                          color: Colors.black, shape: BoxShape.circle),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                              height: 50.h,
                              width: 50.w,
                              child: Image.asset(
                                AppImages.upload_img,
                                color: AppColors.secondary,
                              ))
                        ],
                      ),
                    ),
            ),
          ),
          SizedBox(height: 30.h),

          Row(
            children: [
              Expanded(
                child: CustomInputField(
                  label: 'First Name',
                  controller: firstname,
                  prefixIcon: Icon(
                    Icons.person,
                    color: AppColors.primary,
                    size: 18.sp,
                  ),
                ),
              ),
              SizedBox(width: 19.w),
              Expanded(
                child: CustomInputField(
                  label: 'Last Name',
                  controller: lastname,
                  prefixIcon: Icon(
                    Icons.person,
                    color: AppColors.primary,
                    size: 18.sp,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 25.h),

          /// Email TextField
          CustomInputField(
            controller: email,
            label: 'Your email',
            prefixIcon: Icon(
              Icons.email,
              color: AppColors.primary,
              size: 18.sp,
            ),
          ),
          SizedBox(height: 25.h),
          IntlPhoneField(
            flagsButtonPadding: EdgeInsets.only(left: 13.w),
            cursorColor: Colors.black,
            style: TextStyle(color: Colors.black),
            showDropdownIcon: false,
            decoration: InputDecoration(
              hintText: 'Your phone number',
              filled: true,
              fillColor: Color(0xffFAFAFA),
              contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 14.h),

              counterText: '',
              hintStyle: TextStyle(
                color: Colors.black,
                fontFamily: 'jost',
                fontSize: 14.65.sp,
                fontWeight: FontWeight.w400,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(13.31.r),
                borderSide: BorderSide(color: Color(0xffE2E2E2),width: 0.95),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(13.31.r),
                borderSide: BorderSide(color: Color(0xffE2E2E2),width: 0.95),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(13.31.r),
                borderSide: BorderSide(color: Color(0xffE2E2E2),width: 0.95),
              ),
            ),
            initialCountryCode: 'AE',
            onChanged: (phone) {
              try {
                debugPrint("Phone number entered: ${phone.completeNumber}");
              } catch (e) {
                debugPrint("Error processing phone number: $e");
              }
            },
          ),
          SizedBox(height: 25.h),

          /// Gender Drop Down Field
          GenderDropdownField(
            label: 'Gender',
            iconPath: 'assets/images/gender_icon.png',
            iconHeight: 18.h,
            iconWidth: 18.w,
          ),
          SizedBox(height: 100.h),

          CustomElevatedButton(
            text: 'Next',
            textColor: AppColors.secondary,
            onPressed: () {
              // Button action
              techController.selectedIndex.value = "1";
            },
            backgroundColor: AppColors.primary,
          ),
          SizedBox(height: 25.h),

        ],
      ),
    );
  }
}
