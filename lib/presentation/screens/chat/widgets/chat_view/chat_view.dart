import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat.dart';
import 'package:yes_no_app/presentation/screens/chat/widgets/chat_view/widgets/input_message.dart';
import 'package:yes_no_app/presentation/screens/chat/widgets/chat_view/widgets/message.dart';

/// A stateless widget that represents the chat view in the application.
/// 
/// This widget uses a `ChatProvider` to manage the chat state and display
/// messages. It includes a scrollable list of messages and an input field
/// for sending new messages. The `ListView.builder` is used to dynamically
/// build the list of messages, and each message is displayed using the
/// `Message` widget. The `InputMessage` widget is used to capture user input
/// and send messages through the `ChatProvider`.
class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: chatProvider.chatScrollController,
                itemCount: chatProvider.messages.length,
                itemBuilder: (context, index) {
                  final MessageEntity message = chatProvider.messages[index];
                  return Message(
                    isSender: (message.senderType == ESenderType.user),
                    message: message.text,
                    url: message.url,
                  );
                },
              ),
            ),
            InputMessage(onValue: chatProvider.sendMessage),
          ],
        ),
      ),
    );
  }
}
