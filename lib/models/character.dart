class Character {
  Character({
    required this.characterData,
  });

  CharacterData characterData;

  factory Character.fromJson(Map<String, dynamic> json) => Character(
        characterData: CharacterData.fromJson(json["character"]),
      );
}

class CharacterData {
  CharacterData({
    required this.malId,
    required this.url,
    required this.images,
    required this.name,
  });

  int malId;
  String url;
  Images images;
  String name;

  factory CharacterData.fromJson(Map<String, dynamic> json) {
    return CharacterData(
      malId: json['mal_id'],
      url: json['url'],
      images: Images.fromJson(json['images']),
      name: json['name'],
    );
  }
}

class Images {
  Images({
    required this.jpg,
    required this.webp,
  });

  Jpg jpg;
  Webp webp;

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        jpg: Jpg.fromJson(json["jpg"]),
        webp: Webp.fromJson(json["webp"]),
      );
}

class Jpg {
  Jpg({
    required this.imageUrl,
  });

  String imageUrl;

  factory Jpg.fromJson(Map<String, dynamic> json) => Jpg(
        imageUrl: json["image_url"],
      );
}

class Webp {
  Webp({
    required this.imageUrl,
    required this.smallImageUrl,
  });

  String imageUrl;
  String smallImageUrl;

  factory Webp.fromJson(Map<String, dynamic> json) => Webp(
        imageUrl: json["image_url"],
        smallImageUrl: json["small_image_url"],
      );
}
