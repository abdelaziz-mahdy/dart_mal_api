enum DayOfTheWeek {
  sunday,
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
}

class DayOfTheWeekUtils {
  static DayOfTheWeek? tryParse(String str) {
    switch (str) {
      case 'sunday':
        return DayOfTheWeek.sunday;
      case 'monday':
        return DayOfTheWeek.monday;
      case 'tuesday':
        return DayOfTheWeek.tuesday;
      case 'wednesday':
        return DayOfTheWeek.wednesday;
      case 'thursday':
        return DayOfTheWeek.thursday;
      case 'friday':
        return DayOfTheWeek.friday;
      case 'saturday':
        return DayOfTheWeek.saturday;
      default:
        return null;
    }
  }
}
