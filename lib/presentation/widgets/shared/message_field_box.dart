import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  final ValueChanged<String> onSubmitted;

  const MessageFieldBox({super.key, required this.onSubmitted});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    final textController = TextEditingController();
    final focusNode = FocusNode();

    final underlineInputBorder = UnderlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(40),
    );

    final inputDecoration = InputDecoration(
      enabledBorder: underlineInputBorder,
      focusedBorder: underlineInputBorder,
      filled: true,
      hintText: 'End your message with a "?"',
      suffixIcon: IconButton(
        icon: const Icon(Icons.send_outlined),
        onPressed: () {
          final textValue = textController.value.text;
          if (textValue.isEmpty) return;

          onSubmitted(textValue);

          textController.clear();
        },
      ),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        focusNode: focusNode,
        controller: textController,
        decoration: inputDecoration,
        onTapOutside: (event) {
          focusNode.unfocus();
        },
        onFieldSubmitted: (value) {
          if (value.isEmpty) return;

          onSubmitted(value);

          textController.clear();
          focusNode.requestFocus();
        },
      ),
    );
  }
}
