import 'package:flutter/cupertino.dart';

@immutable
abstract class AppointmentsEvent {}
class AppointmentsInitialFetchEvent extends AppointmentsEvent{

}
class AppointmentsReloadEvent extends AppointmentsEvent{}