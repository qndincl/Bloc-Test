import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_test/injection_container.dart';
import 'package:flutter_bloc_test/presentation/pages/home_page/home_page.dart';
import 'package:flutter_bloc_test/presentation/pages/state_test_page/state_test_page.dart';
import 'package:flutter_bloc_test/presentation/tile_bloc/tile_bloc.dart';
import 'package:flutter_bloc_test/presentation/tile_bloc_B/tile_blocB.dart';

class PageRouter {
  static final initial = HomePage.routeName;
  static final routes = {
    StateTestPage.routeName: (context) => MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => sl<TileBloc>()),
            BlocProvider(create: (context) => sl<TileBlocB>()),
          ],
          child: const StateTestPage(),
        ),
    // StateTestPage.routeName: (context) => BlocProvider.value(
    //       value: sl<TileBloc>(),
    //       child: const StateTestPage(),
    //     ),
    HomePage.routeName: (context) => BlocProvider.value(
          value: sl<TileBloc>(),
          child: const HomePage(),
        )
  };
}
