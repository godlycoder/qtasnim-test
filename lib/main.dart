import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qtasnim_test/app/bloc/item_cubit.dart';

import 'package:qtasnim_test/injection.dart' as di;
import 'package:qtasnim_test/router/router.gr.dart';

final _appRouter = AppRouter();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<ItemCubit>(
              create: (_) => di.locator<ItemCubit>()
          )
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          useInheritedMediaQuery: true,
          routerDelegate: _appRouter.delegate(),
          routeInformationParser: _appRouter.defaultRouteParser(),
        )
    );
  }
}