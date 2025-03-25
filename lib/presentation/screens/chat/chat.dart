import 'package:flutter/material.dart';
import 'package:yes_no_app/presentation/screens/chat/widgets/app_bar/app_bar.dart';
import 'package:yes_no_app/presentation/screens/chat/widgets/chat_view/chat_view.dart';

/// A stateless widget that represents the chat screen in the application.
/// 
/// This widget builds a `Scaffold` with a custom app bar and a chat view
/// as its body. It utilizes the `AppBarChat` and `ChatView` widgets to
/// display the chat interface.
class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBarChat(), body: ChatView());
  }
}
