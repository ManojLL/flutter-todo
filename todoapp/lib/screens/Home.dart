import 'package:flutter/material.dart';
import 'package:todoapp/constrains/colors.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: _AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            
            children: [
              _searchbar()
            ],
          ),
        ),
      ),
    );
  }

  Container _searchbar() {
    return Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20)
              ),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(0),
                  prefixIcon: Icon(Icons.search,size: 20,),
                  prefixIconConstraints: BoxConstraints(maxHeight: 20,minWidth: 25),
                  border:  InputBorder.none,
                  hintText: "Search Text"
                ),
              ),
            );
  }

  AppBar _AppBar() {
    return AppBar(
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
    );
  }
}
