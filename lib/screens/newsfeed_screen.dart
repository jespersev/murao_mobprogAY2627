
import 'package:material_ui/material_ui.dart';
import '../widgets/newsfeed_card.dart';

class NewsFeedScreen extends StatelessWidget {
  const NewsFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        NewsFeedCard(
          userName: 'Jesper Sev V. Murao',
          postContent: 'My first Flutter application!',
          numOfLikes: 100,
          date: 'November 19',
          hasImage: true,
          profileImage: 'assets/images/1x1.jpg',
          postImage: 'assets/images/gta6.jpg',
        ),

        NewsFeedCard(
          userName: 'Cyrus Robles',
          postContent: 'Kamusta',
          numOfLikes: 100,
          date: 'October 11',
        ),

        NewsFeedCard(
          userName: 'Roben Juanatas',
          postContent:
              'Kicking off the holiday season with ICpEP-NCR!',
          numOfLikes: 200,
          hasImage: true,
          date: 'December 2',
        ),
      ],
    );
  }
}
