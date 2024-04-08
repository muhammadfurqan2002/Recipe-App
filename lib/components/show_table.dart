import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShowTable{
  static Future showTable(BuildContext context)async{
      final h=MediaQuery.of(context).size.height;
      final w=MediaQuery.of(context).size.width;
    return showDialog(context: context, builder:(context){
      return AlertDialog(
        contentPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          side:const BorderSide(
            color: Colors.white,
            width: 3
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        backgroundColor: Colors.redAccent,
        title: Center(
          child: Padding(padding: EdgeInsets.only(bottom: 18),
            child: Text("Unit Conversion Chart ",style: TextStyle(
                fontWeight: FontWeight.bold,
                color:Colors.white,
              fontSize: w*.05
            ),),
          ),
        ),
        content: Container(
          height: 300,
          decoration:const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10)
              )
          ),
          child: Column(
             mainAxisSize: MainAxisSize.min,
            children: [
              Table(
                border: TableBorder.all(width: 2,color: Colors.white,style: BorderStyle.solid),
                children: const[
                  TableRow(
                      children: [
                    BuildTableCell(text1:"CUP" , text2: "(cup)", ),
                    BuildTableCell(text1:"OUNCE" , text2: "(oz)", ),
                    BuildTableCell(text1:"TABLE" , text2: "SPOON",text3: "(tbsp)", ),
                    BuildTableCell(text1:"TEA" , text2: "SPOON",text3: "(tsp)", ),
                    BuildTableCell(text1:"MILLI" , text2: "LITRE",text3: "(ml)", ),
                  ]),
                  TableRow(
                      children: [
                    BuildTableCell(text1:"CUP" , text2: "(cup)", ),
                    BuildTableCell(text1:"OUNCE" , text2: "(oz)", ),
                    BuildTableCell(text1:"TABLE" , text2: "SPOON",text3: "(tbsp)", ),
                    BuildTableCell(text1:"TEA" , text2: "SPOON",text3: "(tsp)", ),
                    BuildTableCell(text1:"MILLI" , text2: "LITRE",text3: "(ml)", ),
                  ]),TableRow(
                      children: [
                    BuildTableCell(text1:"CUP" , text2: "(cup)", ),
                    BuildTableCell(text1:"OUNCE" , text2: "(oz)", ),
                    BuildTableCell(text1:"TABLE" , text2: "SPOON",text3: "(tbsp)", ),
                    BuildTableCell(text1:"TEA" , text2: "SPOON",text3: "(tsp)", ),
                    BuildTableCell(text1:"MILLI" , text2: "LITRE",text3: "(ml)", ),
                  ]),TableRow(
                      children: [
                    BuildTableCell(text1:"CUP" , text2: "(cup)", ),
                    BuildTableCell(text1:"OUNCE" , text2: "(oz)", ),
                    BuildTableCell(text1:"TABLE" , text2: "SPOON",text3: "(tbsp)", ),
                    BuildTableCell(text1:"TEA" , text2: "SPOON",text3: "(tsp)", ),
                    BuildTableCell(text1:"MILLI" , text2: "LITRE",text3: "(ml)", ),
                  ]),
                ],
              ),
              Center(
                child: Text("Weight chart",style: TextStyle(
                  fontSize: w*.05,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),),
              ),
              Table(
                    border: TableBorder.all(width: 2,
                        color: Colors.white,
                        style: BorderStyle.solid),

                  children:const [
                    TableRow(
                      children: [
                        BuildTableCell(text1: "1000", text2:"gran"),
                        BuildTableCell(text1: "1", text2:"Kilogram"),
                        BuildTableCell(text1: "2.2", text2:"Pound"),
                        BuildTableCell(text1: "235.74", text2:"Pound")
                      ]
                    )
                  ],
              ),
          ],
          ),
        ), 
        
      );
    });
  }
}


class BuildTableCell extends StatelessWidget {
  final String text1,text2;
  final String? text3;
  const BuildTableCell({super.key,required this.text1,required this.text2,this.text3});

  @override
  Widget build(BuildContext context) {
    final h=MediaQuery.of(context).size.height;
    final w=MediaQuery.of(context).size.width;
    return TableCell(child: Container(
      color: Colors.redAccent,
      width: w*.4,
      height: h*.1,
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          Text(text1,style: TextStyle(fontSize: 8,color: Colors.white),),
          Text(text2,style: TextStyle(fontSize: 8,color: Colors.white),),
          if(text3!=null)
            Text(text1,style: TextStyle(fontSize: 8,color: Colors.white),)
        ],
      ),
    ));
  }
}
