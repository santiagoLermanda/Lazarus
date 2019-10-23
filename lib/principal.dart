import 'package:flutter/material.dart';
import './privadas.dart';
import './publicas.dart';


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                ListTile(title: Text('Favoritos'), onTap: (){

                },),
                ListTile(title: Text('Recomendados'), onTap: (){},),
              ],
            )
          ],
        ),
      ),


      appBar: AppBar(
          title: Text(widget.title),

      ),
      body: Center(
        child: ListView(
          children: <Widget> [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                    ListTile(title: Text('Privadas'), onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Privadas()));
                    }),
                    ListTile(title: Text('Publicas'), onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Publicas()));
                    }),

          ],
    )]))

    );
  }
}
