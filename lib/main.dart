import 'package:flutter/material.dart';
import 'package:state_8/providers/cart.dart';
import 'package:state_8/providers/orders.dart';
import 'package:state_8/screens/cart_screen.dart';
import 'package:state_8/screens/order_screen.dart';
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Products(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Orders(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          // textTheme: ColorScheme.,
          primaryColor: Colors.purple,
          fontFamily: 'Lato',
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.purple)
              .copyWith(secondary: Colors.deepOrange),
        ),
        home: ProductOverviewScreen(),
        routes: {
          ProductDetailScreen.rountName: (context) => ProductDetailScreen(),
          CartScreen.rountName: (context) => CartScreen(),
          OrderScreen.rountName: (context) => OrderScreen(),
        },
      ),
    );
  }
}
