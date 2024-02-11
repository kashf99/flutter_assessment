class TripSummary{
final  String pickup;
final  String dropOff;
 final String destination;
 final DateTime startTime;
 final DateTime endTime;
 final double distance;
final  Duration duration;
final  double cost;

TripSummary({
  
  required this.cost,
  required this.destination,
  required this.distance,
  required this.dropOff,
  required this.duration,
  required this.endTime,
  required this.pickup,
  required this.startTime
}
);
}