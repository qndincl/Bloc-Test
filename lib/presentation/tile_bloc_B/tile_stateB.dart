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

// extension TileStateExtensionB on RootState {
extension TileStateExtensionB on SuperiorStateB {
// extension RootStateExtensionB on RootState {
  // TileInitialB get initial => TileInitialB();
  // TileStateB get initial => TileInitialB();
  // TileStateB get loading => TileLoadingB();
  // TileStateB get loaded => TileLoadedB(tiles: props as List<Tile>);
  // TileStateB get updating => TileUpdatingB(tiles: props as List<Tile>);
  // TileStateB get error => TileErrorB(message: props as String);
  // String get initial => 'TileInitialB';
  // String get loading => 'TileLoadingB';
  // String get loaded => 'TileLoadedB';
  // String get updating => 'TileUpdatingB';
  // String get error => 'TileErrorB';
  // TileInitialB get initialy => TileInitialB();
  TileStateB get initialy => TileInitialB();
  // RootState get initialy => TileInitialB();

  TileStateB get loading => TileLoadingB();
  // TileLoadingB get loading => TileLoadingB();

  // TileLoadedB get loaded => TileLoadedB(tiles: props as List<Tile>);
  TileStateB get loaded => TileLoadedB(tiles: props as List<Tile>);
  TileStateB get updating => TileUpdatingB(tiles: props as List<Tile>);
  // TileUpdatingB get updating => TileUpdatingB(tiles: props as List<Tile>);

  // TileErrorB get error => TileErrorB(message: props as String);
  TileStateB get error =>
      TileErrorB(failure: DefaultFailure(code: "TileStateB 에러"));
}

// class STB extends TileStateB {}

//? Equatable : to prevent unnecessary rebuilds.
@immutable
// class TileStateB extends Equatable {
class TileStateB extends RootState with EquatableMixin {
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

  TileUpdatingB({required this.tiles});

  @override
  List<Object> get props => tiles;
}

class TileLoadedB extends TileStateB {
  final List<Tile> tiles;

  TileLoadedB({required this.tiles});

  @override
  List<Object> get props => tiles;
}

class TileErrorB extends TileStateB {
  final Failure? failure;
  TileErrorB({required this.failure});
}
