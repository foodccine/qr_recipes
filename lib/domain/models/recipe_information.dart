class RecipeInformationModel {
  final int id;
  final String identifier;
  final int views;
  final String image;
  final String video;
  final String name;
  final int time;
  final int serving;

  RecipeInformationModel(this.id, this.identifier, this.views, this.image,
      this.video, this.name, this.time, this.serving);
}
