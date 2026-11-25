import 'package:material_ui/material_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants.dart';
import 'custom_text.dart';

class NewsFeedCard extends StatefulWidget {
  const NewsFeedCard({
    super.key,
    required this.userName,
    required this.postContent,
    required this.date,
    this.profileImage = PROFILE_IMAGE,
    this.numOfLikes = 0,
    this.numOfComments = 0,
    this.numOfShares = 0,
    this.hasImage = false,
    this.imagePath = '',
  });

  final String userName;
  final String postContent;
  final String date;
  final String profileImage;
  final int numOfLikes;
  final int numOfComments;
  final int numOfShares;
  final bool hasImage;
  final String imagePath;

  @override
  State<NewsFeedCard> createState() => _NewsFeedCardState();
}

class _NewsFeedCardState extends State<NewsFeedCard> {
  bool isLiked = false;

  Widget actionButton({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return Expanded(
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 10.h),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 19.sp, color: color),
            SizedBox(width: 5.w),
            Flexible(
              child: CustomText(
                text: label,
                fontSize: 12.sp,
                color: color,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final int likes = widget.numOfLikes + (isLiked ? 1 : 0);

    return Card(
      color: CARD_BACKGROUND,
      elevation: 0,
      margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 7.h),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      child: Padding(
        padding: EdgeInsets.all(12.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 21.r,
                  backgroundImage: AssetImage(widget.profileImage),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: widget.userName,
                        fontSize: 15.sp,
                        color: TEXT_PRIMARY,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(height: 3.h),
                      Row(
                        children: [
                          CustomText(
                            text: widget.date,
                            fontSize: 11.sp,
                            color: TEXT_SECONDARY,
                          ),
                          SizedBox(width: 4.w),
                          Icon(
                            Icons.public,
                            size: 12.sp,
                            color: TEXT_SECONDARY,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.more_horiz),
              ],
            ),

            SizedBox(height: 12.h),

            CustomText(
              text: widget.postContent,
              fontSize: 14.sp,
              color: TEXT_PRIMARY,
            ),

            if (widget.hasImage) ...[
              SizedBox(height: 10.h),
              ClipRRect(
                borderRadius: BorderRadius.circular(5.r),
                child: SizedBox(
                  width: double.infinity,
                  height: 400,
                  child: widget.imagePath.isNotEmpty
                      ? Image.asset(widget.imagePath, fit: BoxFit.cover)
                      : const Placeholder(),
                ),
              ),
            ],

            SizedBox(height: 12.h),

            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(4.r),
                  decoration: const BoxDecoration(
                    color: FB_PRIMARY,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.thumb_up, color: Colors.white, size: 11.sp),
                ),
                SizedBox(width: 5.w),
                CustomText(
                  text: '$likes',
                  fontSize: 12.sp,
                  color: TEXT_SECONDARY,
                ),
                const Spacer(),
                CustomText(
                  text: '${widget.numOfComments} comments',
                  fontSize: 11.sp,
                  color: TEXT_SECONDARY,
                ),
                SizedBox(width: 10.w),
                CustomText(
                  text: '${widget.numOfShares} shares',
                  fontSize: 11.sp,
                  color: TEXT_SECONDARY,
                ),
              ],
            ),

            SizedBox(height: 6.h),

            const Divider(height: 1),

            Row(
              children: [
                actionButton(
                  icon: isLiked ? Icons.thumb_up : Icons.thumb_up_outlined,
                  label: 'Like',
                  color: isLiked ? FB_PRIMARY : TEXT_SECONDARY,
                  onPressed: () {
                    setState(() {
                      isLiked = !isLiked;
                    });
                  },
                ),
                actionButton(
                  icon: Icons.chat_bubble_outline_rounded,
                  label: 'Comment',
                  color: TEXT_SECONDARY,
                  onPressed: () {},
                ),
                actionButton(
                  icon: Icons.reply_rounded,
                  label: 'Share',
                  color: TEXT_SECONDARY,
                  onPressed: () {},
                ),
              ],
            ),

            const Divider(height: 1),

            SizedBox(height: 10.h),

            Row(
              children: [
                CircleAvatar(
                  radius: 15.r,
                  backgroundImage: const AssetImage(PROFILE_IMAGE),
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 14.w,
                      vertical: 10.h,
                    ),
                    decoration: BoxDecoration(
                      color: APP_BACKGROUND,
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                    child: CustomText(
                      text: 'Write a comment...',
                      fontSize: 12.sp,
                      color: TEXT_SECONDARY,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 10.h),

            CustomText(
              text: 'View comments',
              fontSize: 12.sp,
              color: TEXT_PRIMARY,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
      ),
    );
  }
}
