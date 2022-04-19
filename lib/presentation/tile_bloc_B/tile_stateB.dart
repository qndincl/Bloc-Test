// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_test/core/error/default_failure.dart';
import 'package:flutter_bloc_test/core/error/failure.dart';
import 'package:flutter_bloc_test/data/model/tile_model.dart';
import 'package:flutter_bloc_test/presentation/pages/root_state/root_state.dart';

class SuperiorStateB extends Equatable {
  @override
  List<Object?> get props => [];
}

extension TileStateExtensionB on Object {
  Object get initial => TileInitialB();
  Object get loading => TileLoadingB();
  Object get loaded => TileLoadedB(tiles: TileStateB().tilesSum).runtimeType;
  Object get updating =>
      TileUpdatingB(tiles: TileStateB().tilesSum).runtimeType;
  Object get error =>
      TileErrorB(failure: DefaultFailure(code: "extension on object error"));
  // Object get tiles => [];
}

// extension TileStateExtensionB on SuperiorStateB {
//   TileStateB get initialy => TileInitialB();
//   TileStateB get loading => TileInitialB();
//   TileStateB get loaded => TileLoadedB(tiles: props as List<Tile>);
//   TileStateB get updating => TileUpdatingB(tiles: props as List<Tile>);
//   TileStateB get error =>
//       TileErrorB(failure: DefaultFailure(code: "TileStateB 에러"));
// }

@immutable
class TileStateB extends RootState with EquatableMixin {
  List<Tile> tilesSum = [];

  @override
  List<Object?> get props => [];
}

class TileInitialB extends TileStateB {
  @override
  List<Object> get props => [];
}

class TileLoadingB extends TileStateB {
  @override
  List<Object> get props => [];
}

class TileUpdatingB extends TileStateB {
  final List<Tile> tiles;

  TileUpdatingB({required this.tiles}) {
    tilesSum = tiles;
  }

  @override
  List<Object> get props => tiles;
}

class TileLoadedB extends TileStateB {
  final List<Tile> tiles;

  TileLoadedB({required this.tiles}) {
    tilesSum = tiles;
  }

  @override
  List<Object> get props => tiles;
}

class TileErrorB extends TileStateB {
  final Failure? failure;
  TileErrorB({required this.failure});
}
