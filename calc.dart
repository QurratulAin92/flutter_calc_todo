import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:math_expressions/math_expressions.dart';


class Calculator extends StatefulWidget {
  
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {

     var result = "";

     Widget button(var text){
      return ElevatedButton(onPressed:(){
        setState(() {
          result = result + text;
        }

        );
      
    
} , child: Text(text));
}
clear(){
  setState(
    () {
      result="";
    }
  );
}
equal(){
  Parser p = Parser();
  Expression exp = p. parse(result);
  ContextModel cm = ContextModel();
  double eval = exp. evaluate(EvaluationType.REAL, cm);
  
  setState((){
    result = eval.toString();
  }

  );

}


     

     

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: [
        
          
          Container(
          child:
          (Text("Calculator",style:
           TextStyle(color:Colors.black,fontWeight:FontWeight.bold,fontSize: 50,backgroundColor:Colors.grey ),)
           
        )),
        Container(
          child: (
            Text(result , style:
           TextStyle(color:Colors.black,fontWeight:FontWeight.bold,fontSize: 30,backgroundColor:Colors.grey )
           ,)
           
          ),

        ),

        Center(
          child: Container(
            margin:EdgeInsets.only(bottom:10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,                     
              
              children: [
               
                button("1"),
                button("2"),
                button("3"),
                button("4"),
              ],),
          ),
        ),

         Center(
           child: Container(
              margin:EdgeInsets.only(bottom:10),
            child: Row(

              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                button("5"),
                button("6"),
                button("7"),
                button("8"),
              ],),
        ),
         ),

         Center(
           child: Container(
              margin:EdgeInsets.only(bottom:10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                button("9"),
                button("0"),
                button("/"),
                button("*"),
              ],
              ),
        ),
         ),

             Container(
                margin:EdgeInsets.only(bottom:10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
              button("+"),
              button("-"),
              ElevatedButton(onPressed: equal, child: Text("=")),
              ElevatedButton(
                onPressed: clear, child: Text("clear")
              )
            ],
            ),
        
             
      ), 
        ]
  
    ),
    );
  }
}



