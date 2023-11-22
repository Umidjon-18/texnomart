import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:laravel_flutter_pusher/laravel_flutter_pusher.dart';
import 'package:texnomart/assets/app_constants.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  LaravelFlutterPusher pusherClient = LaravelFlutterPusher(
    AppConstants.pusherKey,
    PusherOptions(
      host: AppConstants.host,
      port: AppConstants.port,
      cluster: AppConstants.cluster,
      encrypted: true,
    ),
    onError: (p0) {
      Fluttertoast.showToast(msg: p0.message, gravity: ToastGravity.TOP);
    },
    onConnectionStateChange: (p0) {
      Fluttertoast.showToast(msg: "Connection changed", gravity: ToastGravity.TOP);
    },
  );
  HomeBloc() : super(HomeState()) {
    on<SubscribeToChannelEvent>(_subscribeToChannel);
    on<UnSubscribeChannelEvent>(_unSubscribeChannel);
    on<NewDataEvent>(_newDataEvent);
  }

  _subscribeToChannel(SubscribeToChannelEvent event, emit) {
    pusherClient.subscribe(event.channel).bind(event.event, (data) => add(NewDataEvent(data: data)));
  }

  _unSubscribeChannel(UnSubscribeChannelEvent event, emit) {
    pusherClient.unsubscribe(event.channel);
  }

  _newDataEvent(event, emit) {
    var dataList = List.from(state.dataList);
    dataList.add(event.data);
    emit(state.copyWith(dataList: dataList));
  }
}
