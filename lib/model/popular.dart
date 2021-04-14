class PopularFood {
  String _name;
  double _weight;
  double _price;
  double _rate;
  String _img;

  PopularFood(this._name, this._weight, this._price, this._rate, this._img);

  String get img => this._img;

  set img(String value) => this._img = value;

  String get name => this._name;

  set name(String value) => this._name = value;

  get weight => this._weight;

  set weight(value) => this._weight = value;

  get price => this._price;

  set price(value) => this._price = value;

  get rate => this._rate;

  set rate(value) => this._rate = value;
}
