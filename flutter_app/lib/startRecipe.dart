import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_app/runRecipe.dart';

class startRecipe extends StatefulWidget{

  @override
  _startRecipeState createState() => _startRecipeState();
}

class _startRecipeState extends State<startRecipe> {
  late String directory;
  int len = 0;
  List file = [];

  @override
  void initState() {
    super.initState();
    _listofFiles();
  }
  void refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("start recipe"),
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
                      "Select Recipe",
                      style: TextStyle(
                        fontSize: 30
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    SizedBox(
                      height: 400,
                      child: ListView.builder(
                        itemCount: file.length,
                        itemBuilder: (BuildContext context, int index){
                          return Column(
                            children: <Widget>[
                              ListTile(
                                title: Text(file[index].toString().substring(len,file[index].toString().length-5)),
                                subtitle: const Divider(
                                  height: 10,
                                  color: Colors.black,
                                  thickness: 0.5,
                                ),
                                onTap: (){
                                  print("yes");
                                  showDialog(
                                    context: context,
                                    builder: (context){
                                      return AlertDialog(
                                        content: SizedBox(
                                          height: 100,
                                          child: Column(
                                            children: <Widget> [
                                              Text(file[index].toString().substring(len,file[index].toString().length-5)+"을 선택합니까?"),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: <Widget> [
                                                  ElevatedButton(
                                                    child: const Icon(Icons.done),
                                                    onPressed: (){
                                                      Navigator.pop(context);
                                                      Navigator.push(
                                                          ctx,
                                                          MaterialPageRoute(builder: (ctx) => runRecipe(
                                                            fileName: file[index].toString().substring(len,file[index].toString().length-1),
                                                            dir: directory,
                                                          ))
                                                      );
                                                    }
                                                  ),
                                                  const SizedBox(
                                                    width: 50,
                                                  ),
                                                  ElevatedButton(
                                                      child: const Icon(Icons.close),
                                                      onPressed: (){
                                                        Navigator.pop(context);
                                                      }
                                                  ),
                                                ],
                                              )
                                            ]
                                          )
                                        ),
                                      );
                                  });
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ]
                          );
                        }
                      ),
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

  void _listofFiles() async {
    directory = (await getApplicationDocumentsDirectory()).path;
    setState(() {
      file = Directory(directory+"/saveRecipe").listSync();
    });
    //print(("File: '"+directory+"/saveRecipe/"));
    //print(file[0].toString());
    len = ("File: '"+directory+"/saveRecipe/").length;
  }
}