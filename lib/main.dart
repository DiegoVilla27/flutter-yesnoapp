import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/config/theme/theme.dart';
import 'package:yes_no_app/presentation/providers/chat.dart';
import 'package:yes_no_app/presentation/screens/chat/chat.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ChatProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeCustom(selectedColor: 0).theme(),
        title: 'Yes No App',
        home: ChatScreen(),
      ),
    );
  }
}
