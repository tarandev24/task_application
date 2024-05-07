part of 'bloc.dart';

abstract class ScreenState {}

class ScreenInitial extends ScreenState {}

class ScreenLoading extends ScreenState {}

class ScreenSuccess extends ScreenState {
  List<SampleData> data;
  ScreenSuccess(this.data);
}