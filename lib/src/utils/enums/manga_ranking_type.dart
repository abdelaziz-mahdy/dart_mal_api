enum MangaRankingType {
  all,
  byPopularity,
  doujin,
  favorite,
  manga,
  manhua,
  manhwa,
  novels,
  oneshots,
}

extension MangaRankingTypeExts on MangaRankingType {
  String toParamStr() {
    switch (this) {
      case MangaRankingType.all:
        return 'all';
      case MangaRankingType.byPopularity:
        return 'bypopularity';
      case MangaRankingType.doujin:
        return 'doujin';
      case MangaRankingType.favorite:
        return 'favorite';
      case MangaRankingType.manga:
        return 'manga';
      case MangaRankingType.manhua:
        return 'manhua';
      case MangaRankingType.manhwa:
        return 'manhwa';
      case MangaRankingType.novels:
        return 'novels';
      case MangaRankingType.oneshots:
        return 'oneshots';
    }
  }
}
