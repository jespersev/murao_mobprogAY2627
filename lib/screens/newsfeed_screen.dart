
import 'package:material_ui/material_ui.dart';
import '../widgets/newsfeed_card.dart';

class NewsFeedScreen extends StatelessWidget {
  const NewsFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        NewsFeedCard(
          userName: 'Jesper Sev Murao',
          postContent: 'Wassup!',
          numOfLikes: 767,
          date: 'October 11',
        ),
        NewsFeedCard(
          userName: 'Jesper Sev Murao',
          postContent:
              'Look at my birdie!',
          numOfLikes: 143,
          hasImage: true,
          imagePath: 'assets/images/owl.jpg',
          date: 'December 2',
        ),
      ],
    );
  }
}
