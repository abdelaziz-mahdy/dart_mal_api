enum MangaMediaType {
  doujinshi,
  manga,
  manhua,
  manhwa,
  novel,
  oel,
  oneShot,
  unknown,
}

class MangaMediaTypeUtils {
  static MangaMediaType? tryParse(String str) {
    switch (str) {
      case 'doujinshi':
        return MangaMediaType.doujinshi;
      case 'manga':
        return MangaMediaType.manga;
      case 'manhua':
        return MangaMediaType.manhua;
      case 'manhwa':
        return MangaMediaType.manhwa;
      case 'novel':
        return MangaMediaType.novel;
      case 'oel':
        return MangaMediaType.oel;
      case 'one_shot':
        return MangaMediaType.oneShot;
      case 'unknown':
        return MangaMediaType.unknown;
      default:
        return null;
    }
  }
}
