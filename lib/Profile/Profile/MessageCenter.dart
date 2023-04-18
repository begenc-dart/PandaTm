import 'package:flutter/material.dart';

// import 'package:flutter_socket_io/flutter_socket_io.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:serpay/IpAdress.dart';
import 'package:serpay/Model/Colors.dart';
import 'package:serpay/Model/TextColor.dart';
import 'package:serpay/darkMode/theme_services.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'dart:convert';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:flutter/material.dart';

import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/io.dart';

import 'dart:convert';

import 'package:flutter/material.dart';

import '../../Language/Language.dart';
import 'AddMessage.dart';
import 'Userchat.dart';

class MessagesNot extends StatefulWidget {
  String nickname;
  String userid;
  LanguageModel languageModel;
  String url;
String? link;
  MessagesNot({required this.userid, required this.nickname,required this.languageModel,required this.url,this.link});

  State<MessagesNot> createState() => _MessagesNotState();
}

class _MessagesNotState extends State<MessagesNot> {
  @override
  List<UserChat> a = [];

  void initState() {
    // TODO: implement initState
    method();
    super.initState();
  }

  method() async {
    await UserChatGet().addresGet().then((value) {
      a = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    method();
    debugPrint("a" + a.toString());

    return FutureBuilder(
        future: UserChatGet().addresGet(),
        builder: (context, AsyncSnapshot<List<UserChat>> snapshot) {
          debugPrint(snapshot.data.toString());
          if (snapshot.hasData) {
            return MessageCenter(
              id: widget.userid,
              message: snapshot.data!,
              nickname: widget.nickname, languageModel: widget.languageModel,url: widget.url,
              link: widget.link==null?"":widget.link,
            );
          } else {
            return Scaffold(body: Center(child: Container()));
          }
        });
  }
}

class MessageCenter extends StatefulWidget {
  // const MessageCenter({Key? key}) : super(key: key);
  // final WebSocketChannel? channel;
  // MessageCenter (this.channel);
  List<UserChat> message = [];
  String id;
  String nickname;
  LanguageModel languageModel;
  String url;
  String? link;
  MessageCenter(
      {required this.id, required this.message, required this.nickname,required this.languageModel,required this.url,this.link});

  @override
  _MessageCenterState createState() => _MessageCenterState();
}

class _MessageCenterState extends State<MessageCenter> {
  Colrs colrs = Colrs();
  TextEditingController message = TextEditingController();

  // late String _message;
  @override
  late IO.Socket socket;

  _sendMessage() {
    debugPrint(message.text.trim() + widget.id + widget.nickname);
    socket.emit("send-chat-message", {
      "message": message.text.trim(),
      "user_id": widget.id,
      "nickname": "admin"
    });

    message.clear();
  }

  _connectSocket() {
    socket.onConnect((data) => debugPrint("Connection"));
    socket.onError((data) => debugPrint("COnnect $data"));
    socket.onDisconnect((data) => debugPrint("co $data"));
    debugPrint("isledi");
    socket.on("receive-message", (data) {
      widget.message.insertAll(0,[UserChat(
          text: data["message"],
          id: 1,
          userId1: "userId1",
          userId2: "userId2",
          isYou: false,
          createdAt: null,
          updatedAt: null)]);
      setState(() {});
    });
  }

  @override
  void initState() {
    message = TextEditingController(text: widget.link);
    socket = IO.io(
        '${IpAddress().ipAddress}',
        IO.OptionBuilder().setTransports(["websocket"]).setQuery(
            {"user_id": widget.id}).build());
    debugPrint(widget.id + "sdfasd");
    socket.emit("login", {"user_id": widget.id});
    //Initializing the message list

    _connectSocket();

    super.initState();
  }

  chat() async {
    await UserChatGet().addresGet().then((value) {
      a = value;
    });
  }

  void dispose() {
    // socket.disconnect();
    // socket.dispose();
    // TODO: implement dispose
    // widget.channel.sink.close();
    // socket.dispose();
    super.dispose();
  }

  final ScrollController _controller = ScrollController();

// This is what you're looking for!
  void _scrollDown() {
    _controller.animateTo(_controller.position.minScrollExtent,
        curve: Curves.linear, duration: Duration(milliseconds: 500));
  }

  List<UserChat> a = [];

  @override
  Widget build(BuildContext context) {
    // _connectSocket();
    // debugPrint("dsfsf" + productIndex.message.toString());
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          backgroundColor: ThemeServices().theme == ThemeMode.dark
              ? Color.fromRGBO(39, 39, 39, 1)
              : Color.fromRGBO(250, 250, 250, 1),
          elevation: 1,
          title: Text(
            widget.languageModel.profileDetails.admin,
            style: CustomTextStyle.profiledettails(context),
          ),
        ),
        body: SingleChildScrollView(
            child: Container(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
              Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height - 166,
                  child: ListView.builder(
                    controller: _controller,
                    keyboardDismissBehavior:
                        ScrollViewKeyboardDismissBehavior.onDrag,
                    reverse: true,
                    physics: const BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return widget.message[index].isYou != true
                          ? Padding(
                              padding: EdgeInsets.only(
                                  left: 15,
                                  // right: 45,
                                  top: 15,
                                  bottom: 15),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  IntrinsicWidth(
                                    child: Container(
                                      // width: double.infinity,
                                      // width:
                                      // MediaQuery.of(context).size.width,
                                      // height: 92,

                                      alignment: Alignment.centerLeft,
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          color: ThemeServices().theme ==
                                                  ThemeMode.dark
                                              ? Color.fromRGBO(55, 55, 55, 1)
                                              : colrs.tmcolo,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                              color: colrs.photodotOffCol,
                                              width: 1)),
                                      child: Text(
                                        widget.message[index].text,
                                        style:
                                            CustomTextStyle.chatwhite(context),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                IntrinsicWidth(
                                  child: Container(
                                    // width:
                                    // MediaQuery.of(context).size.width,
                                    // height: 92,
                                    margin: EdgeInsets.only(
                                        left: 45,
                                        right: 15,
                                        top: 15,
                                        bottom: 15),
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        color: ThemeServices().theme ==
                                                ThemeMode.dark
                                            ? Color.fromRGBO(255, 20, 29, 0.45)
                                            : colrs.message,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Text(
                                      widget.message[index].text,
                                      style: CustomTextStyle.chatred(context),
                                    ),
                                  ),
                                ),
                              ],
                            );
                    },
                    itemCount: widget.message.length,
                  )),
              Container(
                // height: 80,
                // width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: ThemeServices().theme == ThemeMode.dark
                        ? Color.fromRGBO(55, 55, 55, 1)
                        : colrs.tmcolo),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width - 80,
                        child: TextField(
                          textAlignVertical: TextAlignVertical.center,
                          controller: message,
                          minLines: null,
                          maxLength: null,
                          // cursorColor: Color.fromRGBO(104, 109, 118, 1),
                          // keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            // hintStyle:CustomTextStyle.fieldmax(context),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1,
                                  color: Color.fromRGBO(229, 229, 229, 1)),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1, color: Colors.blue),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            filled: true,
                            fillColor: ThemeServices().theme == ThemeMode.dark
                                ? Color.fromRGBO(45, 45, 45, 1)
                                : Color.fromRGBO(255, 255, 255, 1),
                            errorStyle: CustomTextStyle.error(context),
                            // hintText: "min",
                          ),
                          // validator: (jog) {
                          //   if (jog!.length == 0) {
                          //     return "full";
                          //   } else {
                          //     return null;
                          //   }
                          // },
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        if (message.text.trim().isNotEmpty) {
                          debugPrint(message.text);
                          // _scrollDown();
                          widget.message.insertAll(0,[UserChat(
                              text: message.text.trim(),
                              id: 1,
                              userId1: '',
                              userId2: '',
                              isYou: true,
                              createdAt: null,
                              updatedAt: null)]);

                          _sendMessage();
                          setState(() {

                          });
                          _controller.animateTo(
                            _controller.position.minScrollExtent,
                            duration: Duration(milliseconds: 100),
                            curve: Curves.easeOut,);
                        }

                      },
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: colrs.mainColo),
                        child: Center(
                            child: SvgPicture.asset(
                          "asset/productIcon/Vector (1).svg",
                          width: 20,
                          height: 20,
                        )),
                      ),
                    )
                  ],
                ),
              )
            ]))));
  }
// _sendMyMessage(){
//   if(message.text.isNotEmpty){
//     print(message.text);
//     widget.channel.sink.add(message.text);
//     setState(() {
//
//     });
//   }
// }
}
