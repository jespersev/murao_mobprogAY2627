
import 'package:material_ui/material_ui.dart';

class NewsFeedCard extends StatefulWidget {
  final String userName;
  final String postContent;
  final int numOfLikes;
  final String date;
  final bool hasImage;
  final String? imagePath;

  const NewsFeedCard({
    super.key,
    required this.userName,
    required this.postContent,
    required this.numOfLikes,
    required this.date,
    this.hasImage = false,
    this.imagePath,
  });

  @override
  State<NewsFeedCard> createState() => _NewsFeedCardState();
}

class _NewsFeedCardState extends State<NewsFeedCard> {
  late int likes;
  bool isLiked = false;

  @override
  void initState() {
    super.initState();
    likes = widget.numOfLikes;
  }

  void toggleLike() {
    setState(() {
      isLiked = !isLiked;
      likes += isLiked ? 1 : -1;
    });
  }

  Widget actionButton({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
    Color color = Colors.grey,
  }) {
    return Expanded(
      child: TextButton.icon(
        onPressed: onPressed,
        icon: Icon(
          icon,
          size: 18,
          color: color,
        ),
        label: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: color,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Profile information
          Row(
            children: [
              const CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage(
                  'assets/images/1x1.jpg',
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.userName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Row(
                      children: [
                        Text(
                          widget.date,
                          style: const TextStyle(
                            fontSize: 11,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(width: 5),
                        const Icon(
                          Icons.public,
                          size: 12,
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

          const SizedBox(height: 14),

          // Post content
          Text(
            widget.postContent,
            style: const TextStyle(fontSize: 13),
          ),

          // Post image - display full image without cropping
          if (widget.hasImage &&
              widget.imagePath != null) ...[
            const SizedBox(height: 12),
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Image.asset(
                widget.imagePath!,
                width: double.infinity,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stack) {
                  return Container(
                    height: 230,
                    width: double.infinity,
                    color: Colors.grey.shade200,
                    child: const Center(
                      child: Icon(
                        Icons.image_outlined,
                        size: 70,
                        color: Colors.grey,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],

          const SizedBox(height: 14),

          // Number of likes
          Row(
            children: [
              const Icon(
                Icons.thumb_up,
                color: Colors.blue,
                size: 16,
              ),
              const SizedBox(width: 5),
              Text(
                '$likes',
                style: const TextStyle(fontSize: 12),
              ),
            ],
          ),

          const Divider(),

          // Widget-based action buttons
          Row(
            children: [
              actionButton(
                icon: isLiked
                    ? Icons.thumb_up
                    : Icons.thumb_up_outlined,
                label: 'Like',
                color: isLiked
                    ? Colors.blue
                    : Colors.grey,
                onPressed: toggleLike,
              ),
              actionButton(
                icon: Icons.mode_comment_outlined,
                label: 'Comment',
                onPressed: () {},
              ),
              actionButton(
                icon: Icons.share_outlined,
                label: 'Share',
                onPressed: () {},
              ),
            ],
          ),

          const Divider(),

          // Comment area
          Row(
            children: [
              const CircleAvatar(
                radius: 14,
                backgroundImage: AssetImage(
                  'assets/images/1x1.jpg',
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    'Write a comment...',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          const Text(
            'View comments',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
