part of 'home_cubit.dart';

class HomeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {}

class HomeDataLoading extends HomeState {}

class HomeDataSuccess extends HomeState {}

class HomeDataError extends HomeState {
  final String errorMessage;

  HomeDataError({required this.errorMessage});
}
