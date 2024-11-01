import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:repairoo/const/color.dart';
import 'package:repairoo/const/images.dart';
import 'package:repairoo/controllers/tech_controller.dart';
import '../../../../const/text_styles.dart';
import '../../../../widgets/custom_button.dart';
import 'details_screen.dart';

class ServicesScreen extends StatefulWidget {
  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  String? selectedService; // Change to nullable string for proper RadioListTile
  final TechController techController = Get.find();

  // List of services to display
  final List<String> services = [
    'Help Moving',
    'Plumbing Services',
    'Electrical Services',
    'Cleaning Services',

  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Select Your Service.',
          style: jost600(15.17.sp, Color(0xff6B7280)),
        ),
        SizedBox(height: 30.h),
        Expanded(
          /// Use Expanded to fill available space
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: services.length,
            itemBuilder: (context, index) {
              return Container(
                width: double.infinity,
                height: 91.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: AppColors.secondary,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3), // Shadow color with opacity
                      blurRadius: 12.0, // Softness of the shadow
                      offset: Offset(0, 4), // Horizontal and vertical offset of the shadow
                    ),
                  ],
                ),
                margin: EdgeInsets.symmetric(vertical: 8.h), // Add margin between items
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        AppImages.role1,
                        height: 73.h,
                        width: 110.w,
                      ), // You may want to change this based on service
                      SizedBox(width: 16.w),
                      Expanded(
                        child: Text(
                          services[index], // Display service name
                          style: jost700(16.sp, AppColors.primary),
                        ),
                      ),
                  Transform.scale(
                    scale: 1.5, // Adjust this value to increase or decrease the size
                    child: Radio<String>(
                      value: services[index],
                      groupValue: selectedService,
                      onChanged: (String? value) {
                        setState(() {
                          selectedService = value; // Update selected service
                        });
                      },
                      activeColor: AppColors.primary, // Set your active color for selected state
                      fillColor: MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                          if (states.contains(MaterialState.selected)) {
                            return AppColors.primary; // Use active color when selected
                          }
                          return AppColors.outline; // Use red color when unselected
                        },
                      ),
                    ),
                  ),

                  ],
                  ),
                ),
              );

            },
          ),
        ),
        // SizedBox(height: 10.h),

        CustomElevatedButton(
          text: 'Next',
          textColor: AppColors.secondary,
          onPressed: () {
            // Button action
            techController.selectedIndex.value = "2";

          },
          backgroundColor: AppColors.primary,
        ),
        SizedBox(height: 30.h),
      ],
    );
  }
}