import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

//? Equatable : to prevent unnecessary rebuilds.
@immutable
abstract class TileEvent extends Equatable {}

class TileInitialEvent extends TileEvent {
  @override
  List<Object> get props => [];
}

class TileLoadEvent extends TileEvent {
  @override
  List<Object> get props => [];
}
