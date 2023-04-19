import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokeflutter/utils/capitalize.dart';

import '../../model/pokemon.dart';
import '../../utils/pokemon_api.dart';

class TabViewDetail extends StatefulWidget {
  final Pokemon? pokemon;
  const TabViewDetail({required this.pokemon, super.key});

  @override
  State<TabViewDetail> createState() => _TabViewDetailState();
}

class _TabViewDetailState extends State<TabViewDetail>
    with SingleTickerProviderStateMixin {
  TabController? controller;
  String flavourText = "";
  bool isLoading = false;

  void getFlavourText() async {
    setState(() {
      isLoading = true;
    });
    flavourText =
        await PokemonApi.getPokemonFlavourText(widget.pokemon?.name ?? "");
    setState(() {});
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    controller = TabController(length: 4, vsync: this);
    getFlavourText();
    super.initState();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    var i = 0;
    return Container(
      height: 400.h,
      child: Column(children: [
        isLoading
            ? const CircularProgressIndicator()
            : Container(
                height: 48.h,
                child: TabBar(
                  tabs: [
                    Text(
                      "About",
                      style: theme.textTheme.labelLarge,
                    ),
                    Text(
                      "Stats",
                      style: theme.textTheme.labelLarge,
                    ),
                    Text(
                      "Moves",
                      style: theme.textTheme.labelLarge,
                    ),
                    Text(
                      "Evolution",
                      style: theme.textTheme.labelLarge,
                    ),
                  ],
                  controller: controller,
                ),
              ),
        Expanded(
          child: TabBarView(
            controller: controller,
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 25.h,
                    ),
                    Text(
                      flavourText.replaceAll(RegExp("\n"), ""),
                      style: const TextStyle(height: 24 / 16),
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Container(
                      width: double.infinity,
                      height: 116.h,
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(16.0)),
                          color: Colors.grey[100]),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.fromLTRB(
                                50.0, 28.0, 20.0, 30.0),
                            child: Column(
                              children: [
                                Text(
                                  "${widget.pokemon?.weight.toString()} Kg",
                                  style: theme.textTheme.titleMedium,
                                ),
                                SizedBox(
                                  height: 4.h,
                                ),
                                Text(
                                  'Weight',
                                  style: theme.textTheme.labelSmall,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 45.w,
                          ),
                          Container(
                            width: 1.0.w,
                            height: 76.0.h,
                            color: Color(0xFFDFE4EC),
                          ),
                          Container(
                            padding: const EdgeInsets.fromLTRB(
                                50.0, 28.0, 0.0, 30.0),
                            child: Column(
                              children: [
                                Text(
                                  "${widget.pokemon?.height.toString()} Cm",
                                  style: theme.textTheme.titleMedium,
                                ),
                                SizedBox(
                                  height: 4.h,
                                ),
                                Text(
                                  'Height',
                                  style: theme.textTheme.labelSmall,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Container(
                      width: double.infinity,
                      height: 116.h,
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(16.0)),
                          color: Colors.grey[100]),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.fromLTRB(
                                50.0, 28.0, 20.0, 30.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Image(
                                      image: AssetImage(
                                          "assets/types_icons/Pokémon_${widget.pokemon?.typesList[i].capitalize()}_Type_Icon.png"),
                                      height: 23.r,
                                      width: 23.r,
                                    ),
                                    SizedBox(
                                      width: 9.w,
                                    ),
                                    Image(
                                      image: AssetImage(
                                          "assets/types_icons/Pokémon_${widget.pokemon?.typesList[i + 1].capitalize()}_Type_Icon.png"),
                                      height: 23.r,
                                      width: 23.r,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 4.h,
                                ),
                                Text(
                                  'Category',
                                  style: theme.textTheme.labelSmall,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 50.w,
                          ),
                          Container(
                            width: 1.0.w,
                            height: 76.0.h,
                            color: Color(0xFFDFE4EC),
                          ),
                          Container(
                            padding: const EdgeInsets.fromLTRB(
                                50.0, 28.0, 0.0, 30.0),
                            child: Column(
                              children: [
                                Text(
                                  "${widget.pokemon?.ability}",
                                  style: theme.textTheme.titleMedium,
                                ),
                                SizedBox(
                                  height: 4.h,
                                ),
                                Text(
                                  'Ability',
                                  style: theme.textTheme.labelSmall,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(child: Text("text")),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 24.h,
                      ),
                      Container(
                        width: double.infinity,
                        height: 32.h,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Color(0xFFF2F4F7),
                              width: 2.0, // spessore del bordo
                            ),
                          ),
                        ),
                        child: Text("text",
                            style: TextStyle(
                              fontFamily: "roboto",
                              fontSize: theme.textTheme.bodyLarge?.fontSize,
                            )),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Container(
                        width: double.infinity,
                        height: 32.h,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Color(0xFFF2F4F7),
                              width: 2.0, // spessore del bordo
                            ),
                          ),
                        ),
                        child: Text("text",
                            style: TextStyle(
                              fontFamily: "roboto",
                              fontSize: theme.textTheme.bodyLarge?.fontSize,
                            )),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Container(
                        width: double.infinity,
                        height: 32.h,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Color(0xFFF2F4F7),
                              width: 2.0, // spessore del bordo
                            ),
                          ),
                        ),
                        child: Text("text",
                            style: TextStyle(
                              fontFamily: "roboto",
                              fontSize: theme.textTheme.bodyLarge?.fontSize,
                            )),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Container(
                        width: double.infinity,
                        height: 32.h,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Color(0xFFF2F4F7),
                              width: 2.0, // spessore del bordo
                            ),
                          ),
                        ),
                        child: Text("text",
                            style: TextStyle(
                              fontFamily: "roboto",
                              fontSize: theme.textTheme.bodyLarge?.fontSize,
                            )),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Container(
                        width: double.infinity,
                        height: 32.h,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Color(0xFFF2F4F7),
                              width: 2.0, // spessore del bordo
                            ),
                          ),
                        ),
                        child: Text("text",
                            style: TextStyle(
                              fontFamily: "roboto",
                              fontSize: theme.textTheme.bodyLarge?.fontSize,
                            )),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Container(
                        width: double.infinity,
                        height: 32.h,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Color(0xFFF2F4F7),
                              width: 2.0, // spessore del bordo
                            ),
                          ),
                        ),
                        child: Text("text",
                            style: TextStyle(
                              fontFamily: "roboto",
                              fontSize: theme.textTheme.bodyLarge?.fontSize,
                            )),
                      ),
                    ],
                  )),
              Text("text"),
            ],
          ),
        ),
      ]),
    );
  }
}
