import 'package:ec/feature/admin/screen/add_product_screen.dart';
import 'package:ec/feature/auth/screen/auth_Screen.dart';
import 'package:ec/feature/auth/widgets/bottom_bar.dart';
import 'package:ec/feature/home/screens/home_screen.dart';
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
          builder: (_) => const BottomBar(),
        );
      }
    case AddProductScreen.routeName:
      {
        return MaterialPageRoute(
          builder: (_) => const AddProductScreen(),
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
