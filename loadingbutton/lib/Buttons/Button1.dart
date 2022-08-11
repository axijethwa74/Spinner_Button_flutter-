// ignore: unused_import
import 'package:flutter/material.dart';

class Button1 extends StatefulWidget {
  const Button1({Key? key}) : super(key: key);

  @override
  State<Button1> createState() => _Button1State();
}

class _Button1State extends State<Button1> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return  Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(32),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          textStyle: const TextStyle(fontSize: 18),
          minimumSize:  const Size(150, 80),
          shape: const StadiumBorder(),
        ),  
       child: isLoading ? Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children:  const [
          CircularProgressIndicator(color: Colors.white,),
         SizedBox(width: 15,),
          Text("Please Wait ..."),
        ],
       ): const Text('Push'),
         onPressed: () async {
          if(isLoading) return;
         setState(() => isLoading= true);
          await Future.delayed( const Duration(seconds:1),);
          setState(() => isLoading= false);
        },
       ),


    );
   
  }
}