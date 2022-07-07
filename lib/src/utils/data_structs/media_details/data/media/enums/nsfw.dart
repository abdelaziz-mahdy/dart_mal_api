enum Nsfw {
  white, // Safe for work
  gray, // May not be safe for work
  black // Not safe for work
}

class NsfwUtils {
  static Nsfw? tryParse(String str) {
    switch (str) {
      case 'white':
        return Nsfw.white;
      case 'gray':
        return Nsfw.gray;
      case 'black':
        return Nsfw.black;
      default:
        return null;
    }
  }
}
