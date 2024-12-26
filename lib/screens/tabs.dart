import 'package:flutter/material.dart';

class TabScreen extends StatefulWidget{

const TabScreen({super.key}) ;

@override
  State<StatefulWidget> createState() {
    return _TabState() ;
    
  }
}


class _TabState extends State<TabScreen>{
@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         
      title :Text("data"),
    ));
  }
}