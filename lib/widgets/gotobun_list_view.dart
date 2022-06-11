import 'package:flutter/material.dart';
import 'package:gotobun_app/helpers/get_character_color.dart';

import '../models/character.dart';

class GotobunListView extends StatelessWidget {
  final List<Character> data;

  const GotobunListView({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      itemBuilder: (context, index) {
        String characterName = data[index].characterData.name;
        String imageContainer = data[index].characterData.images.jpg.imageUrl;

        return Card(
          elevation: 5,
          shadowColor: getCharacterColor(
                  characterName.substring(0, characterName.indexOf(' ')).trim())
              .withOpacity(0.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: getCharacterColor(characterName
                      .substring(characterName.lastIndexOf(' '))
                      .trim()),
                  image: DecorationImage(
                      alignment: Alignment.centerRight,
                      image: NetworkImage(imageContainer))),
              alignment: AlignmentDirectional.bottomCenter,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              height: size.height / data.length,
              child: ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, 'character',
                        arguments: data[index].characterData.malId);
                  },
                  title: Text(
                    data[index].characterData.name,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ))),
        );
      },
      itemCount: data.length,
    );
  }
}
