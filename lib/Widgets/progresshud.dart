import 'package:flutter/material.dart';

class ProgressDialog extends StatelessWidget {
  final String? message;

  const ProgressDialog({Key? key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      //backgroundColor: blueColor(),
      child: Container(
        margin:const EdgeInsets.all(15.0),
        width: double.infinity,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(6.0),
            color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(children: <Widget>[
            const SizedBox(width: 6.0,),
            const CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.black),),
            const SizedBox(width: 26.0,),
            Text(message!,style:const TextStyle(color: Colors.black, fontSize: 15.0),)
          ],),
        ),
      ),


    );
  }





}
