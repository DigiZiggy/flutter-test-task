class Instrument {
  String id;
  String symbol;
  String name;
  String exchange;
  int quantityPrecision;
  String currency;
  bool isViewable;
  bool isBuyable;
  bool isSellable;
  bool isFractionable;
  String? logo;
  List tags;
  int sortOrder;
  String lastModified;

  Instrument({
    required this.id,
    required this.symbol,
    required this.name,
    required this.exchange,
    required this.quantityPrecision,
    required this.currency,
    required this.isViewable,
    required this.isBuyable,
    required this.isSellable,
    required this.isFractionable,
    this.logo,
    required this.tags,
    required this.sortOrder,
    required this.lastModified
  });

  factory Instrument.fromJson(Map<String, dynamic> json) {
    return Instrument(
      id: json['id'],
      symbol: json['symbol'],
      name: json['name'],
      exchange: json['exchange'],
      quantityPrecision: json['quantityPrecision'],
      currency: json['currency'],
      isViewable: json['isViewable'],
      isBuyable: json['isBuyable'],
      isSellable: json['isSellable'],
      isFractionable: json['isFractionable'],
      logo: json['logo'],
      tags: json['tags'],
      sortOrder: json['sortOrder'],
      lastModified: json['lastModified'],
    );
  }
}