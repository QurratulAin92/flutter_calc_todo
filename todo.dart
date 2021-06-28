import 'package:flutter/material.dart';


class Todo extends StatefulWidget {


  @override
  _TodoState createState() => _TodoState();
}

class _TodoState extends State<Todo> {

    
  List <dynamic> lst = [1,2,3];
  var output = "";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
              // appBar: AppBar(
              //   title: Text("TO-DO App") ,

              // ),

              body: ListView.builder(
                itemCount: lst.length,
                itemBuilder: (context, index){
                  return Container(
                    height: 70,
                    color: Colors.red,
                    margin: EdgeInsets.only(top : 20),
                    child: ListTile(
                      title: Text("${lst[index]}", style:
                                TextStyle(color:Colors.white, fontWeight:FontWeight.bold, fontSize: 20, )),
                      trailing: 
                          Row(
                            children: [
                             GestureDetector(onTap:(){
                             showDialog(context: context,builder:(context){
                             return AlertDialog(
                             title: Text("Edit Items"),
                             content:TextField
                             (onChanged: (value){
                               output = value;  },),
                               actions:[
                               ElevatedButton(onPressed: () {
                                setState((){
                               lst.replaceRange(index, index+1,{output});
                               });}, child:Text("Edit"))
                         ]);},);  }, child: Icon(Icons.edit)),
                               
                               GestureDetector(onTap:(){
                                   setState((){
                               lst.removeAt(index);});
                              }, child: Icon(Icons.delete)),
                                  ],),),);},),  

                        floatingActionButton: FloatingActionButton(onPressed: (){
                        showDialog(context: context,builder:(context){
                        return AlertDialog(
                        title: Text("Add Items"),
                        content:TextField
                        (onChanged: (value){
                        output = value;},),
                         actions:[
                           ElevatedButton(onPressed: () {
                             setState((){
                               lst.add(output); } );}, 
                               child:Text("Add"))]
                                );}, ); }, ),
                                 );}}