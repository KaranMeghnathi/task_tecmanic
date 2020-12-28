
import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_tecmanic/Screens/MenuBar.dart';
import 'package:task_tecmanic/Screens/Store.dart';

class HomePage extends StatefulWidget{

  HomeState createState()=> HomeState();

}

class HomeState extends State<HomePage>with SingleTickerProviderStateMixin{

  bool isOpened = false;
  AnimationController _animationController;
  Animation<Color> _buttonColor;
  Animation<double> _animateIcon;
  Animation<double> _translateButton;
  Curve _curve = Curves.easeOut;
  double _fabHeight = 56.0;


  Future search(search) async {
    await Future.delayed(Duration(seconds: 2));
  }

  initState() {
    _animationController =
    AnimationController(vsync: this, duration: Duration(milliseconds: 500))
      ..addListener(() {
        setState(() {});
      });

    _animateIcon =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);

    _buttonColor = ColorTween(
      begin: Colors.blue,
      end: Colors.red,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.00,
        1.00,
        curve: Curves.linear,
      ),
    ));

    _translateButton = Tween<double>(
      begin: _fabHeight,
      end: -14.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.0,
        1.0,
        curve: _curve,
      ),
    ));
    super.initState();
  }

  @override
  dispose() {
    _animationController.dispose();
    super.dispose();
  }

  animate() {
    if (!isOpened) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
    isOpened = !isOpened;
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
        drawer: MenuBar(),
        appBar: AppBar(
          title:
          FlatButton(
            child: Text("Location"),
            onPressed:() => null,),
          actions: [

            IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: ()=> null,
            ),
          
          ],
        ),
        body:SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Stack(
              children: [
              Container(
                height: 600,
                child:  Column(
                  children: [
                    Container(
                      height: 100,
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: SearchBar(
                          hintText:"Find Products",
                          onSearch:(text) => search(search),
                        ),
                      ),
                    ),
                    SizedBox(height: 1,),
                    Container(child: Image.asset("assets/baby.jpg"),),
                    SizedBox(height: 10,),
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
                              RaisedButton(onPressed:()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>StoreScreen()),),
                                  child:Text("Himanshu General Store"),color: Colors.white,),

                              SizedBox(height: 20,),
                              Row(children: [

                          Card(
                            child:
                            IconButton(
                                icon: Icon(Icons.share,color: Colors.green,),
                                onPressed:() {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => StoreScreen(),));
                                },),
                          ),
                                SizedBox(width: 50,),

                                Column(children: [

                                  Text("1 Kms"),

                                  SizedBox(height: 5,),

                                  Text("Ratings :")
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

                    Card(
                      color: Colors.blue[100],
                      child: Row(
                  children: [

                    Card(
                      child:Image.asset("assets/medi.jpg",
                        width: 100,
                      ),
                    ),

                    SizedBox(width: 50,),

                    Column(
                      children: [
                        RaisedButton(child: Text("Medical Store"),onPressed: ()=> StoreScreen(),color: Colors.white,),

                        SizedBox(height: 20,),

                        Row(children: [

                          Card(child:
                          IconButton(
                              icon: Icon(Icons.share,color: Colors.green,),
                              onPressed: null),
                          ),

                          SizedBox(width: 50,),

                          Column(children: [
                            Text("1 Kms"),

                            SizedBox(height: 5,),

                            Text("Ratings :")
                          ],
                          ),
                        ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
                  ],
                ),
              ),

              Container(
                height: 650,
                alignment: Alignment.bottomRight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Transform(
                      transform: Matrix4.translationValues(
                        0.0,
                        _translateButton.value * 4.0,
                        0.0,
                      ),
                      child: FloatingActionButton(child: Icon(Icons.call),heroTag: null,onPressed: ()=> null,),
                    ),
                    Transform(
                      transform: Matrix4.translationValues(
                        0.0, 
                        _translateButton.value * 3.0, 
                        0.0,
                      ), 
                      child: FloatingActionButton(child: Icon(Icons.message),heroTag:null,onPressed: ()=> null,),
                    ), 

            //Per
                    Transform(
                      transform: Matrix4.translationValues(
                        0.0, 
                        _translateButton.value * 2.0, 
                        0.0,
                      ), 
                      child: FloatingActionButton(child: Icon(Icons.person_add_alt_1),heroTag: null,onPressed: ()=> null,),
                    ),

            //ShareBtn
                    Transform(
                      transform: Matrix4.translationValues(
                        0.0, 
                        _translateButton.value, 
                        0.0,
                      ), 
                      child: FloatingActionButton(child: Icon(Icons.share_outlined),heroTag: null,onPressed: ()=> null,),
                    ), 
                    FloatingActionButton(
                      backgroundColor: _buttonColor.value, 
                      onPressed: animate, 
                      tooltip: 'Toggle', 
                      child: AnimatedIcon(
                        icon: AnimatedIcons.menu_close, 
                        progress: _animateIcon,
                      ),
                    ),
                  ],
                ),
              ),
            ],
            ),
        ),
     );
  }
}