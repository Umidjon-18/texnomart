part of 'home_bloc.dart';

class HomeState extends Equatable {
  List<dynamic> dataList;
  HomeState({
    this.dataList = const [],
  });
  @override
  List<Object?> get props => [dataList];

  HomeState copyWith({
    List<dynamic>? dataList,
  }) {
    return HomeState(
      dataList: dataList ?? this.dataList,
    );
  }
}
