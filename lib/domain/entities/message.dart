enum ESenderType { user, bot }

/// A class representing a message entity with text, an optional URL,
/// and a sender type.
///
/// The [MessageEntity] class contains:
/// - [text]: The main content of the message.
/// - [url]: An optional URL associated with the message.
/// - [senderType]: The type of sender, defined by the [ESenderType] enum.
class MessageEntity {
  final String text;
  final String? url;
  final ESenderType senderType;

  MessageEntity({required this.text, this.url, required this.senderType});
}
