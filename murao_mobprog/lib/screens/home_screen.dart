import 'package:material_ui/material_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants.dart';
import 'newsfeed_screen.dart';
import 'notification_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  final List<String> titles = [APP_NAME, 'Notifications', 'Profile'];

  final List<Widget> screens = [
    const NewsFeedScreen(),
    const NotificationScreen(),
    const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(radius: 50, backgroundImage: AssetImage(PROFILE_IMAGE)),
          SizedBox(height: 15),
          Text(
            'Jesper Sev Murao',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: TEXT_PRIMARY,
            ),
          ),
        ],
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: APP_BACKGROUND,

      appBar: AppBar(
        backgroundColor: CARD_BACKGROUND,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        title: Text(
          titles[selectedIndex],
          style: TextStyle(
            fontSize: 25.sp,
            fontWeight: FontWeight.bold,
            color: selectedIndex == 0 ? FB_PRIMARY : TEXT_PRIMARY,
          ),
        ),
        actions: [
          if (selectedIndex == 0)
            Padding(
              padding: EdgeInsets.only(right: 15.w),
              child: CircleAvatar(
                radius: 18.r,
                backgroundImage: const AssetImage(PROFILE_IMAGE),
              ),
            ),
        ],
      ),

      body: IndexedStack(index: selectedIndex, children: screens),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: CARD_BACKGROUND,
        selectedItemColor: FB_PRIMARY,
        unselectedItemColor: TEXT_SECONDARY,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_none),
            activeIcon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
