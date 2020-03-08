import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:graphql_wordpress/Model/PostModel.dart';
import 'package:graphql_wordpress/Provider/Graphqldata.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body:Query(
  options: QueryOptions(
    documentNode: gql(getpost), // this is the query string you just created
    
    pollInterval: 2000,
  ),
  // Just like in apollo refetch() could be used to manually trigger a refetch
  // while fetchMore() can be used for pagination purpose
  builder: (QueryResult result, { VoidCallback refetch, FetchMore fetchMore }) {
    if (result.hasException) {
        return Center(child: Text(result.exception.toString()));
    }

    if (result.loading) {
      return Center(child: Text('Loading'));
    }

    // it can be either Map or List
    List repositories = result.data['posts']['nodes'];

    return ListView.builder(
      itemCount: repositories.length,
      itemBuilder: (context, index) {
        var data = Node.fromJson(repositories[index]);

        return ListTile(
          leading: CircleAvatar(
            child: Image.network(data.featuredImage.sourceUrl),
          ),
          title: Text(data.title),
          subtitle: Text(data.specialMessage.message??'no special message'),
        );
    });
  },
)
      
    );
  }
}