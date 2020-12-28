import 'package:flutter/material.dart';

class MenuBar extends StatefulWidget{

  MenuState createState()=> MenuState();

}

class MenuState extends State<MenuBar>{

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 150,
        child:Card(
          color: Colors.blueGrey[200],
          child:ListView(
            children: <Widget>[
              ListTile (
                selected: true,
                title:Icon(Icons.menu,size: 30,color: Colors.black,),
                contentPadding: EdgeInsets.only(left: 20),
                leading:Text('MENU',style: TextStyle(color: Colors.black,fontSize: 18),),
                onTap: () {Navigator.pop(context);},
              ),
            ],
          ),
        ),
    );
  }
}