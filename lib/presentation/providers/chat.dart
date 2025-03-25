import 'package:flutter/material.dart';
import 'package:yes_no_app/data/repository/answers.dart';
import 'package:yes_no_app/domain/entities/message.dart';

/// A provider class for managing chat interactions and state.
///
/// This class extends `ChangeNotifier` to provide state management
/// capabilities for chat-related operations. It handles sending messages,
/// receiving bot responses, and updating the chat UI by scrolling to the
/// bottom when new messages are added.
///
/// Fields:
/// - `getAnswerSvc`: An instance of `AnswerService` used to fetch bot answers.
/// - `chatScrollController`: A `ScrollController` for managing chat scrolling.
/// - `messages`: A list of `MessageEntity` objects representing chat messages.
///
/// Methods:
/// - `sendMessage`: Sends a user message and triggers a bot response if the
///   message ends with a question mark.
/// - `getAnswerBot`: Fetches a bot answer and updates the chat with the response.
/// - `responseCommon`: Adds a new message to the chat and notifies listeners.
/// - `scrollToBottom`: Animates the chat view to scroll to the latest message.
class ChatProvider extends ChangeNotifier {
  final getAnswerSvc = AnswerService();
  final ScrollController chatScrollController = ScrollController();
  List<MessageEntity> messages = [];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;

    responseCommon(text, ESenderType.user);

    if (text.endsWith('?')) {
      getAnswerBot();
    }
  }

  void getAnswerBot() async {
    final data = await getAnswerSvc.getAnswer();
    responseCommon(data.text, data.senderType, data.url!);
  }

  void responseCommon(String message, ESenderType type, [String url = '']) {
    final newMessage = MessageEntity(text: message, url: url, senderType: type);
    messages.add(newMessage);
    notifyListeners();
    scrollToBottom();
  }

  void scrollToBottom() {
    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }
}
