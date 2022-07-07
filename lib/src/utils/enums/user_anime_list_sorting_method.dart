enum UserAnimeListSortingMethod {
  animeId,
  animeStartDate,
  animeTitle,
  listScore,
  listUpdatedAt
}

extension UserAnimeListSortingMethodExts on UserAnimeListSortingMethod {
  String toParamStr() {
    switch (this) {
      case UserAnimeListSortingMethod.animeId:
        return 'anime_id';
      case UserAnimeListSortingMethod.animeStartDate:
        return 'anime_start_date';
      case UserAnimeListSortingMethod.animeTitle:
        return 'anime_title';
      case UserAnimeListSortingMethod.listScore:
        return 'list_score';
      case UserAnimeListSortingMethod.listUpdatedAt:
        return 'list_updated_at';
    }
  }
}
