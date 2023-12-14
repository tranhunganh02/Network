import 'package:flutter/material.dart';
import 'package:flutter_final_network/providers/auth_provider.dart';
import 'package:flutter_final_network/view/chat/component/avater_user.dart';
import 'package:flutter_final_network/view/chat/component/name_last_message.dart';
import 'package:flutter_final_network/view/chat/component/shape_circle.dart';
import 'package:flutter_final_network/view/chat/component/time_num_notification.dart';
import 'package:flutter_final_network/view/chatRoom/chat_room_screen.dart';
import 'package:provider/provider.dart';

import '../../models/user.dart';

class ListChat extends StatefulWidget {
  const ListChat({super.key});

  @override
  State<ListChat> createState() => _ListChatState();
}

class _ListChatState extends State<ListChat> {
  TextEditingController _searchController = TextEditingController();

   List<String>  imgURL = ["https://i.pinimg.com/564x/6b/07/71/6b0771b6c6a0a5ca2f518028246322fb.jpg", "https://i.pinimg.com/564x/2c/d4/f8/2cd4f8e1cb5191afcdd2295ed07cc564.jpg"];
      

  DateTime now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    Future<void> getCurrentUser() async {
      await UserPreferences.deleteUser();
       await UserPreferences.printUserInfo();
      
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SearchUser(context),
          Expanded(
              flex: 2,
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  bool online = index % 2 == 0;
                  int ix = index % 2 ;
                  return Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    height: MediaQuery.sizeOf(context).height * 0.08,
                    width: double.infinity,
                    child: InkWell(
                        onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ChatRoom()),
                            ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ImageUser(context, online, imgURL[ix].toString()),
                            NameAndLastMsg(context),
                            TimeAndNumNoti(context, index, now)
                          ],
                        )),
                  );
                },
              ))
        ],
      ),
    );
  }

  Container SearchUser(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.07,
      margin: const EdgeInsets.only(bottom: 20),
      width: double.infinity,
      color: Color.fromARGB(255, 238, 230, 230),
      child: Row(
        children: [
          const SizedBox(
            width: 50,
            child: Icon(Icons.search),
          ),
          Expanded(
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                labelText: 'search',
                enabledBorder: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
