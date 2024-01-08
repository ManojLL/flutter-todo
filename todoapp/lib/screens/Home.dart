import 'package:flutter/material.dart';
import 'package:todoapp/constrains/colors.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TBGcolor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.menu,
              size: 30,
            ),
            Container(
              height: 40,
              width: 40,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset('assets/images/Logo.jpg')),
            )
          ],
        ),
      ),
      body: Center(
        child: Text('This is the new screen!'),
      ),
    );
  }
}
