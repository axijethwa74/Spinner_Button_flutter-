// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:loadingbutton/Buttons/Button1.dart';
import 'package:loadingbutton/Buttons/Button2.dart';

class MainButton extends StatefulWidget {
  const MainButton({Key? key}) : super(key: key);

  @override
  State<MainButton> createState() => _MainButtonState();
}

class _MainButtonState extends State<MainButton> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        body: Center(
          child: Column(
            children: const [
             Button1(),
             SizedBox(height: 5),
             Button2(),

            ],
          ),
        ),
      ),
    );
  }
}
