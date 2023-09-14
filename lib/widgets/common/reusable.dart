import 'package:flutter/material.dart';

Widget reusableTextField(String text,void Function(String value)? func){
  return Container(
    margin: const EdgeInsets.only(left: 20,right: 20),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 1,
          blurRadius: 2,
          offset: const Offset(0, 1),
        ),
      ],
    ),
    child: TextField(
      onChanged: (value)=> func?.call(value),
      decoration: InputDecoration(
        hintText: text,
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))
        )
      ),
    ),
  );
}


Widget reusableText({required String text,double? size}){
  return Text(text,
    style: TextStyle(
        fontSize: size??15,
        fontWeight: FontWeight.bold,
        color: Colors.grey.withOpacity(0.5)
    ),
  );
}

Widget generalButton(String text, VoidCallback? onTap){
  return GestureDetector(
    onTap: onTap,
    child: Container(
      margin: const EdgeInsets.only(top: 30),
      padding: const EdgeInsets.only(left: 12,right: 12,top: 10,bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.blue
      ),
      child: Text(text,
      style: const TextStyle(
        fontSize: 15
      ),),
    ),
  );
}