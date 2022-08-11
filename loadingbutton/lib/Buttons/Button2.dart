import 'package:flutter/material.dart';

class Button2 extends StatefulWidget {
  const Button2({Key? key}) : super(key: key);
  

  @override
  State<Button2> createState() => _Button2State();
}
enum ButtonState{init,loading,done}
bool isStretched = false;
bool isDone = false;


// ignore: non_constant_identifier_names
Widget BuildSmallButton (isDone){
  // ignore: prefer_const_declarations, unused_local_variable, non_constant_identifier_names
  final Color = Colors.indigo;

  return Container(
    decoration:  BoxDecoration(
      shape:BoxShape.circle,
      color: isDone ? Colors.green :Colors.indigo,    
    ),
     child:  Center(
      child:isDone ? const Icon(Icons.done,
      size: 52,
      color: Colors.white,):
      const CircularProgressIndicator(color: Colors.white,)
      ),

  );
}



class _Button2State extends State<Button2> {
  ButtonState state= ButtonState.init;
  bool isAnimating = true;
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final isDone = state == ButtonState.done;
    // ignore: unused_local_variable
    final isStretched = isAnimating || state == ButtonState.done;


    final width = MediaQuery.of(context).size.width;
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(32),
      child: AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
      height: 70,
      width: state == ButtonState.init? width:70,
      onEnd: ()=> setState (()=>isAnimating =! isAnimating ),
      child: isStretched ? BuildButton() : BuildSmallButton(isDone),
      ),

    );
      
  }


  // ignore: non_constant_identifier_names
  Widget BuildButton() => OutlinedButton(
  style: OutlinedButton.styleFrom(
    shape: const StadiumBorder(),
    side: const BorderSide(width: 2, color: Colors.indigo),
  ),
  child: const FittedBox(
    child: Text("SUBMIT",
    style: TextStyle(
      fontSize: 20,
      color: Colors.indigo,
      letterSpacing: 1.5,
      fontWeight: FontWeight.bold,  
    ),
    ),
  ),
  onPressed: ()async{
    setState(() =>state == ButtonState.loading );
    await Future.delayed(const Duration(seconds: 3),);
    setState(() =>state == ButtonState.done );
    await Future.delayed(const Duration(seconds: 3),);
    setState(() =>state == ButtonState.init );
      },
 );
}