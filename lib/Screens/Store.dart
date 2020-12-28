import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/getwidget.dart';

class StoreScreen extends StatefulWidget{

  StoreState createState()=> StoreState();

}

class StoreState extends State<StoreScreen>{

  String  _dropDown= "1gm";
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
          home: Scaffold(
            appBar: AppBar(
            leading: IconButton(icon: Icon(Icons.keyboard_backspace),color: Colors.white,onPressed: ()=> Navigator.pop(context),),
              title: Text("Himanshu General"),
              actions: [
                IconButton(
                    icon: Icon(Icons.shopping_cart),
                    onPressed: ()=> Navigator.push(context,
                        MaterialPageRoute(builder: (context) => StoreScreen())))],
            ),
            body: SingleChildScrollView(
              child: Container(
              child: Column(
                children: [
                  Image.asset("assets/bucket.jpg"),

                  Card(
                    color: Colors.blue[100],
                    child:
                    Row(
                      children: [
                        Card(
                          child:Image.asset("assets/bucket.jpg",
                            width: 100,
                          ),
                        ),
                        SizedBox(width: 50,),
                        Column(
                          children: [

                            Text("Product Name"),
                            SizedBox(height: 2,),
                            Text("About Product",style: TextStyle(fontSize: 10),),
                            SizedBox(height: 10,),
                            Row(children: [

                              Card(
                                  child:DropdownButton<String>(

                                      items: <String>['1gm', '10gm', '500gm', '1kg'].map((String value) {
                                        return new DropdownMenuItem<String>(
                                          value: value,
                                          child: new Text(value),
                                        );
                                      }).toList(),
                                      value: _dropDown,
                                      onChanged: (String value) {
                                        setState(() {
                                          _dropDown = value;
                                        });}
                                  )
                              ),
                              SizedBox(width: 50,),
                              Column(children: [

                                IconButton(icon: Icon(Icons.share_outlined),iconSize: 20, onPressed:()=> null),
                                GFButton(

                                  text:"Add",
                                  textColor: Colors.blue,
                                  icon: Icon(Icons.add_circle_rounded,),
                                  type: GFButtonType.solid,
                                  color: Colors.blue[500],
                                  shape: GFButtonShape.pills,
                                ),
                              ],
                              ),
                            ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Card(
                    color: Colors.blue[100],
                    child:
                    Row(
                      children: [
                        Card(
                          child:Image.asset("assets/bucket.jpg",
                            width: 100,
                          ),
                        ),
                        SizedBox(width: 50,),
                        Column(
                          children: [

                            Text("Product Name"),
                            SizedBox(height: 2,),
                            Text("About Product",style: TextStyle(fontSize: 10),),
                            SizedBox(height: 10,),
                            Row(children: [

                              Card(
                                  child:DropdownButton<String>(

                                      items: <String>['1gm', '10gm', '500gm', '1kg'].map((String value) {
                                        return new DropdownMenuItem<String>(
                                          value: value,
                                          child: new Text(value),
                                        );
                                      }).toList(),
                                      value: _dropDown,
                                      onChanged: (String value) {
                                        setState(() {
                                          _dropDown = value;
                                        });}
                                  )
                              ),
                              SizedBox(width: 50,),
                              Column(children: [

                                IconButton(icon: Icon(Icons.share_outlined),iconSize: 20, onPressed:()=> null),
                                GFButton(

                                  text:"Add",
                                  textColor: Colors.blue,
                                  icon: Icon(Icons.add_circle_rounded,),
                                  type: GFButtonType.solid,
                                  color: Colors.blue[500],
                                  shape: GFButtonShape.pills,
                                ),
                              ],
                              ),
                            ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 10,),

                  Container(
                    height: 40,
                    width: double.infinity,
                    padding: EdgeInsets.only(top: 9,left: 20),
                    child:Text("Best Deals",style: TextStyle(fontSize: 18),),

                    color: Colors.grey[300],),
                  Container(
                    padding: EdgeInsets.only(left: 70,),
                    child:
                    Row(
                      children: [
                        GFButton(
                          color: Colors.deepOrange,
                          size: 35,
                          shape: GFButtonShape.pills,
                          text: "Deal Of the day",
                        ),

                        SizedBox(width: 20,),

                        GFButton(
                          shape: GFButtonShape.pills,
                          icon: Icon(Icons.pedal_bike_rounded),
                          text: "Delivery Charges",
                        ),
                      ],
                    ),
                  ),

                  Container(
                    height: 25,
                    width: double.infinity,
                    padding: EdgeInsets.only(top: 6,left: 20),
                    child:Text("Top Categories",style: TextStyle(fontSize: 12,),),

                    color: Colors.grey[300],),
                  SizedBox(height: 10,),
                  Container(
                    padding: EdgeInsets.only(left: 70,),
                    child:
                    Row(
                      children: [
                        Card(
                          child: Column(children: [
                            Image.asset("assets/bucket.jpg",height: 70,),
                            Padding(padding: EdgeInsets.all(5),child:
                            Text("Deals Need",style: TextStyle(fontSize: 15),),
                            ),
                          ],
                          ),
                        ),
                        SizedBox(width: 20,),
                        Card(
                          child: Column(children: [
                            Padding(padding: EdgeInsets.only(top: 5),child:Image.asset("assets/bucket.jpg",height: 70,),),
                            Padding(padding: EdgeInsets.all(5),child:
                            Text("Water & Drinks",style: TextStyle(fontSize: 15),),
                            ),
                          ],
                          ),
                        ),
                        SizedBox(height: 50,),

                      ],
                    ),
                  ),


                ],
              ),
            ),),
        ),
    );
  }

}