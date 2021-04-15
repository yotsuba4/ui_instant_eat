class Category {
  String _name;
  String _image;

  Category(this._image, this._name);

  String get name => this._name;

  set name(String value) => this._name = value;

  get image => this._image;

  set image(value) => this._image = value;
}
