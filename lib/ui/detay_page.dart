import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/constants/color.dart';
import 'package:pokedex/constants/text.dart';
import 'package:pokedex/model/pokemon.dart';
import 'package:translator/translator.dart';

class DetayPage extends StatefulWidget {
  Pokemon? pokemon;
  int? index;
  final translator = GoogleTranslator();
  String? sonuc;
  List turListesi = [];
  DetayPage({required this.pokemon, required this.index, Key? key})
      : super(key: key);

  @override
  _DetayPageState createState() => _DetayPageState();
}

class _DetayPageState extends State<DetayPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
        child: Stack(
          children: [
            Column(
              children: [
                Hero(
                  tag: widget.pokemon!.pokemon![widget.index!].img.toString(),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 48.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Image(
                        image: NetworkImage(
                          widget.pokemon!.pokemon![widget.index!].img
                              .toString(),
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Text(
                  widget.pokemon!.pokemon![widget.index!].name.toString(),
                  style: ConstantsText.titleTextStyle,
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  flex: 2,
                  child: ListView(
                    children: [
                      Container(
                        height: 1,
                        color: Colors.white.withOpacity(0.2),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                          child: Text(
                        'Fiziksel Özellikler',
                        style: ConstantsText.textStyle3,
                      )),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Boy: ' +
                                widget.pokemon!.pokemon![widget.index!].height
                                    .toString(),
                            style: ConstantsText.textStyle2,
                          ),
                          Text(
                            'Kilo: ' +
                                widget.pokemon!.pokemon![widget.index!].weight
                                    .toString(),
                            style: ConstantsText.textStyle2,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 1,
                        color: Colors.white.withOpacity(0.2),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                          child: Text(
                        'Pokemon Türü',
                        style: ConstantsText.textStyle3,
                      )),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: widget.pokemon!.pokemon![widget.index!].type!
                            .map((e) {
                          return FutureBuilder(
                              future: _cevir(e),
                              builder: (BuildContext context,
                                  AsyncSnapshot snapshot) {
                                if (snapshot.hasData) {
                                  return Chip(
                                    label: Text(
                                      snapshot.data.toString(),
                                      style: ConstantsText.textStyle4,
                                    ),
                                    backgroundColor: ConstantsColor.textColor1,
                                  );
                                } else {
                                  return CircularProgressIndicator();
                                }
                              });
                        }).toList(),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 1,
                        color: Colors.white.withOpacity(0.2),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                          child: Text(
                        'Zayıf Yönler',
                        style: ConstantsText.textStyle3,
                      )),
                      SizedBox(
                        height: 10,
                      ),
                      widget.pokemon!.pokemon![widget.index!].weaknesses!
                                  .length >
                              4
                          ? SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              dragStartBehavior: DragStartBehavior.down,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 30.0),
                                child: Container(
                                  alignment: Alignment.topCenter,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: widget.pokemon!
                                        .pokemon![widget.index!].weaknesses!
                                        .map((e) {
                                      return FutureBuilder(
                                          future: _cevir(e),
                                          builder: (BuildContext context,
                                              AsyncSnapshot snapshot) {
                                            if (snapshot.hasData) {
                                              return Row(
                                                children: [
                                                  Chip(
                                                    label: Text(
                                                      snapshot.data.toString(),
                                                      style: ConstantsText
                                                          .textStyle4,
                                                    ),
                                                    backgroundColor:
                                                        ConstantsColor
                                                            .textColor1,
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                ],
                                              );
                                            } else {
                                              return Row(
                                                children: [
                                                  CircularProgressIndicator(),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                ],
                                              );
                                            }
                                          });
                                    }).toList(),
                                  ),
                                ),
                              ),
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: widget
                                  .pokemon!.pokemon![widget.index!].weaknesses!
                                  .map((e) {
                                return FutureBuilder(
                                    future: _cevir(e),
                                    builder: (BuildContext context,
                                        AsyncSnapshot snapshot) {
                                      if (snapshot.hasData) {
                                        return Chip(
                                          label: Text(
                                            snapshot.data.toString(),
                                            style: ConstantsText.textStyle4,
                                          ),
                                          backgroundColor:
                                              ConstantsColor.textColor1,
                                        );
                                      } else {
                                        return CircularProgressIndicator();
                                      }
                                    });
                              }).toList(),
                            ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 1,
                        color: Colors.white.withOpacity(0.2),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                          child: Text(
                        'Geri Evrim',
                        style: ConstantsText.textStyle3,
                      )),
                      SizedBox(
                        height: 10,
                      ),
                      widget.pokemon!.pokemon![widget.index!].prevEvolution !=
                              null
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: widget.pokemon!.pokemon![widget.index!]
                                  .prevEvolution!
                                  .map(
                                    (e) => Chip(
                                      label: Text(
                                        e.name.toString(),
                                        style: ConstantsText.textStyle4,
                                      ),
                                      backgroundColor: Colors.white,
                                    ),
                                  )
                                  .toList(),
                            )
                          : Center(
                              child: Text(
                                'Geri evrim bulunmamaktadir',
                                style: ConstantsText.textStyle2,
                              ),
                            ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 1,
                        color: Colors.white.withOpacity(0.2),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                          child: Text(
                        'İleri Evrim',
                        style: ConstantsText.textStyle3,
                      )),
                      SizedBox(
                        height: 10,
                      ),
                      widget.pokemon!.pokemon![widget.index!].nextEvolution !=
                              null
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: widget.pokemon!.pokemon![widget.index!]
                                  .nextEvolution!
                                  .map(
                                    (e) => Chip(
                                      label: Text(
                                        e.name.toString(),
                                        style: ConstantsText.textStyle4,
                                      ),
                                      backgroundColor: Colors.white,
                                    ),
                                  )
                                  .toList(),
                            )
                          : Center(
                              child: Text(
                                'İleri evrim bulunmamaktadır.',
                                style: ConstantsText.textStyle2,
                              ),
                            ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 1,
                        color: Colors.white.withOpacity(0.2),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned.directional(
              textDirection: TextDirection.ltr,
              start: MediaQuery.of(context).size.height * 0.03,
              top: MediaQuery.of(context).size.height * 0.05,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).maybePop();
                },
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: ConstantsColor.textColor1,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _cevir(String s) async {
    String? cevirmeSonucu;
    await widget.translator.translate(s, to: 'tr').then((value) {
      cevirmeSonucu = value.text;
      String ilk = cevirmeSonucu![0];
      cevirmeSonucu = cevirmeSonucu!.substring(1);
      ilk = ilk.toUpperCase();
      String yeniString = ilk + cevirmeSonucu!;
      cevirmeSonucu = yeniString;
    });
    return cevirmeSonucu!;
  }
}
