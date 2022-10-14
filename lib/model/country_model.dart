class CountryModel {
  String flag;
  String name;
  String code;

  CountryModel({
    required this.flag,
    required this.name,
    required this.code,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) => CountryModel(
        flag: json["flag"],
        name: json["name"],
        code: json["code"],
      );
}
