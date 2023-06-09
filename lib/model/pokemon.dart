class Pokemon {
  final int id;
  final String name;
  final String urlSprite;
  final String urlImage;
  final double weight;
  final double height;
  final List<String> typesList;
  final String ability;

  Pokemon({
    required this.id,
    required this.name,
    required this.urlSprite,
    required this.urlImage,
    required this.weight,
    required this.height,
    required this.typesList,
    required this.ability,
  });

  Pokemon.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        urlSprite = json["sprites"]["front_default"],
        urlImage =
            json["sprites"]["other"]["official-artwork"]["front_default"],
        name = json["species"]["name"],
        weight = json["weight"].toDouble() / 10.0,
        height = json["height"].toDouble() * 10.0,
        ability = json["abilities"][0]["ability"]["name"],
        typesList = getListTypesFromJson(json["types"]);
}

List<String> getListTypesFromJson(List<dynamic> json) {
  final List<String> typesList = [];
  for (var element in json) {
    typesList.add(element["type"]["name"]);
  }
  return typesList;
}
