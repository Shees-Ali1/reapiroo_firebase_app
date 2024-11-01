import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:repairoo/const/color.dart';
import 'package:repairoo/const/images.dart';
import 'package:repairoo/const/text_styles.dart';
import 'package:repairoo/views/bottom_nav/bottom_nav.dart';
import 'package:repairoo/widgets/custom_button.dart';

class PendingApproval extends StatelessWidget {
  const PendingApproval({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'Pending Approval',
                style: jost600(32.sp, Color(0xff6B7280)),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Text(
              textAlign: TextAlign.center,
              'Thank you for registering with Repairoo. A member of the team will approve your request shortly.',
              style: jost400(20.sp, Color(0xff656F77)),
            ),
            SizedBox(
              height: 80.h,
            ),
            Image.asset(AppImages.logo),
            SizedBox(
              height: 142.h,
            ),
            CustomElevatedButton(
              text: 'Go Home',
              textColor: AppColors.secondary,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AppNavBar(),
                  ),
                );
              },
              backgroundColor: AppColors.primary,
            ),
          ],
        ),
      ),
    );
  }
}
