import 'package:flutter/material.dart';

class Privadas extends StatefulWidget {
  @override
  _PrivadasState createState() => _PrivadasState();
}

class _PrivadasState extends State<Privadas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Privadas'),),
      body:
      ListView(children:  <Widget>[

        Container(
          padding: const EdgeInsets.all(32),
          child: Row(
            children: [
              Expanded(
                /*1*/
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /*2*/
                    Container(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(
                        'A.M.E.N',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      'Neuquen, Argentina',
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                  ],
                ),
              ),
              /*3*/
              Icon(
                Icons.favorite,
                color: Colors.red,
              ),
              Text('41'),
            ],
          ),
        ),
      ],
      ),
    );

}
}
