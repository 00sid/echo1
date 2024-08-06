import 'package:flutter_riverpod/flutter_riverpod.dart';

enum MessageType { error, success }

class MessageState {
  final String? message;
  final MessageType? type;

  MessageState({this.message, this.type});
}

class MessageNotifier extends StateNotifier<MessageState> {
  MessageNotifier() : super(MessageState());

  void showError(String message) {
    state = MessageState(message: message, type: MessageType.error);
  }

  void showSuccess(String message) {
    state = MessageState(message: message, type: MessageType.success);
  }

  void clearMessage() {
    state = MessageState();
  }
}

final messageProvider =
    StateNotifierProvider<MessageNotifier, MessageState>((ref) {
  return MessageNotifier();
});
