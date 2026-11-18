
import 'package:material_ui/material_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants.dart';
import 'custom_text.dart';

class NewsFeedCard extends StatefulWidget {
  final String userName;
  final String postContent;
  final int numOfLikes;
  final bool hasImage;
  final String date;
  final String? profileImage;
  final String? postImage;

  const NewsFeedCard({
    super.key,
    required this.userName,
    required this.postContent,
    required this.numOfLikes,
    required this.date,
    this.hasImage = false,
    this.profileImage,
    this.postImage,
  });

  @override
  State<NewsFeedCard> createState() => _NewsFeedCardState();
}

class _NewsFeedCardState extends State<NewsFeedCard> {
  bool isLiked = false;
  late int likes;
  bool showComments = false;

  final TextEditingController commentController =
      TextEditingController();

  final List<String> comments = [];

  @override
  void initState() {
    super.initState();
    likes = widget.numOfLikes;
  }

  @override
  void dispose() {
    commentController.dispose();
    super.dispose();
  }

  void toggleLike() {
    setState(() {
      isLiked = !isLiked;
      likes += isLiked ? 1 : -1;
    });
  }

  void addComment() {
    final comment = commentController.text.trim();

    if (comment.isEmpty) return;

    setState(() {
      comments.add(comment);
      showComments = true;
      commentController.clear();
    });

    FocusScope.of(context).unfocus();
  }

  void sharePost() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Share feature coming soon'),
      ),
    );
  }

  Widget buildAvatar({double radius = 20}) {
    return CircleAvatar(
      radius: radius.r,
      backgroundColor: FB_LIGHT_PRIMARY,
      backgroundImage: widget.profileImage != null
          ? AssetImage(widget.profileImage!)
          : null,
      child: widget.profileImage == null
          ? Icon(
              Icons.person,
              color: FB_DARK_PRIMARY,
              size: radius.sp,
            )
          : null,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 10.w,
        vertical: 8.h,
      ),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 6,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              buildAvatar(),
              SizedBox(width: 10.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: widget.userName,
                      fontSize: 15.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(height: 3.h),
                    Row(
                      children: [
                        CustomText(
                          text: widget.date,
                          fontSize: 12.sp,
                          color: Colors.grey,
                        ),
                        SizedBox(width: 5.w),
                        Icon(
                          Icons.public,
                          size: 13.sp,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Icon(Icons.more_horiz),
            ],
          ),

          SizedBox(height: 15.h),

          CustomText(
            text: widget.postContent,
            fontSize: 14.sp,
            color: Colors.black,
          ),

          if (widget.hasImage) ...[
            SizedBox(height: 12.h),
            ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: SizedBox(
                height: 220.h,
                width: double.infinity,
                child: widget.postImage != null
                    ? Image.asset(
                        widget.postImage!,
                        fit: BoxFit.cover,
                      )
                    : Container(
                        color: Colors.grey.shade200,
                        child: Icon(
                          Icons.image_outlined,
                          size: 45.sp,
                          color: Colors.grey,
                        ),
                      ),
              ),
            ),
          ],

          SizedBox(height: 12.h),

          Row(
            children: [
              Icon(
                Icons.thumb_up,
                size: 17.sp,
                color: FB_PRIMARY,
              ),
              SizedBox(width: 6.w),
              Text('$likes'),
              const Spacer(),
              if (comments.isNotEmpty)
                Text(
                  '${comments.length} comments',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12.sp,
                  ),
                ),
            ],
          ),

          const Divider(),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ActionButton(
                icon: isLiked
                    ? Icons.thumb_up
                    : Icons.thumb_up_outlined,
                label: 'Like',
                color: isLiked ? FB_PRIMARY : Colors.grey,
                onPressed: toggleLike,
              ),
              ActionButton(
                icon: Icons.mode_comment_outlined,
                label: 'Comment',
                onPressed: () {
                  setState(() {
                    showComments = true;
                  });
                },
              ),
              ActionButton(
                icon: Icons.share_outlined,
                label: 'Share',
                onPressed: sharePost,
              ),
            ],
          ),

          const Divider(),

          Row(
            children: [
              buildAvatar(radius: 15),
              SizedBox(width: 10.w),
              Expanded(
                child: TextField(
                  controller: commentController,
                  textInputAction: TextInputAction.send,
                  onSubmitted: (_) => addComment(),
                  decoration: InputDecoration(
                    hintText: 'Write a comment...',
                    hintStyle: TextStyle(fontSize: 12.sp),
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    isDense: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.r),
                      borderSide: BorderSide.none,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        Icons.send,
                        color: FB_PRIMARY,
                        size: 18.sp,
                      ),
                      onPressed: addComment,
                    ),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 10.h),

          TextButton(
            onPressed: () {
              setState(() {
                showComments = !showComments;
              });
            },
            child: Text(
              showComments ? 'Hide comments' : 'View comments',
              style: const TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          if (showComments)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (comments.isEmpty)
                  const Padding(
                    padding: EdgeInsets.all(8),
                    child: Text('No comments yet.'),
                  ),
                for (final comment in comments)
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(bottom: 8.h),
                    padding: EdgeInsets.all(10.w),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'You',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(comment),
                      ],
                    ),
                  ),
              ],
            ),
        ],
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;
  final Color color;

  const ActionButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onPressed,
    this.color = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, color: color, size: 18.sp),
      label: Text(
        label,
        style: TextStyle(
          color: color,
          fontSize: 12.sp,
        ),
      ),
    );
  }
}
