import 'package:material_ui/material_ui.dart';

import '../widgets/newsfeed_card.dart';

class NewsFeedScreen extends StatelessWidget {
  const NewsFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const posts = [
      NewsFeedCard(
        userName: 'Jesper Sev Murao',
        postContent: 'Wassup!',
        numOfLikes: 767,
        numOfComments: 32,
        numOfShares: 12,
        date: 'October 11',
      ),
      NewsFeedCard(
        userName: 'Jesper Sev Murao',
        postContent: 'Look at my birdie!',
        numOfLikes: 143,
        numOfComments: 24,
        numOfShares: 8,
        hasImage: true,
        imagePath: 'assets/images/owl.jpg',
        date: 'December 2',
      ),
      NewsFeedCard(
        userName: 'Melo Drama',
        profileImage: 'assets/images/lb.png',
        postContent: 'My passes have better direction than my life.',
        numOfLikes: 86,
        numOfComments: 15,
        numOfShares: 3,
        date: 'December 3',
      ),
      NewsFeedCard(
        userName: 'Pandemic P',
        profileImage: 'assets/images/pg.png',
        postContent: 'That was a good shot. The rim just disagreed.',
        numOfLikes: 205,
        numOfComments: 41,
        numOfShares: 17,
        date: 'December 4',
      ),
      NewsFeedCard(
        userName: 'Slim Reaper',
        profileImage: 'assets/images/kd.png',
        postContent:
            "If you disagree with me, I'll reply using my other account.",
        numOfLikes: 112,
        numOfComments: 18,
        numOfShares: 5,
        date: 'December 5',
      ),
      NewsFeedCard(
        userName: 'Tatum Tot',
        profileImage: 'assets/images/jt.png',
        postContent:
            'Practicing my championship celebration more than my free throws.',
        numOfLikes: 94,
        numOfComments: 28,
        numOfShares: 4,
        date: 'December 6',
      ),
      NewsFeedCard(
        userName: 'Chef Curry',
        profileImage: 'assets/images/sc.png',
        postContent:
            "Why shoot from the three-point line when there's a parking lot?",
        numOfLikes: 156,
        numOfComments: 21,
        numOfShares: 9,
        date: 'December 7',
      ),
      NewsFeedCard(
        userName: 'Jesper Sev Murao',
        postContent: 'ji ti ey',
        numOfLikes: 189,
        numOfComments: 36,
        numOfShares: 14,
        hasImage: true,
        imagePath: 'assets/images/gta6.jpg',
        date: 'December 8',
      ),
      NewsFeedCard(
        userName: 'LeOld James',
        profileImage: 'assets/images/lbj.png',
        postContent: 'Year 23 and my knees are asking for retirement benefits.',
        numOfLikes: 73,
        numOfComments: 19,
        numOfShares: 6,
        date: 'December 9',
      ),
      NewsFeedCard(
        userName: 'Jesper Sev Murao',
        postContent: 'Welcome to fakenews!',
        numOfLikes: 320,
        numOfComments: 56,
        numOfShares: 23,
        date: 'December 10',
      ),
    ];

    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return posts[index];
      },
    );
  }
}
