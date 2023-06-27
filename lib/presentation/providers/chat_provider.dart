import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final scrollController = ScrollController();
  final getYesNoAnswer = GetYesNoAnswer();

  List<Message> messages = [
    Message(text: "Hola", fromWho: FromWho.me),
  ];

  Future<void> getAnswer() async {
    final yesNoResponse = await getYesNoAnswer.getAnswer();

    messages.add(yesNoResponse.toMessageEntity());

    newMessageSended();
  }

  Future<void> sendMessage(String text) async {
    final newMessage = Message(text: text, fromWho: FromWho.me);

    messages.add(newMessage);

    if (text.endsWith("?")) {
      getAnswer();
    }

    newMessageSended();
  }

  void newMessageSended() {
    notifyListeners();
    moveScrollToBottom();
  }

  void moveScrollToBottom() {
    scrollController.animateTo(
      scrollController.position.maxScrollExtent + 100,
      duration: const Duration(milliseconds: 300),
      curve: Curves.bounceInOut,
    );
  }
}
