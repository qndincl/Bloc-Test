import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_test/data/model/tile_model.dart';
import 'package:flutter_bloc_test/presentation/tile_bloc/bloc.dart';

class ListViewRegion extends StatelessWidget {
  const ListViewRegion({
    Key? key,
    required this.size,
    required this.tiles,
    required this.route,
  }) : super(key: key);

  final Size size;
  final List<Tile> tiles;
  final String route;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: size.height - 200,
          child: ListView.builder(
              // scrollDirection: Axis.vertical,
              // shrinkWrap: true,
              // physics: const AlwaysScrollableScrollPhysics(),
              // itemCount: _tileBloc.tiles.length,
              // itemCount: TileBloc.tiles.length,
              itemCount: tiles.length,
              itemBuilder: (
                BuildContext context,
                int index,
              ) {
                return ListTile(
                    title: Text(tiles[index].title),
                    subtitle: Text(tiles[index].contents));
              }),
        ),
        Row(
          children: [
            MaterialButton(
                onPressed: () {
                  BlocProvider.of<TileBloc>(context).add(TileLoadEvent());
                },
                child: const Text("button")),
            MaterialButton(
                onPressed: () {
                  Navigator.pushNamed(context, route);
                  // throw TileError(message: "message");
                },
                child: const Text("Go to Page")),
          ],
        ),
      ],
    );
  }
}
