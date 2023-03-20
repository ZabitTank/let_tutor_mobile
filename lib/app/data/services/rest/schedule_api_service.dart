class ScheduleAPIService {
  final String bookingDomain;
  final String scheduleDomain;

  ScheduleAPIService(this.bookingDomain, this.scheduleDomain);
}

class SheduleAPIPaths {
  static const String getBookedClass = "/list/student";
  static String updateBooked(String bookId) => "/student-request/$bookId";
}
