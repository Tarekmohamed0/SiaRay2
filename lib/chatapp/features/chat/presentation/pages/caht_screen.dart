import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_project/chatapp/features/chat/data/models/message.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/constants.dart';
import '../cubit/chat_cubit.dart';

class CahtScreen extends StatelessWidget {
  const CahtScreen({super.key});
  static CollectionReference messages =
      FirebaseFirestore.instance.collection('messages');
  static final TextEditingController sendController = TextEditingController();
  static final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    List<Message> messagelist = [];
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[800],
          automaticallyImplyLeading: false,
          title: const Text(TextinApp.appName,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
              )),
        ),
        body: Column(
          children: [
            Expanded(
                child: BlocConsumer<ChatCubit, ChatState>(
                    builder: (context, state) {
              return ListView.builder(
                reverse: true,
                controller: _scrollController,
                itemCount: messagelist.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.all(10),
                    height: 80,
                    width: 500,
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    child: Center(child: Text('${messagelist[index].message}')),
                  );
                },
              );
            }, listener: (context, state) {
              if (state is ChatSucsess) {
                messagelist = state.messageList;
              }
            })),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: sendController,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.send, color: Colors.blue),
                    onPressed: () {
                      BlocProvider.of<ChatCubit>(context)
                          .send_message(sendController.value.text);

                      sendController.clear();
                      _scrollController.animateTo(
                        0,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.fastOutSlowIn,
                      );
                    },
                  ),
                  hintText: 'Enter your message',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.blue),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
