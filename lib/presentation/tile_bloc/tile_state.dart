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

// extension TileStateExtension on Object {
//   Object get initialy => TileState().initialy;
// }
extension TileStateExtension on SuperiorStateA {
  TileInitial get initialy => TileInitial();
  TileLoading get loading => TileLoading();
  TileLoaded get loaded => TileLoaded(tiles: props as List<Tile>);
  TileUpdating get updating => TileUpdating(tiles: props as List<Tile>);
  TileError get error =>
      TileError(failure: DefaultFailure(code: "TileState 에러"));
}

@immutable
class TileState extends SuperiorStateA with EquatableMixin {
  @override
  List<Object?> get props => [];
}

class TileInitial<T> extends TileState {
  @override
  List<Object> get props => [];
}

class TileLoading extends TileState {
  @override
  List<Object> get props => [];

  @override
  bool same(Object other) {
    if (identical(RootLoading, other)) return true;
    return false;
  }
}

class TileUpdating extends TileState {
  @override
  final List<Tile> tiles;
  TileUpdating({required this.tiles});

  @override
  List<Object> get props => tiles;
}

class TileLoaded extends TileState {
  @override
  final List<Tile> tiles;
  TileLoaded({required this.tiles});

  @override
  List<Object> get props => tiles;
}

class TileError extends TileState {
  final Failure? failure;
  TileError({required this.failure});
}
