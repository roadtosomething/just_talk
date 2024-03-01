
import '../features/help_page/help_page.dart';
import '../features/news/news.dart';
import '../features/news_list/news_list.dart';
import '../features/main_page/main_page.dart';

final routes = {
  '/' : (context) => const MainScreen(),
  '/news-list': (context) => const NewsListScreen(),
  '/new': (context) => const NewsScreen(),
  '/help': (context) => const HelpScreen()
};