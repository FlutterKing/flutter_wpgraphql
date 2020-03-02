import 'package:flutter/material.dart';
import 'package:graphql_wordpress/Screens/HomeScreen.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main() => runApp(MyApp());
final HttpLink httpLink = HttpLink(
  uri: 'https://news.kingsworld.net//graphql',
);

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      cache: InMemoryCache(),
      link: httpLink,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: client,
      child: CacheProvider(
        child: MaterialApp(
            title: 'Flutter Graphql',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.red,
            ),
            home: HomeScreen()),
      ),
    );
  }
}
