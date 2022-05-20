
class Recipe {
  final String dishName;
  final String networkImage;
  final String time;
  final List<String> steps;
  final List<String> ingridents;
  final String youtube;

  Recipe({required this.ingridents,required this.networkImage, required this.dishName, required this.steps, required this.time, required this.youtube});
}