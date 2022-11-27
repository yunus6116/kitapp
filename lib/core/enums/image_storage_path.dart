enum ImageStoragePath { bookImage }

extension ImageStoragePathExtension on ImageStoragePath {
  String getStoragePath({String? firstArgument, String? secondArgument}) {
    switch (this) {
      case ImageStoragePath.bookImage:
        return "books/$firstArgument/image$secondArgument.jpg";
    }
  }
}
