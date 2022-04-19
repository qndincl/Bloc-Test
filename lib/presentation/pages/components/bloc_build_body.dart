import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_test/data/model/tile_model.dart';
import 'package:flutter_bloc_test/injection_container.dart';
import 'package:flutter_bloc_test/presentation/pages/components/listview_region.dart';
import 'package:flutter_bloc_test/presentation/pages/mixin/alert_mixin.dart';
import 'package:flutter_bloc_test/presentation/tile_bloc/bloc.dart';
import 'package:flutter_bloc_test/presentation/widgets/loading_widget.dart';

typedef ItemCreator<S> = S Function();

// extension TileStateExtension2 on Object {
//   Object get initialy => TileState().initialy; //! 방식5 :드디어 해결..?
// //! 애매한, 이 프로젝트에서만 사용가능한 해결..
//! 그냥 이렇게 쓸 수 있다는것만 확인  이렇게 쓸 일은 없다
// }

// class BlocBuildBody<T extends Bloc<dynamic, S>, S extends RootState>
class BlocBuildBody<T extends Bloc<dynamic, S>, S extends SuperiorStateA>
    extends StatefulWidget {
  const BlocBuildBody({
    Key? key,
    required this.route,
  }) : super(key: key);

  final String route;

  @override
  State<BlocBuildBody> createState() => _BlocBuildBodyState<T, S>();
}

class _BlocBuildBodyState<T extends Bloc<dynamic, S>, S extends SuperiorStateA>
    extends State<BlocBuildBody> with AlertMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  BlocProvider<Bloc> build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (_) => sl<T>(),
      child: BlocBuilder<T, S>(builder: (context, state) {
        print("state = $state");
        print("state.initialy = ${state.initial}");
        if (state == state.initial) {
          BlocProvider.of<T>(context).add(TileInitialEvent());
          return const LoadingWidget();
        } else if (state == state.loading) {
          return const LoadingWidget();
        } else if (state == state.loaded) {
          return ListViewRegion(
            size: size,
            tiles: state.loaded.tiles as List<Tile>,
            route: widget.route,
          );
        } else if (state == state.updating) {
          return Stack(
            children: [
              ListViewRegion(
                size: size,
                tiles: state.loaded.tiles as List<Tile>,
                route: widget.route,
              ),
              Positioned(
                  top: size.height / 3,
                  left: size.width / 2,
                  child: const Center(child: CircularProgressIndicator())),
            ],
          );
        } else if (state == state.error) {
          showAlertWithFunction(title: "temp", content: "temp");
        }
        return const SizedBox(
            width: 200, height: 200, child: Text("something odd"));
      }),
    );
  }
}
