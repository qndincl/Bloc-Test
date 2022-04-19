// ignore_for_file: file_names

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

//? Equatable : to prevent unnecessary rebuilds.
@immutable
abstract class TileEventB extends Equatable {}

class TileInitialEventB extends TileEventB {
  @override
  List<Object> get props => [];
}

class TileLoadEventB extends TileEventB {
  @override
  List<Object> get props => [];
}
