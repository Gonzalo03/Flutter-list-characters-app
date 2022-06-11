import 'package:flutter/material.dart';
import 'package:gotobun_app/helpers/get_character_color.dart';
import 'package:gotobun_app/helpers/get_character_detail.dart';
import 'package:gotobun_app/models/character_detail.dart';

class CharacterDetailScreen extends StatelessWidget {
  const CharacterDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final malId = ModalRoute.of(context)!.settings.arguments as int;

    return Scaffold(
      body: FutureBuilder(
          future: getCharactersDetail(malId),
          builder: (context, AsyncSnapshot<CharacterDetail> snapshot) =>
              snapshot.hasData
                  ? GotobunDetail(detail: snapshot.data!)
                  : snapshot.hasError
                      ? const Center(child: Text('No data'))
                      : const Center(child: CircularProgressIndicator())),
    );
  }
}

class GotobunDetail extends StatelessWidget {
  const GotobunDetail({Key? key, required this.detail}) : super(key: key);

  final CharacterDetail detail;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height / 2,
          child: Card(
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Image(
              image: NetworkImage(detail.imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Text(
                    "${detail.name} - ${detail.kanji}",
                    style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: getCharacterColor(detail.name
                                .substring(0, detail.name.indexOf(' '))
                                .trim())
                            .withOpacity(0.7)),
                  ),
                ),
                Text(
                  detail.about,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.8), fontSize: 20.0),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
