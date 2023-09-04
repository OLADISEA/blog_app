import 'package:flutter/material.dart';

Widget reusableTextField(String text,void Function(String value)? func){
  return TextField(
    onChanged: (value)=> func?.call(value),
    decoration: InputDecoration(
      hintText: text,
    ),
  );
}


Widget reusableText(String text){
  return Text(text,
    style: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: Colors.grey.withOpacity(0.5)
    ),
  );
}

Widget generalButton(String text, VoidCallback? onTap){
  return GestureDetector(
    onTap: onTap,
    child: Container(
      margin: EdgeInsets.only(top: 30),
      padding: EdgeInsets.only(left: 12,right: 12,top: 10,bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.blue
      ),
      child: Text(text,
      style: TextStyle(
        fontSize: 15
      ),),
    ),
  );
}