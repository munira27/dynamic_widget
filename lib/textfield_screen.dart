import 'package:dynamic_widget/MainListScreen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class TextFielsScreen extends StatefulWidget {
  const TextFielsScreen({Key? key}) : super(key: key);

  @override
  _TextFieldState createState() => _TextFieldState();
}

class _TextFieldState extends State<TextFielsScreen> {
  TextEditingController groupValue=TextEditingController();
  TextEditingController optionValue=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title:Text("TextField Screen"),),
      body:Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment:MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration:InputDecoration(hintText:"No of Group"),
              controller: groupValue,
              keyboardType:TextInputType.number,
            ),
            Padding(
              padding: const EdgeInsets.only(top:15),
              child: TextFormField(
                decoration:InputDecoration(hintText:"No of Option"),
                controller: optionValue,
                keyboardType:TextInputType.number,
              ),
            ),
            Padding(
              padding:EdgeInsets.only(top:20),
              child: ElevatedButton(child:Text("Generate"),onPressed:()
                  {
                    if(groupValue.text.isEmpty)
                      {
                        Fluttertoast.showToast(msg:"Please enter group value");
                      }
                    else if(optionValue.text.isEmpty)
                    {
                      Fluttertoast.showToast(msg:"Please enter option value");
                    }
                    else if(int.parse(groupValue.text)>int.parse(optionValue.text))
                      {
                        print("hi");
                      Fluttertoast.showToast(msg:"Group value must be less than option value");
                      }
                    else
                      {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) {
                              return MainListScreen(groupValue.text,optionValue.text);
                            }
                        ));
                      }

                  },
              ),
            )
          ],
        ),
      ),
    );
  }
}

