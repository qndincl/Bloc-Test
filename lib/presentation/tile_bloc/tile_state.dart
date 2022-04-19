import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_test/core/error/default_failure.dart';
import 'package:flutter_bloc_test/core/error/failure.dart';
import 'package:flutter_bloc_test/data/model/tile_model.dart';
import 'package:flutter_bloc_test/presentation/pages/root_state/root_state.dart';

class SuperiorStateA extends Equatable {
  @override
  List<Object?> get props => [];
}

extension TileStateExtension on Object {
  TileInitial get initial => TileInitial();
  TileLoading get loading => TileLoading();
  Type get loaded => TileLoaded(tiles: TileState().tilesSum).runtimeType;
  Type get updating => TileUpdating(tiles: TileState().tilesSum).runtimeType;
  TileError get error =>
      TileError(failure: DefaultFailure(code: "extension on object error"));
  // List<Tile> get tiles => TileState().tilesSum;

}
// extension TileStateExtension on SuperiorStateA {
//   TileInitial get initialy => TileInitial();
//   TileLoading get loading => TileLoading();
//   TileLoaded get loaded => TileLoaded(tiles: props as List<Tile>);
//   TileUpdating get updating => TileUpdating(tiles: props as List<Tile>);
//   TileError get error =>
//       TileLoading(failure: DefaultFailure(code: "TileState 에러"));
// }

@immutable
// ignore: must_be_immutable
class TileState extends SuperiorStateA with EquatableMixin {
  List<Tile> tilesSum = [];

  List<Tile> copywith({List<Tile>? tileSum}) {
    return tileSum ?? [];
  }

  @override
  List<Object?> get props => [];
}

class TileInitial extends TileState {
  @override
  List<Object> get props => [];
}

class TileLoading extends TileState {
  @override
  List<Object> get props => [];
}

class TileUpdating extends TileState {
  final List<Tile> tiles;
  TileUpdating({required this.tiles}) {
    tilesSum = tiles;
  }

  @override
  List<Object> get props => tiles;
}

class TileLoaded extends TileState {
  final List<Tile> tiles;
  TileLoaded({required this.tiles}) {
    tilesSum = tiles;
  }

  @override
  List<Object> get props => tiles;
}

class TileError extends TileState {
  final Failure? failure;
  TileError({required this.failure});
}
