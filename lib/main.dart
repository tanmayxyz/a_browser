import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

void main(List<String> args) {
  runApp(MyApp());
}

String url="https://google.com" ;


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: MyHome(),
        theme: ThemeData.dark(),
        routes: {
          "/home" : (BuildContext context) => MyHome() ,
          "/homepage" : (_) {
            return WebviewScaffold(
              url: url,
              appBar: AppBar(
                title: Text(url),
              ),
              withJavascript: true,
              appCacheEnabled: true,
              withZoom: true,

            );
          }

        }
    );
  }
}

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {

  var webview = FlutterWebviewPlugin();
  TextEditingController textEditingController;

  @override
  void initState() {
    webview.close();
    textEditingController = TextEditingController(text: "www.google.com");

    super.initState();
    textEditingController.addListener((){
      url = "https://"+textEditingController.text;
    });
  }

  @override
  void dispose() {
    webview.dispose();
    super.dispose();
    textEditingController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("An browser"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[

            Container(

              padding: EdgeInsets.all(12.0),
              child: TextField(
                controller: textEditingController,


              ),

            ),
            RaisedButton(
              child: Text("Open"),
              onPressed: (){
                Navigator.pushNamed(context, "/homepage");
              },
            )
          ],

        )
    );
  }
}

