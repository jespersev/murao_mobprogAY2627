import 'package:material_ui/material_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'constants.dart';
import 'screens/home_screen.dart';
import 'screens/newsfeed_screen.dart';

void main() {
  runApp(const MuraoFakeNews());
}

class MuraoFakeNews extends StatelessWidget {
  const MuraoFakeNews({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 715),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: APP_NAME,

          themeMode: ThemeMode.light,

          theme: ThemeData(
            useMaterial3: true,
            brightness: Brightness.light,

            colorScheme: const ColorScheme.light(
              primary: FB_PRIMARY,
              secondary: FB_SECONDARY,
              surface: CARD_BACKGROUND,
              onPrimary: FB_TEXT_COLOR_WHITE,
              onSecondary: TEXT_PRIMARY,
              onSurface: TEXT_PRIMARY,
              onSurfaceVariant: TEXT_SECONDARY,
            ),

            scaffoldBackgroundColor: APP_BACKGROUND,
            cardColor: CARD_BACKGROUND,
            dividerColor: const Color(0xFFE4E4E7),
          ),

          initialRoute: '/home',

          routes: {
            '/home': (context) => const HomeScreen(),
            '/newsfeed': (context) => const NewsFeedScreen(),
          },
        );
      },
    );
  }
}
