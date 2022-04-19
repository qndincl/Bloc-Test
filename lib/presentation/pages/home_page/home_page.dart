import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_test/data/model/tile_model.dart';
import 'package:flutter_bloc_test/injection_container.dart';
import 'package:flutter_bloc_test/presentation/pages/components/bloc_build_body.dart';
import 'package:flutter_bloc_test/presentation/pages/components/listview_region.dart';
import 'package:flutter_bloc_test/presentation/pages/mixin/alert_mixin.dart';
import 'package:flutter_bloc_test/presentation/pages/state_test_page/state_test_page.dart';
import 'package:flutter_bloc_test/presentation/tile_bloc/bloc.dart';
import 'package:flutter_bloc_test/presentation/tile_bloc/tile_bloc.dart';
import 'package:flutter_bloc_test/presentation/tile_bloc_B/blocB.dart';
import 'package:flutter_bloc_test/presentation/widgets/loading_widget.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/homePage';

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AlertMixin {
  Future<void> tempF() async {
    showAlertWithFunction(title: "temp", content: "temp");
  }

  // final TileBloc _tileBloc =
  //     TileBloc(tileRepository: TileRepositoryImpl()); //? 글로벌 변수로 안받아짐

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: const Text("tiles bloc")),
      body: Container(
        height: size.height,
        child: RefreshIndicator(
          onRefresh: () async {
            // await tempF();
            BlocProvider.of<TileBloc>(context).add(TileInitialEvent());
          },
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Container(child: buildBody(context)),
                // ignore: avoid_unnecessary_containers
                Container(
                    child: BlocBuildBody<TileBloc, TileState>(
                  // child: BlocBuildBody<TileBloc, TileStateB>(
                  route: StateTestPage.routeName,
                  // childState: TileState,
                  // childState: TileState(),
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // BlocProvider<TileBloc> buildBody(BuildContext context) {
  //   // final state = context.select((TileBloc b) => b.state);
  //   Size size = MediaQuery.of(context).size;

  //   return BlocProvider(
  //     create: (_) => sl<TileBloc>(),
  //     child: BlocBuilder<TileBloc, TileState>(builder: (context, state) {
  //       if (state is TileInitial) {
  //         BlocProvider.of<TileBloc>(context).add(TileInitialEvent());

  //         return const LoadingWidget();
  //       } else if (state is TileLoading) {
  //         return const LoadingWidget();
  //       } else if (state is TileLoaded) {
  //         return ListViewRegion(
  //           size: size,
  //           tiles: state.tiles,
  //           route: StateTestPage.routeName,
  //         );
  //       } else if (state is TileUpdating) {
  //         return Stack(
  //           children: [
  //             ListViewRegion(
  //               size: size,
  //               tiles: state.tiles,
  //               route: StateTestPage.routeName,
  //             ),
  //             Positioned(
  //                 top: size.height / 3,
  //                 left: size.width / 2,
  //                 child: const Center(child: CircularProgressIndicator())),
  //           ],
  //         );
  //       } else if (state is TileError) {
  //         showAlertWithFunction(title: "temp", content: "temp");
  //       }
  //       return const SizedBox(
  //           width: 200, height: 200, child: Text("something odd"));
  //     }),
  //   );
  // }
}

// class ListViewRegion extends StatelessWidget {
//   const ListViewRegion({
//     Key? key,
//     required this.size,
//     required this.tiles,
//   }) : super(key: key);

//   final Size size;
//   final List<Tile> tiles;
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         SizedBox(
//           height: size.height - 200,
//           child: ListView.builder(
//               // scrollDirection: Axis.vertical,
//               // shrinkWrap: true,
//               // physics: const AlwaysScrollableScrollPhysics(),
//               // itemCount: _tileBloc.tiles.length,
//               // itemCount: TileBloc.tiles.length,
//               itemCount: tiles.length,
//               itemBuilder: (
//                 BuildContext context,
//                 int index,
//               ) {
//                 return ListTile(
//                     title: Text(tiles[index].title),
//                     subtitle: Text(tiles[index].contents));
//               }),
//         ),
//         Row(
//           children: [
//             MaterialButton(
//                 onPressed: () {
//                   BlocProvider.of<TileBloc>(context).add(TileLoadEvent());
//                 },
//                 child: const Text("button")),
//             MaterialButton(
//                 onPressed: () {
//                   Navigator.pushNamed(context, StateTestPage.routeName);
//                 },
//                 child: const Text("State Page")),
//           ],
//         ),
//       ],
//     );
//   }
// }
