enum SeasonalAnimeSortingMethod {
  animeScore,
  animeNumListUsers
}

extension SeasonalAnimeSortingMethodExts on SeasonalAnimeSortingMethod {
  String toParamStr() {
    switch (this) {
      case SeasonalAnimeSortingMethod.animeScore:
        return 'anime_score';
      case SeasonalAnimeSortingMethod.animeNumListUsers:
        return 'anime_num_list_users';
    }
  }
}
