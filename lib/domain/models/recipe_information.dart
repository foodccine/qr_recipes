class RecipeInformationModel {
  final String views;
  final String image;
  final String name;
  final String time;
  final String serving;
  bool isVideoPlaying = false;

  RecipeInformationModel(
      this.views, this.image, this.name, this.time, this.serving);
}
