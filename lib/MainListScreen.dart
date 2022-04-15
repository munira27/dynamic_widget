import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MainListScreen extends StatefulWidget {
  String groupvalue;
  String optionValue;
   MainListScreen(this.groupvalue,this.optionValue ,{Key? key}) : super(key: key);

  @override
  _MainListScreenState createState() => _MainListScreenState();
}

class _MainListScreenState extends State<MainListScreen> {
  int groupValueitem=-1;
  List<RadioItem> items=<RadioItem>[];
  List<int> groupValue=<int>[];
  int mainIndex=0;

  List<int> selectedValues=[];

  @override
  void initState() {
    groupValue.add(int.parse(widget.groupvalue));
    for(int i=0;i<int.parse(widget.optionValue);i++)
      {
        items.add(RadioItem("value +"+i.toString(),i));

      }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title:Text("List Screen"),),
      body:SingleChildScrollView(
        child: Column(
          children: [
            Column(
               children:
                 List.generate(
                     int.parse(widget.groupvalue),
                         (index)
                     {

                       return Column(
                         children: [
                           Text("Main Item is $index",style:TextStyle(fontSize:20),),
                           Column(
                             children:List.generate(items.length, (indexs) {
                               mainIndex=indexs;
                               return Container(
                                // color:selectedValues.contains(items[indexs].index)?Colors.red:Colors.green,
                                 child: GestureDetector(
                                   onTap:()
                                   {
                                     if(!selectedValues.contains(items[indexs].index))
                                       {
                                         selectedValues.add(items[indexs].index);
                                       }
                                     else
                                       {
                                         selectedValues.add(items[indexs].index);
                                       }

                                   },
                                   child: Row(
                                     children: [
                                       Text("Radio Button Item "+items[indexs].name),
                                       Radio(
                                         groupValue:groupValueitem,
                                        // groupValue:groupValuess,
                                         value:items[indexs].index,
                                         onChanged: (val) => setState(() =>
                                         groupValueitem = items[indexs].index as int),
                                       )
                                     ],
                                   ),
                                 ),
                               );
                             }),
                           )

                         ],
                       );
                     }
                 ),


            ),
            Padding(
              padding:EdgeInsets.only(top:20),
              child: ElevatedButton(child:Text("Submit"),onPressed:()
              {
               for(int i=0;i<int.parse(widget.groupvalue);i++)
                 {
                   if(!selectedValues.contains(mainIndex))
                     {
                       Fluttertoast.showToast(msg: "please selecte values ${widget.groupvalue}");
                     }
                 }
              },
              ),
            )
          ],
        ),
      )

    );
  }
}

class RadioItem
{
  String name;
  int index;
  RadioItem(this.name,this.index);
}