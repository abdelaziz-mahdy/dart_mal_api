enum Rating {
  g, // All Ages
  pg, // Children
  pg13, // Teens 13 and Older
  r, // 17+ (violence and profanity)
  rPlus, // Profanity & Mild Nudity
  rx // Hentai
}

class RatingUtils {
  static Rating? tryParse(String str) {
    switch(str) {
      case 'g':
        return Rating.g;
      case 'pg':
        return Rating.pg;
      case 'pg_13':
        return Rating.pg13;
      case 'r':
        return Rating.r;
      case 'r+':
        return Rating.rPlus;
      case 'rx':
        return Rating.rx;
      default:
        return null;
    }
  }
}
