import 'package:flutter/material.dart';
import 'package:flutter_app/makeRecipe.dart';
import 'package:flutter_app/startRecipe.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget{
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{
  @override
  void initState(){
    super.initState();
  }
  void refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text("main home"),
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
                const SizedBox(
                  height: 400,
                ),
                ElevatedButton(
                  child: const Text("Start"),
                  onPressed: () {
                    print("Start");
                    Navigator.push(
                        ctx,
                        MaterialPageRoute(builder: (ctx) => startRecipe())
                    );
                    //_MyHomePageState.refresh();
                  },
                ),
                const SizedBox(
                  height: 100,
                ),
                ElevatedButton(
                  child: const Text("Make Recipe"),
                  onPressed: () {
                    print("Recipe Make");
                    Navigator.push(
                      ctx,
                      MaterialPageRoute(builder: (ctx) => makeRecipe())
                    );
                    //_MyHomePageState.refresh();
                  },
                ),
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
