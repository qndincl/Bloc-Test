import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_test/presentation/pages/components/bloc_build_body.dart';
import 'package:flutter_bloc_test/presentation/pages/mixin/alert_mixin.dart';
import 'package:flutter_bloc_test/presentation/pages/state_test_page/state_test_page.dart';
import 'package:flutter_bloc_test/presentation/tile_bloc/bloc.dart';
import 'package:flutter_bloc_test/presentation/tile_bloc/tile_bloc.dart';

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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: const Text("tiles bloc")),
      body: Container(
        height: size.height,
        child: RefreshIndicator(
          onRefresh: () async {
            BlocProvider.of<TileBloc>(context).add(TileInitialEvent());
          },
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              children: [
                BlocBuildBody<TileBloc, TileState>(
                  route: StateTestPage.routeName,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
