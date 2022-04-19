import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_test/core/error/default_failure.dart';
import 'package:flutter_bloc_test/core/error/failure.dart';
import 'package:flutter_bloc_test/data/model/tile_model.dart';

extension RootStateExtension on RootState {
  RootInitial get initialy => RootInitial();
  RootLoading get loading => RootLoading();
  // RootLoaded get loaded => RootLoaded(tiles: props as List<Tile>);
  RootLoaded get loaded => RootLoaded(tiles: props as List<Object>);
  // RootUpdating get updating => RootUpdating(tiles: props as List<Tile>);
  RootUpdating get updating => RootUpdating(tiles: props as List<Object>);
  RootError get error =>
      RootError(failure: DefaultFailure(code: "RootState 에러"));
}

class RootState extends Equatable {
  @override
  List<Object?> get props => [];
}

class RootInitial extends RootState {}

class RootLoading extends RootState {}

class RootLoaded extends RootState {
  // final List<Tile> tiles;
  final List<Object> tiles;
  RootLoaded({required this.tiles});
  @override
  List<Object> get props => tiles;
}

class RootUpdating extends RootState {
  // final List<Tile> tiles;
  final List<Object> tiles;

  RootUpdating({required this.tiles});
  @override
  List<Object> get props => tiles;
}

class RootError extends RootState {
  final Failure? failure;
  RootError({required this.failure});
}
