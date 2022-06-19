import 'dart:io';
import 'dart:async';

import 'package:flutter/material.dart';

class runRecipe extends StatefulWidget{
  var fileName;
  var dir;
  late File file;

  runRecipe({Key? key, this.fileName, this.dir}) : super(key: key);

  @override
  _runRecipeState createState() => _runRecipeState();
}

class _runRecipeState extends State<runRecipe> {
  String localIP = "192.168.56.1";
  int port = 5001;

  late Socket clientSocket;
  var testInput = 120;

  late Timer _timer;
  var _time = 0;

  var nowStep = 0;

  @override
  void initState() {
    super.initState();
    _connectServer();
    widget.file = File(widget.dir+"/saveRecipe/"+widget.fileName);
    print(widget.fileName);
    print(widget.dir);
    print(widget.file.path);
    readFile();
  }
  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
  void refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("run recipe"),
      ),
      body: SingleChildScrollView(
        child: Builder(
          builder: (BuildContext ctx) {
            return Center(
              child: Padding(
                padding:  const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      "AVD용 테스트 실행",
                      style: TextStyle(
                        fontSize: 40,
                      ),
                    ),
                    timer(),
                    SizedBox(
                      height: 50,
                    ),
                    screen(),
                    ElevatedButton(
                      child: Icon(Icons.forward),
                      onPressed: () {
                        play();
                      }
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _connectServer() async {
    clientSocket = await Socket.connect(localIP, port);
    clientSocket.write("connect");
  }

  void readFile() async {
    var str = await widget.file.readAsLines();
    print("--------recipe 내용----------");
    print(str);
    print(str[0]);
    var split = str[0].split('/');
    print(split);
  }

  void play() {
    _timer = Timer.periodic(Duration(milliseconds: 10), (timer) {
      setState(() {
        _time++;
      });
    });
  }

  Widget timer() {
    var sec = _time ~/ 100;
    var hundredth = '${_time % 100}'.padLeft(2, '0');

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      "$sec",
                      style: TextStyle(fontSize: 80),
                    ),
                    Text(
                      ".$hundredth",
                      style: TextStyle(fontSize: 30),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget screen() {
    return Container(
      child: const Text("Flir-one 영상 부분"),
    );
  }
}