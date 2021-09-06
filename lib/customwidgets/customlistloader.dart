import 'package:flutter/material.dart';
class CustomListLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(15,(index){
        return   Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(height: 40,color: Colors.black12,width: double.infinity),
        );
      }),
    );
  }
}
