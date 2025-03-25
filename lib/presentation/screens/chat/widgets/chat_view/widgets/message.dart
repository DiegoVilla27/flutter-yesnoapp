import 'package:flutter/material.dart';
import 'package:yes_no_app/presentation/screens/chat/widgets/chat_view/widgets/image_message.dart';

/// A stateless widget that represents a chat message bubble.
///
/// The [Message] widget displays a text message with a customizable
/// appearance based on whether the message is sent or received. It
/// supports an optional image URL for received messages.
///
/// The [isSender] parameter determines the alignment and color of the
/// message bubble. The [message] parameter is the text content of the
/// message. The optional [url] parameter is used to display an image
/// below the message text if the message is received.
class Message extends StatelessWidget {
  final bool isSender;
  final String message;
  final String? url;

  const Message({
    super.key,
    required this.isSender,
    required this.message,
    this.url,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment:
          isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 10),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: isSender ? colors.primary : colors.secondary,
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(20),
              topRight: const Radius.circular(20),
              bottomLeft: isSender ? const Radius.circular(20) : Radius.zero,
              bottomRight: isSender ? Radius.zero : const Radius.circular(20),
            ),
          ),
          child: Text(message, style: TextStyle(color: Colors.white)),
        ),
        if (!isSender && url != null)
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: ImageMessage(url: url),
          ),
      ],
    );
  }
}
