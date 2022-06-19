import 'package:flutter/material.dart';
/*
class MyTextInput extends StatefulWidget {
  @override
  MyTextInputState createState() => MyTextInputState();
}

class MyTextInputState extends State<MyTextInput>{
  final myTempController = TextEditingController();
  final myTimeController = TextEditingController();

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
                              return AlertDialog(content: Text(myTempController.text));
                            }
                        );
                      }
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                      child: const Icon(Icons.save),
                      onPressed: () {
                        stepList = List.empty(growable: true);
                        showDialog(
                            context: context,
                            builder: (context){
                              return AlertDialog(content: Text(myTempController.text));
                            }
                        );
                      }
                  )
                ],
              )
            ]
        )
    );
  }
}*/