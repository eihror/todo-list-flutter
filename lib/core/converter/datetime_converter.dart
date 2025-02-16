import 'package:json_annotation/json_annotation.dart';

class TimestampSerializer implements JsonConverter<DateTime, int> {
  const TimestampSerializer();

  @override
  DateTime fromJson(int timestampInMilli) =>
      DateTime.fromMillisecondsSinceEpoch(timestampInMilli);

  @override
  int toJson(DateTime date) => date.millisecondsSinceEpoch;
}
