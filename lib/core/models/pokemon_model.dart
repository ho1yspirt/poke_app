class PokemonModel {
  final int id;
  final String name;
  final String image;
  final String forms;
  final String color;
  final double height;
  final double weight;
  final String habitats;
  final String location;
  final List<String> types;
  final List<Map<String, dynamic>> evolution;
  final Map<String, dynamic> stats;

  const PokemonModel({
    required this.id,
    required this.image,
    required this.name,
    required this.types,
    required this.color,
    required this.forms,
    required this.height,
    required this.weight,
    required this.habitats,
    required this.location,
    required this.evolution,
    required this.stats,
  });
}
