class SliderModel {
  String imageUrl;

  SliderModel({
    required this.imageUrl,
  });

  factory SliderModel.fromJson(Map<String, dynamic> json) => SliderModel(
        imageUrl: json["imageUrl"],
      );
}
