import 'package:flutter/material.dart';
import 'package:gotobun_app/helpers/get_characters.dart';
import 'package:gotobun_app/models/character.dart';
import 'package:gotobun_app/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            const SliverAppBar(
              title: Text('Choose your best QQ',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  )),
              centerTitle: true,
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
          ];
        },
        body: FutureBuilder(
            future: getCharacters(),
            builder: (_, AsyncSnapshot<List<Character>> snapshot) {
              return snapshot.hasData
                  ? GotobunListView(
                      data: snapshot.data ?? [],
                    )
                  : !snapshot.hasError
                      ? const Center(child: CircularProgressIndicator())
                      : const Center(
                          child: Text('No data'),
                        );
            }),
      )),
    );
  }
}
