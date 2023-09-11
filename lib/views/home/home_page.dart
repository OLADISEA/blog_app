import 'package:blog_app/data/repository.dart';
import 'package:blog_app/views/login/log_in.dart';
import 'package:blog_app/widgets/common/reusable.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            generalButton('log out', () {
              BlogRepository().logout();
              //Navigator.of(context).push(MaterialPageRoute(builder: (context)=> LogIn()));
            })
          ],
        ),
      ),
    );
  }
}
