import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_test/core/error/default_failure.dart';
import 'package:flutter_bloc_test/data/model/tile_model.dart';
import 'package:flutter_bloc_test/core/error/failure.dart';
import 'package:flutter_bloc_test/data/repository/tile_repository.dart';

class TileRepositoryImpl extends TileRepository {
  // TileRepositoryImpl({}) {}
  List<Tile> result = [];
  @override
  Future<Either<Failure, List<Tile>>> initTiles() async {
    for (var i = 0; i < 5; i++) {
      result.add(Tile(title: "title", contents: "contents", favorite: false));
      if (result.last.title == '') {
        return Left(DefaultFailure(code: 'repo_Impl fail'));
      }
    }
    return Right(result);
  }

  @override
  Future<Either<Failure, List<Tile>>> loadTiles(
      {required String title, required String contents}) async {
    for (var i = 0; i < 5; i++) {
      result.add(Tile(title: title, contents: contents, favorite: false));
      //error test
      if (i == 4) {
        result.add(Tile(title: '', contents: '', favorite: false));
      }
      if (result.last.title == '') {
        return Left(DefaultFailure(code: 'repo_Impl fail'));
      }
    }
    return Right(result);
  }
}
