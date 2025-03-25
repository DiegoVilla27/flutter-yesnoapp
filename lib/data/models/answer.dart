import 'package:yes_no_app/domain/entities/message.dart';

/// A model representing an answer with associated metadata.
///
/// The `AnswerModel` class includes an answer string, a boolean indicating if
/// the answer is forced, and an image URL. It provides a factory constructor
/// to create an instance from a JSON map and a method to convert the model
/// into a `MessageEntity`.
class AnswerModel {
  String answer;
  bool forced;
  String image;

  AnswerModel({
    required this.answer,
    required this.forced,
    required this.image,
  });

  factory AnswerModel.fromJsonMap(Map<String, dynamic> json) => AnswerModel(
    answer: json['answer'],
    forced: json['forced'],
    image: json['image'],
  );

  MessageEntity toMessageEntity() {
    return MessageEntity(text: answer, url: image, senderType: ESenderType.bot);
  }
}
