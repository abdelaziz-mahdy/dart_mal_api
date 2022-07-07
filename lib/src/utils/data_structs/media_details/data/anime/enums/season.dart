enum Season {
  winter,
  spring,
  summer,
  fall
}

class SeasonUtils {
  static Season? tryParse(String str) {
    switch(str) {
      case 'winter':
        return Season.winter;
      case 'spring':
        return Season.spring;
      case 'summer':
        return Season.summer;
      case 'fall':
        return Season.fall;
      default:
        return null;
    }
  }
}

extension SeasonExts on Season {
  String toParamStr() {
    switch (this) {
      case Season.winter:
        return 'winter';
      case Season.spring:
        return 'spring';
      case Season.summer:
        return 'summer';
      case Season.fall:
        return 'fall';
    }
  }
}
