import 'package:flutter/material.dart';
import 'package:flutter_7_wonders_of_the_world/data/models/wordl_wonders.dart';
import 'package:flutter_7_wonders_of_the_world/presentation/widgets/list_tile.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final List<WorldWonder> wondersList = worldWondersList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Wonders Of The World',
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            final wonder = wondersList[index];
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/details', arguments: {
                  "wonder": wonder,
                });
              },
              child: ListItem(
                  name: wonder.name,
                  description: wonder.description,
                  imgURL: wonder.imgURL),
            );
          },
          itemCount: wondersList.length,
        ),
      ),
    );
  }
}
