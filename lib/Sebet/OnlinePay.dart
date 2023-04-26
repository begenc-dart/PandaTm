import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:url_launcher/url_launcher.dart';

import '../IpAdress.dart';
class OnlinePay extends StatefulWidget {

String id;
double payment;
OnlinePay({required this.id,required this.payment});
  @override
  State<OnlinePay> createState() => _OnlinePayState();
}

class _OnlinePayState extends State<OnlinePay> {
  @override
  @override
  late IO.Socket socket;

  Future<void> openUrl(String url) async {
    final _url = Uri.parse(url);
    if (!await launchUrl(_url, mode: LaunchMode.externalApplication)) { // <--
      throw Exception('Could not launch $_url');
    }
  }

  _connectSocket() {
    socket.onConnect((data) => debugPrint("Connection"));
    socket.onError((data) => debugPrint("COnnect $data"));
    socket.onDisconnect((data) => debugPrint("co $data"));
    debugPrint("isledi");
socket.on("link", (data) {
  debugPrint(data);
  openUrl(data);
});
      setState(() {});


  }
  void initState() {



    super.initState();
  }
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(children: [
         InkWell(
           onTap: (){
             socket = IO.io(
                 '${IpAddress().ipAddress}',
                 IO.OptionBuilder().setTransports(["websocket"]).setQuery({}
                 ).build());
             // debugPrint(widget.id + "sdfasd");
             socket.emit("kart-halk", {"orderId": widget.id,"amount":widget.payment});
             //Initializing the message list


             _connectSocket();
           },
           child:  paymantType(),
         )
        ],),
      ),
    );
  }
  paymantType(){
    return ListTile(
      title: Text("Halkbank"),
    );
  }
}
