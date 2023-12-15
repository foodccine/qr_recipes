class LanguageModel {
  final int _id;
  final String _name;
  final String _iso;
  final String _direction;

  LanguageModel(this._id, this._name, this._iso, this._direction);

  String get direction => _direction;

  String get iso => _iso;

  String get name => _name;

  int get id => _id;
}
