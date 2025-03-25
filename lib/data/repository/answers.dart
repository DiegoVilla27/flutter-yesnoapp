import 'package:yes_no_app/config/environments/environments.dart';
import 'package:dio/dio.dart';
import 'package:yes_no_app/data/models/answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';

/// A service class that provides methods to interact with the Yes/No API.
///
/// This class uses the Dio package to perform HTTP requests to the Yes/No API
/// and converts the response into a `MessageEntity`.
///
/// Methods:
/// - `getAnswer`: Fetches an answer from the Yes/No API and returns it as a `MessageEntity`.
class AnswerService {
  final _dio = Dio();

  Future<MessageEntity> getAnswer() async {
    final response = await _dio.get(environments['api_yesno']!);
    final answer = AnswerModel.fromJsonMap(response.data);
    return answer.toMessageEntity();
  }
}
