import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_test/data/repository_impl/tile_repository_impl.dart';
import 'package:flutter_bloc_test/injection_container.dart';
import 'package:flutter_bloc_test/presentation/pages/home_page/home_page.dart';
import 'package:flutter_bloc_test/presentation/pages/state_test_page/state_test_page.dart';
import 'package:flutter_bloc_test/presentation/tile_bloc/tile_bloc.dart';
import 'package:flutter_bloc_test/presentation/tile_bloc_B/tile_blocB.dart';

import 'data/repository/tile_repository.dart';

class PageRouter {
  static final initial = HomePage.routeName;
  static final routes = {
    // StateTestPage.routeName: (context) => StateTestPage(),
    StateTestPage.routeName: (context) => MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => sl<TileBloc>()),
            BlocProvider(create: (context)=> sl<TileBlocB>()),
            // BlocProvider(create: (context)=> sl<TileBlocC>()),
            // BlocProvider(create: (context)=> sl<TileBlocD>()),
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
