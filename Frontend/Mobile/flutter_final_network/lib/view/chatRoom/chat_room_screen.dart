import 'package:flutter/material.dart';
import 'package:flutter_final_network/constanst.dart';

class ChatRoom extends StatefulWidget {
  const ChatRoom({super.key});

  @override
  State<ChatRoom> createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  TextEditingController _textEditingController = TextEditingController();

  bool _isKeyboardVisible = false;
 final FocusNode _focusNode = FocusNode();

  void _onFocusChange() {
    setState(() {
      _isKeyboardVisible = !_isKeyboardVisible;
    });
  }

 @override
  void dispose() {
    // TODO: implement dispose
    
    _textEditingController.dispose();
    super.dispose();

  } 

 @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        // Bàn phím đã tắt
       _onFocusChange();
        // Thực hiện các xử lý khi bàn phím tắt ở đây
      }
    });
    // Lắng nghe sự kiện thay đổi trong bàn phím
  }

  void _showPopupMenu(BuildContext context) async {
    await showMenu(
      context: context,
      position: RelativeRect.fromLTRB(
        0,
        MediaQuery.sizeOf(context).height - 50,
        10,
        10,
      ),
      elevation: 0, // Set elevation to 0 for a flat appearance
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
            8.0), // Set border radius for a rounded appearance
      ),

      items: [
        PopupMenuItem(
          value: 'file',
          child: InkWell(
            onTap: () {},
            child: const ListTile(
              title: Text("File"),
              leading: Icon(Icons.description),
            ),
          ),
        ),
        PopupMenuItem(
          value: 'image',
          child: InkWell(
            onTap: () {},
            child: const ListTile(
              title: Text("Image"),
              leading: Icon(Icons.image),
            ),
          ),
        ),
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: Header(context),
      body: Column(
        children: [
      
          // message here
          Expanded(
            flex: 10,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return null;
                },
              ),
            ),
          ),
      
          //input message and button send here
          Expanded(
              flex:_isKeyboardVisible ? 2 : 1,
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: _isKeyboardVisible ? EdgeInsets.symmetric(horizontal: 5, vertical: 15)  :  EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: double.infinity,
                          width:  MediaQuery.sizeOf(context).width * 0.08,
                          child: IconButton(
                              onPressed: () => _showPopupMenu(context),
                              icon: const Icon(Icons.add)),
                        ),
                        Container(
                          height: double.infinity - 20,
                          width: MediaQuery.sizeOf(context).width * 0.71,
                          padding: const EdgeInsets.only(left: 15),
                          decoration: BoxDecoration(
                            
                            borderRadius:const BorderRadius.all(Radius.circular(10),),
                            border: Border.all(width: 0.8, color: kSecondPrimaryColor),
                          ),
                          child: TextField(
                            textAlign: TextAlign.start,
                             focusNode: _focusNode,
                            controller: _textEditingController,
                            onTap: () => _onFocusChange(),
                            decoration: const InputDecoration(
                              labelText: 'Type message here!!',
                              enabledBorder: InputBorder.none,
                               floatingLabelBehavior: FloatingLabelBehavior.never,
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none
                            ),          
                          ),
                        ),
                        SizedBox(
                          height: double.infinity,
                          width: MediaQuery.sizeOf(context).width * 0.08,
                          child: const Icon(Icons.send, color: kSencondComponent,),
                        )
                      ],
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }

  AppBar Header(BuildContext context) {
    return AppBar(
      backgroundColor: kPrimaryColor,
      centerTitle: false,
      title: Text("Jisoo"),
      titleTextStyle: const TextStyle(color: kTextColor, fontSize: 25),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        color: kTextColor, // Change the color here
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      actions: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.call_rounded,
              color: kTextColor,
            )),
        TextButton(
          onPressed: () {},
          child: const Text(
            '≡', // Trichotomy symbol (U+2261)
            style: TextStyle(fontSize: 30, color: kTextColor),
          ),
        )
      ],
    );
  }
}
