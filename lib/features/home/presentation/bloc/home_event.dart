part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {}

class SubscribeToChannelEvent extends HomeEvent {
  final String channel;
  final String event;

  SubscribeToChannelEvent({required this.channel, required this.event});
  @override
  List<Object?> get props => [channel, event];
}

class UnSubscribeChannelEvent extends HomeEvent {
  final String channel;

  UnSubscribeChannelEvent({required this.channel});
  @override
  List<Object?> get props => [channel];
}

class NewDataEvent extends HomeEvent {
  final dynamic data;

  NewDataEvent({required this.data});
  @override
  List<Object?> get props => [data];
}
