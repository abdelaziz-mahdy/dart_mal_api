enum AnimeMediaType {
  movie,
  music,
  ova,
  ona,
  special,
  tv,
  unknown
}

class AnimeMediaTypeUtils {
  static AnimeMediaType? tryParse(String str) {
    switch (str) {
      case 'movie':
        return AnimeMediaType.movie;
      case 'music':
        return AnimeMediaType.music;
      case 'ova':
        return AnimeMediaType.ova;
      case 'ona':
        return AnimeMediaType.ona;
      case 'special':
        return AnimeMediaType.special;
      case 'tv':
        return AnimeMediaType.tv;
      case 'unknown':
        return AnimeMediaType.unknown;
      default:
        return null;
    }
  }
}
