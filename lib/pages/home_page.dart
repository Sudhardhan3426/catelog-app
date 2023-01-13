import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:six_app/widgets/drawer.dart';
import 'package:six_app/widgets/item_widget.dart';
import 'package:six_app/models/catalog.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days =30;

  final  String name = "sudarshan";

  String? get source => null;

  get key => null;



  @override
  void  initState (){
    super.initState();
    loadData();

  }

  loadData()async{
    var catalogJson = await rootBundle.loadString("asset/files/catalog.json");
    var decodeData = jsonDecode(source!);

  }
  Widget build(BuildContext context) {
    final dummyList = List.generate(20, (index) =>CatalogModel.items[0]);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Catalog App",

        ),
      ),
      body:  Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
            itemCount:CatalogModel.items.length,
            itemBuilder: (context,index){
              return ItemWidget(key: key, item:dummyList[index]);
           },
         ),
      ),
      drawer: const MyDrawer(),
    );
  }
}







