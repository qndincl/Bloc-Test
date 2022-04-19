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
//   Object get initialy => TileState().initialy; //! 방식5 :드디어 해결은 했는데
// //! 이 방식은 어따 쓸까... 그냥 방식 1 각각의 스테이트 안에 getter만들어주는게 제일 날듯하다.

// }

// class BlocBuildBody<T extends Bloc<dynamic, S>, S extends RootState>
class BlocBuildBody<T extends Bloc<dynamic, S>, S extends SuperiorStateA>
    extends StatefulWidget {
  // dynamic childState;
  BlocBuildBody({
    Key? key,
    required this.route,
    // required this.childState,
    // required this.value,
  }) : super(key: key);

  final String route;

  //  late Bloc _bloc;
  // final State S;
//   void setBloc(T bloc){
//  _bloc = bloc as Bloc<dynamic, dynamic>;
//   }

  @override
  State<BlocBuildBody> createState() => _BlocBuildBodyState<T, S>();
}

class _BlocBuildBodyState<T extends Bloc<dynamic, S>, S extends SuperiorStateA>
    extends State<BlocBuildBody> with AlertMixin {
//   void setBloc(T bloc){
//  _bloc = bloc as Bloc<dynamic, dynamic>;
//   }
  // S val = Object() as S;

  // @override
  // Widget build(BuildContext context) {
  //   // final value = widget.val;

  //   return buildBody(
  //     context,
  //     route: widget.route,
  //   );
  // }
  // late S num2;
  // ItemCreator<S> creator = S as ItemCreator<S>;
  // void peace(S Function() creator) {
  //! 방식2가 안된다면 여기 함수 안에서 쇼브를 봐보자 -3 : 놉
  S peace(S Function() creator) {
    S t = creator();
    print('t =  $t');

    // var s = t?.initialy;
    // print(t.init);
    return t;
    // return s;
  }

  @override
  void initState() {
    // widget.val = SB();
    // num2 = peace(() => widget.val);

    super.initState();
  }

  @override
  BlocProvider<Bloc> build(BuildContext context) {
    // BlocProvider<Bloc> buildBody(
    //   BuildContext context, {
    //   required String route,
    //   // required Bloc T,
    //   // required State S,
    // }
    // ) {
    // final state = context.select((TileBloc b) => b.state);

    // TileState ab = TileState();
    // print(ab);
    // print(ab.initialy);
    // print(widget.childState);
    // var ss = widget.childState;
    // print(ss);

    print("ww");
    // print(widget.val.initialyß);

    // widget.val = sl<TileState>();
    // print(widget.val);
    // var num2 = peace(() => tl<S>());
    // var num2 = peace(() => widget.val);

    // print(num2?.initialy);

    // var tilestate =
    //     peace(() => widget.childState); //! 방식2   방식1 과 방식2 중에서 더 좋은 방식은?
    // print(tilestate);
    // print(tilestate.initialy);

    // var real = peace(() =>
    //     tilestate); //! 방식4 위에서 생성한 객체를 가지고 다시 재생성하면 extension에 접근할 수 있지 않을까? 놉
    // print(real);

    // print(real.initialy);
    // var ss = widget.a()  ;
    // print("widget.childState.initial");
    // print(tilestate.initialy);
    // print(ss.initialy);
    // print(ss.initialyy); //! 성공 세탁소,미용실 다녀와서.. 아래 구현부분도 바꾸기 방식1
    //! 방식2는 지금 빌드 전엔 저 tilestate가 TileState를 상속받을지 알수없어서.. 에러가나는긋
    //! 그렇다면 미리 알려줘서 에러안나게하려면?
    // print(widget.childState.initialy());
    // print("identical(TileInitial(), widget.childState.initial)");
    // print(identical(TileInitial(), widget.childState.initialy));
// RootState R=RootState();
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (_) => sl<T>(),
      child: BlocBuilder<T, S>(builder: (context, state) {
        // if (state.toString() == widget.childState.initial) {
        // var vl = tl<S>();

        // print(vl);
        print("state = $state");
        print("state.initialy = ${state.initialy}");
        if (state == state.initialy) {
          // if (state.same(state, state.initialy)) {
          // if (state == num2?.initialy) {
          // if (state == widget.childState.initial) {
          // if (identical(state, widget.childState.initial)) {
          // if (widget.childState.initial is state) {
          //!방식2로 먼저 구현
          // if (state == tilestate!.init) {
          //! 방식2 도 결국 같은 'S & Object'에러.. dartpad에선 됨. 왜지? 뭘 받는지 모르니까
          //! 제네릭만으로는 검사가 안되나봄
          //          print("asdf");
          BlocProvider.of<T>(context).add(TileInitialEvent());

          return const LoadingWidget();
          // } else if (state is TileLoading) {
          // } else if (state.toString() == widget.childState.loading) {
          // } else if (state == widget.childState.loading) {
        } else if (state == state.loading) {
          // } else if (state is TileStateB) {
          return const LoadingWidget();
          // } else if (state.toString() == TileLoaded) {
          // } else if (state is TileLoaded) {
          // } else if (state.toString() == widget.childState.loaded) {
        } else if (state == state.loaded) {
          // } else if (state == widget.childState.loadedType) {
          return ListViewRegion(
            size: size,
            // tiles: state!.tiles,
            // tiles: widget.childState.loaded.tiles,
            tiles: state.loaded.tiles as List<Tile>,
            route: widget.route,
          );
          // } else if (state is TileError) {
          // } else if (state == widget.childState.error) {
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
          // } else if (state is TileUpdating) {
          // } else if (state == widget.childState.updating) {
        }
        return const SizedBox(
            width: 200, height: 200, child: Text("something odd"));
      }),
    );
  }
}
