import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_project/chatapp/features/chat/data/models/message.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());

  final CollectionReference messages =
      FirebaseFirestore.instance.collection('messages');

  Future<void> send_message(
    String message,
  ) async {
    messages.add({
      'message': message,
      'createdAt': DateTime.now(),
      'userId': FirebaseAuth.instance.currentUser!.uid,
      'userEmail': FirebaseAuth.instance.currentUser!.email,
      // "userPassword": FirebaseAuth.instance.currentUser!.,
    });
  }

  Future<void> getmessages() async {
    messages.orderBy('createdAt', descending: true).snapshots().listen(
      (event) {
        List<Message> mesagelist = [];
        for (var doc in event.docs) {
          mesagelist.add(Message.fromjson(doc));
        }
        emit(ChatSucsess(messageList: mesagelist));
      },
    );
  }
}
