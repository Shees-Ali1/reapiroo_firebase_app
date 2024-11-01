import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:repairoo/const/color.dart';
import 'package:repairoo/const/images.dart';

import '../const/svg_icons.dart';
import 'custom_text.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 32.h,
            ),
            Row(
              children: [
                SizedBox(
                  width: 28.w,
                ),
             Container(
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image:AssetImage(AppImages.profileicon),
                            fit: BoxFit.cover)),
                    height: 76.h,
                    width: 76.w,
                  ),

                SizedBox(
                  width: 25.w,
                ),
                SizedBox(
                  width: 140.w,
                  child: LexendCustomText(
                      text:'',
                      fontWeight: FontWeight.w400,
                      fontsize: 20.sp,
                      textColor: AppColors.primary,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    )

                ),
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            DrawerItemsWidget(
              text: 'Edit Profile',
              image: AppSvgs.profile,
              onTap: () {
                // CustomRoute.navigateTo(context, const MainEditProfileView());
              },
            ),
            DrawerItemsWidget(
              text: 'Privacy Policy',
              image: AppSvgs.privacy,
              onTap: () {
                // CustomRoute.navigateTo(context, const MainPrivacypolicyView());
              },
            ),
            DrawerItemsWidget(
              text: 'Term of Use',
              image: AppSvgs.terms,
              onTap: () {
                // CustomRoute.navigateTo(context, const MainTermCondView());
              },
            ),
            // const DrawerItemsWidget(
            //   text: 'Change Password',
            //   image: AppIcons.password,
            // ),
            DrawerItemsWidget(
              text: 'Customer Support',
              image: AppSvgs.customercare,
              onTap: () {
                // CustomRoute.navigateTo(context, EmailSender());
              },
            ),
            DrawerItemsWidget(
              onTap: () {
                showModalBottomSheet(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.r)),
                    context: context,
                    builder: (BuildContext context) {
                      return SizedBox(
                        height: 290.h,
                        width: double.infinity,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 8.h,
                            ),
                            Container(
                              width: 48.w,
                              height: 5.h,
                              decoration:
                                  const BoxDecoration(color: Color(0xffCDCFD0)),
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            LexendCustomText(
                              text: 'Delete Account?',
                              textColor: const Color(0xff090A0A),
                              fontWeight: FontWeight.w700,
                              fontsize: 24.sp,
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            LexendCustomText(
                              text: 'Are you sure want to delete this account?',
                              textColor: const Color(0xff090A0A),
                              fontWeight: FontWeight.w400,
                              fontsize: 16.sp,
                            ),
                            SizedBox(
                              height: 37.h,
                            ),

                            SizedBox(
                              height: 22.h,
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: LexendCustomText(
                                text: 'Cancel',
                                textColor: const Color(0xff202325),
                                fontWeight: FontWeight.w500,
                                fontsize: 16.sp,
                              ),
                            ),
                          ],
                        ),
                      );
                    });
              },
              text: 'Delete Account',
              image: AppSvgs.deleteaccount,
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () async {
                    // await loginAuthController.logOut();
                  },
                  child: Row(
                    children: [
                      const Icon(Icons.logout),
                      SizedBox(
                        width: 15.w,
                      ),
                      WorkSansCustomText(
                        textColor: const Color(0xff040415),
                        fontWeight: FontWeight.w700,
                        fontsize: 16.sp,
                        text: 'Log Out',
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 30.w,
                )
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

class DrawerItemsWidget extends StatelessWidget {
  final String text;
  final String image;
  final void Function()? onTap;

  const DrawerItemsWidget(
      {super.key, required this.text, required this.image, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 17.h),
        child: Row(
          children: [
            SizedBox(
              height: 36.7.h,
              width: 36.7.w,
              child: SvgPicture.asset(image),
            ),
            SizedBox(
              width: 20.w,
            ),
            SizedBox(
              width: 160,
              child: WorkSansCustomText(
                overflow: TextOverflow.ellipsis,
                textColor: const Color(0xff040415),
                fontWeight: FontWeight.w500,
                fontsize: 15.sp,
                text: text,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
