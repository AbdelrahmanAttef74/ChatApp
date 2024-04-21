import 'package:bloc/bloc.dart';
import 'package:chat_app/constants.dart';
import 'package:chat_app/models/message_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());
  List<MessageModel> messagesList = [];
  CollectionReference messages =
      FirebaseFirestore.instance.collection(kMessagesCollection);
  void sendMessage({required String message, required String email}) {
    messages.add({
      kMessage: message,
      kCreatedAt: DateTime.now(),
      kId: email,
    });
  }

  void getMessages() {
    messages.orderBy(kCreatedAt, descending: true).snapshots().listen(
      (event) {
        messagesList.clear();
        for (var doc in event.docs) {
          messagesList.clear();
          messagesList.add(MessageModel.fromJson(doc));
        }
        emit(ChatSuccess(messages: messagesList));
      },
    );
  }
}
