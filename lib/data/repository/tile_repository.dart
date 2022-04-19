import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_test/core/error/failure.dart';
import 'package:flutter_bloc_test/data/model/tile_model.dart';

abstract class TileRepository {
  Future<Either<Failure, List<Tile>>> initTiles();
  Future<Either<Failure, List<Tile>>> loadTiles(
      {required String title, required String contents});
}
