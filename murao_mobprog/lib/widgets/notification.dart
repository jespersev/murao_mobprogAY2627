import 'package:material_ui/material_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants.dart';
import 'custom_text.dart';

class Notification extends StatelessWidget {
  const Notification({
    super.key,
    required this.name,
    required this.post,
    required this.description,
  });

  final String name;
  final String post;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CARD_BACKGROUND,
      padding: EdgeInsets.all(15.r),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25.r,
            backgroundColor: FB_LIGHT_PRIMARY,
            child: Icon(Icons.person, color: FB_PRIMARY, size: 30.sp),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: name,
                  fontSize: 16.sp,
                  color: TEXT_PRIMARY,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 4.h),
                CustomText(text: post, fontSize: 13.sp, color: TEXT_PRIMARY),
                SizedBox(height: 3.h),
                CustomText(
                  text: description,
                  fontSize: 12.sp,
                  color: TEXT_SECONDARY,
                  fontStyle: FontStyle.italic,
                ),
              ],
            ),
          ),
          const Icon(Icons.more_horiz, color: TEXT_SECONDARY),
        ],
      ),
    );
  }
}
