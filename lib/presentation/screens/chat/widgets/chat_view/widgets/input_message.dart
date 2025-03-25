import 'package:flutter/material.dart';

/// A stateless widget that provides a text input field for sending messages.
///
/// The `InputMessage` widget includes a text field with a send button.
/// When the send button is pressed or the field is submitted, the provided
/// `onValue` callback is triggered with the current text value. The text
/// field is then cleared and the focus is removed.
///
/// The input field is styled with rounded borders and a hint text prompting
/// the user to end their message with a question mark.
class InputMessage extends StatelessWidget {
  final ValueChanged<String> onValue;

  const InputMessage({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final focusNode = FocusNode();

    void onSubmit(String value) {
      onValue(value);
      textController.clear();
      FocusScope.of(context).unfocus();
    }

    final inputBorder = UnderlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide(color: Colors.transparent),
    );

    final inputDecoration = InputDecoration(
      enabledBorder: inputBorder,
      focusedBorder: inputBorder,
      hintText: "End your message with a '?'",
      filled: true,
      contentPadding: EdgeInsets.all(15),
      suffixIcon: IconButton(
        icon: Icon(Icons.send),
        onPressed: () {
          onSubmit(textController.text);
          focusNode.unfocus();
        },
      ),
    );

    return TextFormField(
      controller: textController,
      focusNode: focusNode,
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        onSubmit(value);
      },
    );
  }
}
