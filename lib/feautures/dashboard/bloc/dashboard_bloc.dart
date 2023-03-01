import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:poke_app/feautures/dashboard/model/pokemons_model.dart';
import 'package:poke_app/feautures/dashboard/repositories/get_pokemon_repo.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc({
    required this.repo,
  }) : super(DashboardInitial()) {
    on<GetPokemonsEvent>((event, emit) async {
      emit(
        DashboardLoading(),
      );
      try {
        final model = await repo.getPokemons();
        emit(
          DashboardSuccess(model: model),
        );
      } catch (e) {
        emit(
          DashboardError(),
        );
      }
    });
  }
  final GetPokemonRepo repo;
}
