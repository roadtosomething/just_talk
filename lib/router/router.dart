
import 'package:just_talk/features/chat_page/chat.dart';
import 'package:just_talk/features/chats_page/chats.dart';
import 'package:just_talk/features/home_page/home_page.dart';
import 'package:just_talk/features/login_page/login_page.dart';

import '../features/help_page/help_page.dart';
import '../features/main_page/main_page.dart';

final routes = {
  '/': (context)=>const MainScreen(),
  '/home': (context)=> HomePage(),
  '/login': (context) => LoginPage(),
  '/help': (context) => const HelpScreen(),
  '/chats':(context)=> const ChatsListScreen(),
  '/chat':(context)=> const ChatScreen(),
};