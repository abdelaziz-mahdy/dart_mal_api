enum Source {
  book,
  cardGame,
  digitalManga,
  fourKomaManga,
  game,
  lightNovel,
  manga,
  music,
  novel,
  original,
  other,
  pictureBook,
  radio,
  visualNovel,
  webManga
}

class SourceUtils {
  static Source? tryParse(String str) {
    switch (str) {
      case 'book':
        return Source.book;
      case 'card_game':
        return Source.cardGame;
      case 'digital_manga':
        return Source.digitalManga;
      case '4_koma_manga':
        return Source.fourKomaManga;
      case 'game':
        return Source.game;
      case 'light_novel':
        return Source.lightNovel;
      case 'manga':
        return Source.manga;
      case 'music':
        return Source.music;
      case 'novel':
        return Source.novel;
      case 'original':
        return Source.original;
      case 'other':
        return Source.other;
      case 'picture_book':
        return Source.pictureBook;
      case 'radio':
        return Source.radio;
      case 'visual_novel':
        return Source.visualNovel;
      case 'web_manga':
        return Source.webManga;
      default:
        return null;
    }
  }
}
