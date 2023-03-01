part of 'dashboard_bloc.dart';

@immutable
abstract class DashboardState {}

class DashboardInitial extends DashboardState {}

class DashboardLoading extends DashboardState {}

class DashboardSuccess extends DashboardState {
  final PokemonsModel model;
  DashboardSuccess({required this.model});
}

class DashboardError extends DashboardState {}
