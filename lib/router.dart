import 'package:ec/feature/admin/screen/add_product_screen.dart';
import 'package:ec/feature/auth/screen/auth_Screen.dart';
import 'package:ec/feature/auth/widgets/bottom_bar.dart';
import 'package:ec/feature/home/screens/catogery_screen.dart';
import 'package:ec/feature/home/screens/home_screen.dart';
import 'package:ec/feature/search/screen/search_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.routeName:
      {
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const AuthScreen(),
        );
      }

    case HomeScreen.routeName:
      {
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const HomeScreen(),
        );
      }

    case BottomBar.routeName:
      {
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const BottomBar(),
        );
      }
    case AddProductScreen.routeName:
      {
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const AddProductScreen(),
        );
      }
    case CatogeryScreen.routeName:
      {
        var catogery = routeSettings.arguments as String;
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => CatogeryScreen(
            catogery: catogery,
          ),
        );
      }
    case SearchScreen.routeName:
      {
        var searchquery = routeSettings.arguments as String;
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => SearchScreen(
            searchQuery: searchquery,
          ),
        );
      }
    default:
      {
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const Scaffold(
            body: Center(
              child: Text("Error 404"),
            ),
          ),
        );
      }
  }
}
