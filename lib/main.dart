import 'package:flutter/material.dart';
import 'package:onchanged/nextPage.dart';

void main() => runApp(
  const MaterialApp(
    home: MyApp(),
  ),
);

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<MyApp> {
  String paramText = 'Enter something...';

  void _userNameChanged(String value) {
    setState(() {
      paramText = 'しばくぞ $value';
    });
  }

  void _userNameSubmitted(String value) {
    setState(() {
      paramText = 'Submitted $value';
    });
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Input Tests'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: <Widget>[
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Username',
                  hintText: 'Username',
                  icon: Icon(Icons.account_circle),
                ),
                autocorrect: false,
                autofocus: true,
                keyboardType: TextInputType.text,
                onChanged: _userNameChanged,
                onSubmitted: _userNameSubmitted,
              ),
              TextButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => NextPage(paramText: paramText))
                );

              }, child: const Text('次へ',
              style: TextStyle(
                fontSize: 25,
                color: Colors.grey
              ),)
              ),
            ]
          ),
        ),
      ),
    );
  }
}