import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_test/core/error/failure.dart';
import 'package:flutter_bloc_test/data/model/tile_model.dart';
import 'package:flutter_bloc_test/data/repository/tile_repository.dart';
import 'package:flutter_bloc_test/presentation/tile_bloc/tile_state.dart';
import 'package:logger/logger.dart';

import 'tile_event.dart';

class TileBloc extends Bloc<TileEvent, TileState> {
  late TileRepository _tileRepository;
  //  final List<Tile> tiles = [];

//! 8.0.0 버전 이후로는 on<> 으로 원하는 이벤트 헨들러 등록
//? Bad state: add(TileInitialEvent) was called without a registered event handler.
//? Make sure to register a handler via on<TileInitialEvent>((event, emit) {...})

  TileBloc({
    required TileRepository tileRepository,
  }) : super(TileInitial()) {
    _tileRepository = tileRepository;
    on<TileInitialEvent>(_onInitTileEvent);
    on<TileLoadEvent>(_onLoadTileEvent);
  }

//! 8.0.0 버전 이후로는 이런 방식 사용
  Future<void> _onInitTileEvent(
    TileInitialEvent event,
    Emitter<TileState> emit,
  ) async {
    var logger = Logger();

    try {
      emit(TileLoading());
      var either = await _tileRepository.initTiles();
      await Future.delayed(const Duration(seconds: 3));
      var result = either.fold((l) => l, (r) => r);
      if (either.isLeft()) emit(TileError(failure: result as Failure));

      emit(TileLoaded(tiles: result as List<Tile>));
    } catch (e) {
      // emit(TileError(failure: e as Failure));
      logger.d("error message =$e");
    }
  }

  Future<void> _onLoadTileEvent(
      TileLoadEvent event, Emitter<TileState> emit) async {
    var logger = Logger();
    try {
      //?  blocBase 의 state를 가져다 쓸 수 있다. 마지막으로 저장된 상태가 저장되있다.
      if (state is TileLoaded) {
        emit(TileUpdating(tiles: (state as TileLoaded).tiles));
      } else {
        emit(TileLoading());
      }
      var either =
          await _tileRepository.loadTiles(title: "title", contents: "contents");

      var result = either.fold((l) => l, (r) => r);
      if (either.isLeft()) emit(TileError(failure: result as Failure));

      if (state is TileLoaded) {
        (result as List<Tile>).addAll((state as TileLoaded).tiles);
      }

      await Future.delayed(const Duration(seconds: 2));
      emit(TileLoaded(tiles: result as List<Tile>));
    } catch (e) {
      logger.d("error message =$e");
    }
  }

//? 이전 방식
  // Stream<TileState> _mapInitEvent(TileInitialEvent event) async* {
  //   try {
  //     yield TileLoading();

  //     var either = await tileRepository.initTiles();
  //     var result = either.fold((l) => l, (r) => r);
  //     if (either.isLeft()) yield TileError(message: 'initial error');

  //     tiles = result as List<Tile>;
  //     Future.delayed(const Duration(seconds: 3));
  //     yield TileLoaded();
  //   } catch (e) {
  //     yield TileError(message: e.toString());
  //   }
  // }

  // Stream<TileState> _mapLoadEvent(TileLoadEvent event) async* {
  //   try {
  //     //?  blocBase 의 state를 가져다 쓸 수 있다. 마지막으로 저장된 상태가 저장되있다.
  //     yield TileLoading();
  //     var either =
  //         await tileRepository.loadTiles(title: "title", contents: "contents");

  //     var result = either.fold((l) => l, (r) => r);
  //     if (either.isLeft()) yield TileError(message: 'initial error');

  //     var tile = result as List<Tile>;
  //     for (var i = 0; i < tile.length; i++) {
  //       tiles.add(tile[i]);
  //     }
  //     Future.delayed(const Duration(seconds: 2));
  //     yield TileLoaded();
  //   } catch (e) {
  //     yield TileError(message: e.toString());
  //   }
  // }
}
