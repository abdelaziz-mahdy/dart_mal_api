enum AnimeRankingType {
  airing,
  all,
  byPopularity,
  favorite,
  movie,
  ova,
  special,
  tv,
  upcoming
}

extension AnimeRankingTypeExts on AnimeRankingType {
  String toParamStr() {
    switch (this) {
      case AnimeRankingType.airing:
        return 'airing';
      case AnimeRankingType.all:
        return 'all';
      case AnimeRankingType.byPopularity:
        return 'bypopularity';
      case AnimeRankingType.favorite:
        return 'favorite';
      case AnimeRankingType.movie:
        return 'movie';
      case AnimeRankingType.ova:
        return 'ova';
      case AnimeRankingType.special:
        return 'special';
      case AnimeRankingType.tv:
        return 'tv';
      case AnimeRankingType.upcoming:
        return 'upcoming';
    }
  }
}
