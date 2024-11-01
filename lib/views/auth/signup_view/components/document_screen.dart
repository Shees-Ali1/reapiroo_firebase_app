import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:repairoo/const/color.dart';
import 'package:repairoo/const/text_styles.dart';
import 'package:repairoo/controllers/tech_controller.dart';
import 'package:repairoo/views/auth/signup_view/pending_approval.dart';
import 'package:repairoo/widgets/custom_button.dart';

class DocumentsScreen extends StatefulWidget {
  @override
  _DocumentsScreenState createState() => _DocumentsScreenState();
}

class _DocumentsScreenState extends State<DocumentsScreen> {
  // List of documents to upload
  final List<String> documentTypes = [
    'Profile Picture',
    'Emirates ID',
    'Other Documents',
  ];

  final List<String> documentNames = [
    '(A clear photo of you)',
    '(Front and Back)',
    '(Passport, Visa, If needed)',
  ];

  // List to store selected image paths
  List<String?> selectedImagePaths = List.filled(3, null);
  final TechController techController = Get.find();


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            'Upload Documents',
            style: jost600(15.17.sp, Color(0xff6B7280)),
          ),
          SizedBox(height: 30.h),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: documentTypes.length,
            itemBuilder: (context, index) {
              return Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xffFAFAFA),
                  border: Border.all(color: Color(0xffE2E2E2), width: 1),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                margin: EdgeInsets.symmetric(vertical: 8.h),
                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                        documentTypes[index],
                        style: jost400(16.sp, Color(0xff1F2937)),
                      ),
                      subtitle: Text(documentNames[index],
                          style: jost400(16.sp, Color(0xff1F2937))),
                      contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
                      trailing: selectedImagePaths[index] != null
                          ? GestureDetector(
                              onTap: () => _removeImage(index),
                              child: Icon(Icons.close, color: Colors.red),
                            )
                          : ElevatedButton(
                              onPressed: () => _openGallery(index),
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(76.w,   30.h),
                                backgroundColor: AppColors.primary,

                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                              ),
                              child: Text(
                                'Upload',
                                style: sora600(10.sp, Color(0xffF9FAFB)),
                              ),
                            ),
                    ),
                    if (selectedImagePaths[index] != null) ...[
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Container(
                              height: 100.h,
                              width: 100.w,
                              decoration: BoxDecoration(
                                image: selectedImagePaths[index] != null
                                    ? DecorationImage(
                                        image: FileImage(
                                            File(selectedImagePaths[index]!)),
                                        fit: BoxFit.cover,
                                      )
                                    : null, // No image when the path is null
                                borderRadius: BorderRadius.circular(8
                                    .r), // Optional: add border radius if needed
                              ),
                              child: selectedImagePaths[index] == null
                                  ? Center(
                                      child: Text(
                                        'No Image Selected',
                                        style:
                                            jost400(12.sp, Color(0xff6B7280)),
                                        textAlign: TextAlign.center,
                                      ),
                                    )
                                  : null, // Do not display anything if an image is set
                            ),
                            SizedBox(width: 5.w),
                            SizedBox(
                              width: 190,
                              child: Text(
                                selectedImagePaths[index]!,
                                style: jost400(12.sp, Color(0xff6B7280)),
                                maxLines: 6,
                                // overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
      
                  ],
                ),
              );
            },
          ),
          SizedBox(height: 20.h,),
          Text(
            textAlign: TextAlign.center,
            'Please make sure to submit the required things correctly so you don’t delay your approval.',
            style: jost600(15.17.sp, Color(0xff6B7280)),
          ),
          SizedBox(height: 88.h,),
          CustomElevatedButton(
            text: 'Next',
            textColor: AppColors.secondary,
            onPressed: () {
              // Button action
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PendingApproval(),
                ),
              );

            },
            backgroundColor: AppColors.primary,
          ),
          SizedBox(
            height: 20.h,
          ),
        ],
      ),
    );
  }

  // Method to open the gallery for image selection
  Future<void> _openGallery(int index) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        selectedImagePaths[index] = pickedFile.path; // Store the image path
      });
    } else {
      // Handle the case when no image was selected
      print('No image selected for ${documentTypes[index]}.');
    }
  }

  // Method to remove the selected image
  void _removeImage(int index) {
    setState(() {
      selectedImagePaths[index] = null; // Clear the image path
    });
  }
}
