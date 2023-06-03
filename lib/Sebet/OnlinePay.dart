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
    return Scaffold(
      appBar: AppBar(title: Text("Online töleg"),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
         child:  paymantType("Halkbank","https://halkbank.gov.tm/storage/app/uploads/public/613/5a1/3c5/6135a13c5348c249294197.png"),
       ),
        InkWell(
          onTap: (){
            socket = IO.io(
                '${IpAddress().ipAddress}',
                IO.OptionBuilder().setTransports(["websocket"]).setQuery({}
                ).build());
            // debugPrint(widget.id + "sdfasd");
            socket.emit("kart-senagat", {"orderId": widget.id,"amount":widget.payment});
            //Initializing the message list


            _connectSocket();
          },
          child:  paymantType("Senagat bank","https://www.rysgalbank.com.tm/storage/images/PlasticCard_image/8b022dd5c7cdabff9ebae02bb6d78bac.jpg"),
        ),
        InkWell(
          onTap: (){
            socket = IO.io(
                '${IpAddress().ipAddress}',
                IO.OptionBuilder().setTransports(["websocket"]).setQuery({}
                ).build());
            // debugPrint(widget.id + "sdfasd");
            socket.emit("kart-rysgal", {"orderId": widget.id,"amount":widget.payment});
            //Initializing the message list


            _connectSocket();
          },
          child:  paymantType("Rysgal bank","https://www.senagatbank.com.tm/img/cards/kartlar/altyn_asyr_kart.webp"),
        ),
      ],),
    );
  }
  paymantType(String a,String b){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: ListTile(
          leading:  Image.network(b),
          title: Text(a),
          subtitle: Text("Goyum kart,altyn asyr kart"),
        ),
      ),
    );
  }
}
