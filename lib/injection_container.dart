import 'package:flutter_bloc_test/data/repository/tile_repository.dart';
import 'package:flutter_bloc_test/data/repository_impl/tile_repository_impl.dart';
import 'package:flutter_bloc_test/presentation/tile_bloc/bloc.dart';
import 'package:flutter_bloc_test/presentation/tile_bloc/tile_bloc.dart';
import 'package:flutter_bloc_test/presentation/tile_bloc_B/blocB.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => TileBloc(tileRepository: TileRepositoryImpl()));
  sl.registerFactory(() => TileBlocB(tileRepository: TileRepositoryImpl()));
  // sl.registerFactory(() => TileState());
  // sl.call();
// Repository
  // sl.registerLazySingleton<TileRepository>(
  //   () => TileRepositoryImpl(),
  // );
}
