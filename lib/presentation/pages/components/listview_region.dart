import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_test/data/model/tile_model.dart';
import 'package:flutter_bloc_test/presentation/tile_bloc/bloc.dart';

class ListViewRegion extends StatefulWidget {
  ListViewRegion({
    // Key? key,
    required this.size,
    required this.tiles,
    required this.route,
  });
  // : super(key: key);

  final Size size;
  List<Tile> tiles;
  final String route;

  @override
  State<ListViewRegion> createState() => _ListViewRegionState();
}

class _ListViewRegionState extends State<ListViewRegion> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: widget.size.height - 200,
          child: ListView.builder(
              itemCount: widget.tiles.length,
              itemBuilder: (
                BuildContext context,
                int index,
              ) {
                return ListTile(
                    title: Text(widget.tiles[index].title),
                    subtitle: Text(widget.tiles[index].contents));
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
                  Navigator.pushNamed(context, widget.route);
                },
                child: const Text("Go to Page")),
          ],
        ),
      ],
    );
  }
}
