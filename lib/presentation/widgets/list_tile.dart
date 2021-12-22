import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  const ListItem({Key? key, required this.name, required this.description, required this.imgURL}) : super(key: key);

  final dynamic imgURL;
  final String name;
  final String description;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 15, 0, 10),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: FadeInImage(
                    width: 300,
                    height: 150,
                    fit: BoxFit.cover,
                    placeholder: const AssetImage('assets/images/image_place_holder.png'),
                    image: NetworkImage(imgURL)),
              ),
              Text(
                name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              Text(
                description,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}