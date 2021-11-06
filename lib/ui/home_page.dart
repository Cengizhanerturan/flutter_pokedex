import 'package:flutter/material.dart';
import 'package:pokedex/constants/color.dart';
import 'package:pokedex/constants/text.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex/model/pokemon.dart';
import 'dart:convert';

import 'package:pokedex/ui/detay_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Pokemon? pokemon;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pokemonGetir().then((okunanPokemon) {
      pokemon = okunanPokemon;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: ConstantsColor.gradientColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 48.0, left: 20),
              child: Text(
                ConstantsText.titleText,
                style: ConstantsText.titleTextStyle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                ConstantsText.subTitleText,
                style: ConstantsText.subTitleTextStyle,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            FutureBuilder(
              future: _pokemonGetir(),
              builder: (BuildContext context, AsyncSnapshot<Pokemon> snapshot) {
                if (snapshot.hasData) {
                  return Container(
                    height: 500,
                    child: Swiper(
                      itemWidth: MediaQuery.of(context).size.width - 2 * 64,
                      layout: SwiperLayout.STACK,
                      itemCount: pokemon!.pokemon!.length,
                      itemBuilder: (context, index) {
                        return Container(
                          child: Center(
                            child: Hero(
                              tag: pokemon!.pokemon![index].img.toString(),
                              child: Stack(
                                children: [
                                  Column(
                                    children: [
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Card(
                                        elevation: 8,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(32),
                                        ),
                                        color: Colors.white,
                                        child: Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                height: 140,
                                              ),
                                              Text(
                                                pokemon!.pokemon![index].name
                                                    .toString(),
                                                style: ConstantsText.textStyle1,
                                              ),
                                              SizedBox(
                                                height: 16,
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              DetayPage(
                                                                  pokemon:
                                                                      pokemon,
                                                                  index:
                                                                      index)));
                                                },
                                                child: Container(
                                                  width: 100,
                                                  height: 28,
                                                  decoration: BoxDecoration(
                                                      color: ConstantsColor
                                                          .textColor3,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20)),
                                                  child: Center(
                                                      child: Text(
                                                    'Detay',
                                                    style: ConstantsText
                                                        .textStyle2,
                                                  )),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 30,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Positioned(
                                      left: 65,
                                      top: 0,
                                      child: Column(
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.4,
                                            child: Image(
                                              image: NetworkImage(
                                                pokemon!.pokemon![index].img
                                                    .toString(),
                                              ),
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ],
                                      )),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<Pokemon> _pokemonGetir() async {
    var response = await http.get(Uri.parse(
        'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json'));
    if (response.statusCode == 200) {
      return Pokemon.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Hata ${response.statusCode}');
    }
  }
}
