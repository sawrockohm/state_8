import 'package:flutter/material.dart';
import 'package:state_8/screens/products_overview_screen.dart';
import './screens/product_detail.dart';
import './providers/products.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Products(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: 'Lato',
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.purple)
              .copyWith(secondary: Colors.deepOrange),
        ),
        home: ProductOverviewScreen(),
        routes: {
          ProductDetailScreen.rountName: (context) => ProductDetailScreen()
        },
      ),
    );
  }
}
