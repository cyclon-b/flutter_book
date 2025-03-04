import 'package:flutter_book/screens/home/home.dart';
import 'package:go_router/go_router.dart';


final appRoutes = [
  GoRoute(
    path: '/',
    builder: (context, state) => const Home(),
  ),
];


