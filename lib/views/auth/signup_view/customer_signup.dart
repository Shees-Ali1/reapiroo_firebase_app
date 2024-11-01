import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:repairoo/views/bottom_nav/bottom_nav.dart';

import '../../../const/color.dart';
import '../../../const/images.dart';
import '../../../const/text_styles.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_input_fields.dart';
import '../../../widgets/drop_down_widget.dart';

class CustomerSignup extends StatefulWidget {
  const CustomerSignup({super.key});

  @override
  State<CustomerSignup> createState() => _CustomerSignupState();
}

class _CustomerSignupState extends State<CustomerSignup> {
  final TextEditingController firstname = TextEditingController();
  final TextEditingController email = TextEditingController();
  String? selectedGender;
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
    return GestureDetector(
      onTap: () {
        FocusScope.of(context)
            .unfocus(); // Close the keyboard when tapping outside
      },
      child: Scaffold(
        backgroundColor: AppColors.secondary,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(AppImages.onboardingelipse2),
                        fit: BoxFit.fill)),
                child: Column(

                  children: [
                    SizedBox(
                      height: 100.h,
                    ),
                    SizedBox(
                      height: 85.h,
                      width: 267.w,
                      child: Image.asset(
                        color: Colors.white,
                        AppImages.logo,
                      ),
                    ),
                    SizedBox(height: 40.h),
                    Text(
                      'Sign up',
                      style: jost700(35.sp, AppColors.secondary),
                    ),
                    SizedBox(height: 30.h),
                    GestureDetector(
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
                                  color: Colors.white, shape: BoxShape.circle),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                      height: 50.h,
                                      width: 50.w,
                                      child: Image.asset(AppImages.upload_img,color: AppColors.primary,))
                                ],
                              ),
                            ),
                    ),
                    SizedBox(height: 30.h),
                  ],
                ),
              ),
              SizedBox(height: 48.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: CustomInputField(
                  label: 'Full name',
                  controller: firstname,
                  prefixIcon: Icon(
                    Icons.person,
                    color: AppColors.primary,
                    size: 18.sp,
                  ), // Add prefix icon here
                ),
              ),
              SizedBox(height: 16.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: CustomInputField(
                  label: 'Your email',
                  controller: email,
                  prefixIcon: Icon(
                    Icons.email_rounded,
                    color: AppColors.primary,
                    size: 18.sp,
                  ), // Add prefix icon here
                ),
              ),
              SizedBox(height: 16.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: GenderDropdownField(
                  label: 'Gender',
                  iconPath:
                      'assets/images/gender_icon.png', // Specify the image asset path
                  iconHeight: 18.h, // Set your desired height
                  iconWidth: 18.w, // Set your desired width
                ),
              ),
              SizedBox(
                height: 33.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: CustomElevatedButton(
                  // borderSide: BorderSide(color: Color(0xffBDD0EA),width: 1),
                  text: 'Continue',
                  textColor: AppColors.secondary,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return AppNavBar(); // Replace with your desired screen/widget
                        },
                      ),
                    );
                  },
                  backgroundColor: AppColors.primary, // Custom background color
                ),
              ),
              SizedBox(
                height: 14.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.w),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'By signing up you agree to our ',
                        style: jost400(14.sp, AppColors.primary),
                      ),
                      TextSpan(
                        text: 'Terms of Services',
                        style: jost500(14.sp, AppColors.primary),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // Navigate to Terms of Services
                            // Example: Navigator.push(context, MaterialPageRoute(builder: (context) => TermsPage()));
                          },
                      ),
                      TextSpan(
                        text: ' and ',
                        style: jost400(14.sp, AppColors.primary),
                      ),
                      TextSpan(
                        text: 'Privacy Policy',
                        style: jost500(14.sp, AppColors.primary),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // Navigate to Privacy Policy
                            // Example: Navigator.push(context, MaterialPageRoute(builder: (context) => PrivacyPolicyPage()));
                          },
                      ),
                      TextSpan(
                        text: '.',
                        style: jost400(14.sp, AppColors.primary),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
