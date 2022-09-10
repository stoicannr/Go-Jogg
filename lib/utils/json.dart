DateTime? dateTimetoJson(dynamic dateTime) => dateTime?.toUtc() as DateTime?;

DateTime? dateTimeFromJson(dynamic dateTimeData) => dateTimeData?.toDate()?.toUtc() as DateTime?;

DateTime? dateTimeFromSeconds(dynamic dateTimeData) {
  if (dateTimeData != null) {
    return DateTime.fromMillisecondsSinceEpoch((dateTimeData as int) * 1000).toUtc();
  }
  return null;
}