import 'package:chat_app/models/read_message_model.dart';
import 'package:chat_app/style/app_colors/app_colors.dart';
import 'package:chat_app/style/images/images.dart';
import 'package:chat_app/ui/widgets/custom_chat_bubble_other.dart';
import 'package:chat_app/ui/widgets/custom_chat_bubble_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});

  static String routeName = "chatScreen";
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference messages =
      FirebaseFirestore.instance.collection("Messages");

  TextEditingController controller = TextEditingController();
  final listViewConroller = ScrollController();
  bool isLoaded = false;

  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;
    return ModalProgressHUD(
      inAsyncCall: isLoaded,
      child: StreamBuilder<QuerySnapshot>(
          stream: messages.orderBy("date").snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<ReadMessageModel> messagesList = [];
              for (int i = 0; i < snapshot.data!.docs.length; i++) {
                messagesList
                    .add(ReadMessageModel.fromJson(snapshot.data!.docs[i]));
              }
              return Scaffold(
                  appBar: AppBar(
                    automaticallyImplyLeading: false,
                    backgroundColor: AppColors.kPrimary,
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image: AssetImage(Images.scholar),
                          height: 60,
                        ),
                        Text(
                          "Chat",
                          style: TextStyle(color: AppColors.kWhite),
                        )
                      ],
                    ),
                  ),
                  body: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          controller: listViewConroller,
                          itemCount: messagesList.length,
                          itemBuilder: (BuildContext context, int index) {
                            if (messagesList[index].id == email) {
                              return CustomChatBubbleUser(
                                  displayReadMessage: messagesList[index]);
                            } else {
                              return CustomChatBubbleOther(
                                  displayReadMessage: messagesList[index]);
                            }
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextField(
                          controller: controller,
                          onSubmitted: (input) {
                            messages.add({
                              "body": input,
                              "date": DateTime.now(),
                              "id": email,
                            });
                            controller.clear();
                            listViewConroller.animateTo(
                                listViewConroller.position.maxScrollExtent,
                                duration: const Duration(seconds: 1),
                                curve: Curves.easeIn);
                          },
                          decoration: InputDecoration(
                              hintText: "Send Message",
                              hintStyle: TextStyle(color: AppColors.kPrimary),
                              suffixIcon: Icon(
                                Icons.send,
                                color: AppColors.kPrimary,
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide:
                                      BorderSide(color: AppColors.kPrimary)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: AppColors.kPrimary),
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                    ],
                  ));
            } else {
              return const ModalProgressHUD(
                  inAsyncCall: true, child: CircularProgressIndicator());
            }
          }),
    );
  }
}
