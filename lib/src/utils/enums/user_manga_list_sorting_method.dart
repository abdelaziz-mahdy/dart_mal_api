enum UserMangaListSortingMethod {
  listScore,
  listUpdatedAt,
  mangaId,
  mangaStartDate,
  mangaTitle
}

extension UserMangaListSortingMethodExts on UserMangaListSortingMethod {
  String toParamStr() {
    switch (this) {
      case UserMangaListSortingMethod.listScore:
        return 'list_score';
      case UserMangaListSortingMethod.listUpdatedAt:
        return 'list_updated_at';
      case UserMangaListSortingMethod.mangaId:
        return 'manga_id';
      case UserMangaListSortingMethod.mangaStartDate:
        return 'manga_start_date';
      case UserMangaListSortingMethod.mangaTitle:
        return 'manga_title';
    }
  }
}
