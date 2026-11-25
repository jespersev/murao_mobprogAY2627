import 'package:material_ui/material_ui.dart';

import '../constants.dart';
import '../widgets/notification.dart' as notif;

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final List<Map<String, String>> notifications = [
    {
      'name': 'Ryan Garcia',
      'post': 'liked your post.',
      'description': 'Just now',
    },
    {
      'name': 'Gervonta Davis',
      'post': 'sent you a friend request.',
      'description': '5 minutes ago',
    },
    {
      'name': 'Manny Pacquiao',
      'post': 'reacted to your photo.',
      'description': '10 minutes ago',
    },
    {
      'name': 'Canelo Alvarez',
      'post': 'commented on your post.',
      'description': '15 minutes ago',
    },
    {
      'name': 'Lamine Yamal',
      'post': 'started following you.',
      'description': '20 minutes ago',
    },
    {
      'name': 'Mike Tyson',
      'post': 'liked your photo.',
      'description': '30 minutes ago',
    },
    {
      'name': 'Ilia Topuria',
      'post': 'mentioned you in a comment.',
      'description': '40 minutes ago',
    },
    {
      'name': 'Nate Diaz',
      'post': 'sent you a friend request.',
      'description': '50 minutes ago',
    },
    {
      'name': 'Max Holloway',
      'post': 'shared your post.',
      'description': '1 hour ago',
    },
    {
      'name': 'Lionel Messi',
      'post': 'liked your post.',
      'description': '2 hours ago',
    },
    {
      'name': 'Cristiano Ronaldo',
      'post': 'started following you.',
      'description': '3 hours ago',
    },
    {
      'name': 'Ben Simmons',
      'post': 'missed your notification.',
      'description': '4 hours ago',
    },
    {
      'name': 'LeBron James',
      'post': 'reacted to your photo.',
      'description': '5 hours ago',
    },
    {
      'name': 'Stephen Curry',
      'post': 'shared your post.',
      'description': '6 hours ago',
    },
    {
      'name': 'Kevin Durant',
      'post': 'replied to your comment.',
      'description': '7 hours ago',
    },
    {
      'name': 'Conor McGregor',
      'post': 'challenged you to a fight.',
      'description': '8 hours ago',
    },
    {
      'name': 'Jon Jones',
      'post': 'viewed your profile.',
      'description': '9 hours ago',
    },
    {
      'name': 'Islam Makhachev',
      'post': 'sent you a friend request.',
      'description': '10 hours ago',
    },
    {
      'name': 'Khabib Nurmagomedov',
      'post': 'reacted to your post.',
      'description': 'Yesterday',
    },
    {
      'name': 'Alex Pereira',
      'post': 'commented: Chama!',
      'description': 'Yesterday',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CARD_BACKGROUND,
      child: ListView.separated(
        itemCount: notifications.length,
        separatorBuilder: (context, index) {
          return const Divider(height: 1);
        },
        itemBuilder: (context, index) {
          final item = notifications[index];

          return notif.Notification(
            name: item['name']!,
            post: item['post']!,
            description: item['description']!,
          );
        },
      ),
    );
  }
}
