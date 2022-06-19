import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
//import 'package:flutter_app/TextInput.dart';

var stepList = List.empty(growable: true);
var dir;
var fileName;

class makeRecipe extends StatefulWidget{
  @override
  _makeRecipeState createState() => _makeRecipeState();
}

class _makeRecipeState extends State<makeRecipe>{

  @override
  void initState(){
    super.initState();
    _getDir();
  }
  void refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("make Recipe"),
      ),
      body: SingleChildScrollView(
        child: Builder(
          builder: (BuildContext ctx) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 300,
                      child: ListView(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        children: getContent(),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    MyTextInput(notifyParent: refresh),
                  ],
                ),
              ),
            );
          },
        )
      )
    );
  }
}

class MyTextInput extends StatefulWidget {
  const MyTextInput({required this.notifyParent});
  final Function() notifyParent;

  @override
  MyTextInputState createState() => MyTextInputState();
}

class MyTextInputState extends State<MyTextInput>{
  final myTempController = TextEditingController();
  final myTimeController = TextEditingController();
  final myFileNameController = TextEditingController();

  @override
  Widget build(BuildContext context){
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text('온도'),
          TextField(
            controller: myTempController,
          ),
          const SizedBox(
            height: 10,
          ),
          const Text("시간"),
          TextField(
            controller: myTimeController,
          ),
          Row(
            children: <Widget>[
              ElevatedButton(
                  child: const Icon(Icons.done),
                  onPressed: () {
                    stepList.add([myTimeController.text, myTempController.text]);
                    print(stepList);
                    print("add : "+myTimeController.text+", "+myTempController.text);
                    showDialog(
                      context: context,
                      builder: (context){
                        return const AlertDialog(content: Text("done"));
                      }
                    );
                    widget.notifyParent();
                  },
              ),
              const SizedBox(
                width: 10,
              ),
              ElevatedButton(
                  child: const Icon(Icons.save),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context){
                        return AlertDialog(
                          title: Column(
                            children: const <Widget>[
                              Text("Save Recipe"),
                            ],
                          ),
                          content: SizedBox(
                            height: 150,
                            child: Column(
                              children: <Widget>[
                                TextField(
                                  controller: myFileNameController,
                                  decoration: const InputDecoration(labelText: '레시피의 이름을 입력하세요.'),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                ElevatedButton(
                                    child: const Icon(Icons.save),
                                    onPressed: () {
                                      fileName = myFileNameController.text;
                                      saveRecipe();
                                      print("delay");
                                      stepList = List.empty(growable: true);
                                      print("비움");
                                      widget.notifyParent();/*
                                      Future.delayed(const Duration(milliseconds: 500), () {
                                        print("delay");
                                        stepList = List.empty(growable: true);
                                        print("비움");
                                        widget.notifyParent();
                                      });*/
                                      Navigator.pop(context);
                                    })
                              ],
                            ),
                          ) //const Text("done")
                        );
                      }
                    );
                  },
              )
            ],
          )
        ]
      )
    );
  }
}

class Step{
  Step(this.temper, this.time);

  String temper;
  String time;
}

class StepTile extends StatelessWidget{
  StepTile(this._step);

  final Step _step;

  @override
  Widget build(BuildContext context){
    return ListTile(
      title: Text(_step.temper+'ºC  /'+_step.time+'초'),
      subtitle: const Divider(
        height: 10,
        color: Colors.black,
        thickness: 0.5,
      ),
    );
  }
}

void _getDir() async {
  dir = (await getApplicationDocumentsDirectory());
  print(dir.path);
  print("create file");
  Directory(dir.path + '/saveRecipe/').create(recursive: true);
}

void saveRecipe() {
  var str = "";
  for (var element in stepList) {
    str += element[0] + "/" + element[1] + "\n";
  }
  print(str);
  File(dir.path + '/saveRecipe/'+fileName+'.txt').writeAsStringSync(str);
  print("write file");
}

List<Widget> getContent() {
  List<Widget> tiles = [];
  if(stepList.isEmpty) {
    tiles.add(const Text("empty"));
  } else {
    for (var element in stepList) {
      tiles.add(StepTile(Step(element[0], element[1])));
    }
  }
  return tiles;
}