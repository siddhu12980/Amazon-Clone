import 'package:ec/constants/global_variable.dart';
import 'package:ec/feature/account/screen/account_screen.dart';
import 'package:ec/feature/admin/screen/admin_screen.dart';
import 'package:ec/feature/auth/screen/auth_Screen.dart';
import 'package:ec/feature/auth/services/auth_services.dart';
import 'package:ec/feature/auth/widgets/bottom_bar.dart';
import 'package:ec/provider/user_provider.dart';
import 'package:ec/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => UserProvider())],
      child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    authService.getUserData(context);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: GlobalVariable.backgroundColor,
          colorScheme: const ColorScheme.light(
            primary: GlobalVariable.secondaryColor,
          ),
          useMaterial3: true,
          appBarTheme: const AppBarTheme(
              elevation: 0, iconTheme: IconThemeData(color: Colors.black12))),
      onGenerateRoute: (settings) => generateRoute(settings),
      // home: Provider.of<UserProvider>(context).user.token.isNotEmpty
      //     ? Provider.of<UserProvider>(context).user.role == "user"
      //         ? const BottomBar()
      //         : const AdminScreen()
      //     : const AuthScreen(),
      home: const AdminScreen(),
    );
  }
}
