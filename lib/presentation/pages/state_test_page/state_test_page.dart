import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_test/presentation/pages/components/bloc_build_body.dart';
import 'package:flutter_bloc_test/presentation/pages/home_page/home_page.dart';
import 'package:flutter_bloc_test/presentation/tile_bloc/bloc.dart';
import 'package:flutter_bloc_test/presentation/tile_bloc_B/blocB.dart';

class StateTestPage extends StatelessWidget {
  static const routeName = '/stateTestPage';
  const StateTestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: null,
        body: MultiBlocListener(
          listeners: [
            BlocListener<TileBloc, TileState>(
              listener: (context, state) {},
            ),
            BlocListener<TileBlocB, TileStateB>(
              listener: (context, state) {},
            ),
          ],
          child: SingleChildScrollView(
            child: Column(
              children: [
                // BlocBuildBody<TileBloc, TileState>(
                //   route: HomePage.routeName,
                //   childState: TileState,
                // ),
                // BlocBuildBody<TileBlocB, TileStateB>(
                //   route: HomePage.routeName,
                //   childState: TileStateB,
                // ),
              ],
            ),
          ),
        )
        // SingleChildScrollView(
        // child: C,
        // ),
        );
  }
}
