import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_test/core/error/default_failure.dart';
import 'package:flutter_bloc_test/core/error/failure.dart';
import 'package:flutter_bloc_test/data/model/tile_model.dart';
import 'package:flutter_bloc_test/presentation/pages/root_state/root_state.dart';

// extension TileStateExtension2 on TileState {
//   // TileInitial get initialy => TileInitial();
//   TileInitial initialy() => TileInitial();
// }
//! 방식 5: 문제점은 제네릭으로 받아서 creator로 생성한 객체의 extension을 인식못하는 에러(S & Object에러)
//! 즉 이것을 해결하는 방법으로서 Object에 대한 extension을 다시 선언함으로써 징검다리를 만들어줌으로써 해결.
//! 우선 방식5로 구현
//! 방식 1: 각 클래스 안에 getter를 만들면 bloc build body에서 갹체를 받으면 호출이 가능했다..잠깐 이거 방식 5를 응용하면 방식2 가능한거 아냐?
//! (방식2 테스트 도중에 TileSTate를 abstract가 아닌 일반 클래스로 만들었을 때 안에 getter를 사용해서 테스트를 했었음)
//! 와 씁 ??
// extension TileStateForGeneric on Object {
//   Object get initialy => TileState().initialy; //! 방식5 :드디어 해결은 했는데
// //! 이 방식이 좋을까 아니면 방식 1의 각각의 스테이트 안에 getter만들어주는게 나을까 - 이게 더 나은듯 아무래도 한곳에서 관리할수있으니
//   Object get loading => TileState().loading;
//   Object get loaded => TileState().loaded;
//   Object get updating => TileState().updating;
//   Object get error => TileState().error;
// }

class SuperiorStateA extends Equatable {
  @override
  List<Object?> get props => [];
}

extension TileStateExtension on SuperiorStateA {
// extension TileStateExtension on RootState {
// extension RootStateExtension on RootState {
// extension TileStateExtension2 on Object {
// extension TileStateExtension on TileInitial {
  // TileState get initial => TileInitial();
  // TileInitial get initial => TileInitial().runtimeType;
  // Type get initial => TileInitial().runtimeType;
  //Type TileState TileInitial
  // TileInitial get initial {
  //   const dynamic a = TileInitial;
  //   return a;
  // }

  // getState() {
  //   switch(this) {
  //     case: initialy :
  //   }
  // }

  TileInitial get initialy => TileInitial();
  // TileState get initialy => TileInitial();
  // RootState get initialy => TileInitial();

  // TileInitial get initial {
  //   dynamic a = () => TileInitial();
  //   return a;
  // }
  // Type get loading => TileLoading().runtimeType;
  TileLoading get loading => TileLoading();
  // TileState get loading => TileLoading();

  TileLoaded get loaded => TileLoaded(tiles: props as List<Tile>);
  // TileState get loaded => TileLoaded(tiles: props as List<Tile>);
  // TileState get loaded => TileLoaded(tiles: props);
  // class get loaded => TileLoaded(tiles: props as List<Tile>).runtimeType;
  // Type get loadedType => TileLoaded(tiles: props as List<Tile>).runtimeType;

  // Type get updating => TileUpdating(tiles: props as List<Tile>).runtimeType;
  TileUpdating get updating => TileUpdating(tiles: props as List<Tile>);
  // TileState get updating => TileUpdating(tiles: props as List<Tile>);

  // TileError get error => TileError(message: props as String);
  TileError get error =>
      TileError(failure: DefaultFailure(code: "TileState 에러"));
  // TileState get error => TileError(failure: props as Failure);
  // Type get error => TileError(message: props as String).runtimeType;

  // get props => props ?? [];
  // TileUpdating get updating => TileUpdating(tiles: props as List<Tile>);
  // TileError get error => TileError(message: props as String);
  // TileState get updating => TileUpdating(tiles: props as List<Tile>);
  // TileState get error => TileError(message: props as String);
  // String get initial => 'TileInitial';
  // String get loading => 'TileLoading';
  // String get loaded => 'TileLoaded';
  // String get updating => 'TileUpdating';
  // String get error => 'TileError';
}

// class AA extends Object {}

// class BB extends TileState {
//   @override
//   // TODO: implement prop
//   List<Object?> get props => throw UnimplementedError();
// }

// class ST extends TileState {}

//? Equatable : to prevent unnecessary rebuilds.
@immutable
// class TileState extends RootState with EquatableMixin {
class TileState extends SuperiorStateA with EquatableMixin {
  // TileInitial get initialyy => TileInitial(); //! 방식 1 테스트를 한 코드

  @override
  List<Object?> get props => [];
// abstract class TileState extends Equatable {
  // const TileState();

}

class TileInitial<T> extends TileState {
  // static TileInitial _instance = TileInitial();
  // // static TileInitial get instance => _instance;
  // factory TileInitial() {
  //   return _instance;
  // }

  @override
  List<Object> get props => [];

  // @override
  // bool same(Object other) {
  //   if (identical(RootInitial, other)) return true;
  //   return false;
  // }
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
  // List<Object> get props => [tiles];

  //  bool same(TileUpdating other) {
  //   if (identical(RootUpdating, other)) return true;
  //   return false;
  // }
  // @override
  // bool same(Object other) {
  //   if (identical(RootUpdating, other)) return true;
  //   return false;
  // }
}

class TileLoaded extends TileState {
  @override
  final List<Tile> tiles;
  TileLoaded({required this.tiles});

  @override
  List<Object> get props => tiles;
  // List<Object> get props => [tiles];

  // @override
  // bool same(Object other) {
  //   if (identical(RootLoaded, other)) return true;
  //   return false;
  // }
}

class TileError extends TileState {
  final Failure? failure;
  TileError({required this.failure});

  // @override
  // bool same(Object other) {
  //   if (identical(RootError, other)) return true;
  //   return false;
  // }
  // @override
  // List<Object> get props => [message];
  // List<Object> get props => failure;
}
