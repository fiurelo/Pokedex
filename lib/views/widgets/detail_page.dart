import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:pokeflutter/model/pokemon.dart';
import 'package:pokeflutter/views/widgets/pokemon_image.dart';
import 'package:pokeflutter/views/widgets/tab_view_detail.dart';
import '/model/pokemon.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  Pokemon? pokemon;
  Color? dominantColor;
  bool loading = true;

  void getDominantColor() async {
    setState(() {
      loading = true;
    });
    final image = await PaletteGenerator.fromImageProvider(
        Image.network(pokemon?.urlImage ?? "").image);
    setState(() {
      dominantColor = image.dominantColor?.color;
    });
  }

  @override
  void didChangeDependencies() {
    pokemon = ModalRoute.of(context)?.settings.arguments as Pokemon?;
    getDominantColor();
    setState(() {
      loading = false;
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            PokemonImage(
                dominantColor: dominantColor, pokemon: pokemon, theme: theme),
            SizedBox(
              height: 12.h,
            ),
            TabViewDetail(
              pokemon: pokemon,
            ),
          ],
        ),
      ),
    );
  }
}

extension Capita on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}
