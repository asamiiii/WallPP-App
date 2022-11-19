
class WallpaperModel {
  String? photographer;
  String? photographerUrl;
  int? photographerId;

  // access keys map
  SrcModel? src;

  // create name parameter
  WallpaperModel({
    this.src,
    this.photographerUrl,
    this.photographerId,
    this.photographer,
  });

  // passing json value from API
  factory WallpaperModel.fromMap(Map<String, dynamic> jsonData) {
    return WallpaperModel(
      src: SrcModel.fromMap(jsonData['src']),
      photographerUrl: jsonData["photographer_url"],
      photographerId: jsonData["photographer_id"],
      photographer: jsonData["photographer"],
    );
  }
}

// wallpaper Source Map Model
class SrcModel {
  String original;
  String medium;
  String portrait;
  String tiny;

  // create name parameter
  SrcModel(
      {required this.original,
      required this.medium,
      required this.portrait,
      required this.tiny,
      });

  // passing json value from API
  factory SrcModel.fromMap(Map<String, dynamic> jsonData) {
    return SrcModel(
      portrait: jsonData["portrait"],
      original: jsonData["original"],
      medium: jsonData["medium"],
      tiny: jsonData["tiny"]
    );
  }
}





class WallpaperModelFromUnsplash {

  UnsplashUrl? url;

  // create name parameter
  WallpaperModelFromUnsplash
  ({
    this.url,
  });

  // passing json value from API
  factory WallpaperModelFromUnsplash.fromMap(Map<String, dynamic> jsonData) {
    return WallpaperModelFromUnsplash(
      url: UnsplashUrl.fromMap(jsonData['urls']),

    );
  }
}

class UnsplashUrl {
  String full;
  String regular;
  String small;


  // create name parameter
  UnsplashUrl(
      {required this.full,
      required this.regular,
      required this.small,
      });

  // passing json value from API
  factory UnsplashUrl.fromMap(Map<String, dynamic> jsonData) {
    return UnsplashUrl(
      full : jsonData["full"],
      regular: jsonData["regular"],
      small: jsonData["small"]

    );
  }
}
