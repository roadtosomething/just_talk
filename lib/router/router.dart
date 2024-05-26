
import 'package:just_talk/features/login_page/login_page.dart';

import '../features/help_page/help_page.dart';
import '../features/news/news.dart';
import '../features/news_list/news_list.dart';
import '../features/main_page/main_page.dart';

final routes = {
  '/': (context)=>const MainScreen(),
  '/login': (context) => LoginPage(),
  '/news-list': (context) => const NewsListScreen(),
  '/new': (context) => const NewsScreen(),
  '/help': (context) => const HelpScreen()
};