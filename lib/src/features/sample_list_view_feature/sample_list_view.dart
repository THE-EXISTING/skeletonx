import 'package:skeletonx/core/core.dart';
import 'package:skeletonx/src/features/sample_list_view_feature/sample_details_view.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'sample_item.dart';

class SampleListView extends StatefulWidget {
  const SampleListView({Key? key}) : super(key: key);

  @override
  State<SampleListView> createState() => _SampleListViewState();
}

class _SampleListViewState extends State<SampleListView> {
  final items = [];

  @override
  void initState() {
    getDataFromInternet().then((value) {
      setState(() {
        items.addAll(value);
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cocktail')),
      body: Container(
        color: Colors.blueGrey[500],
        child:
            items.isEmptyOrNull ? _buildProgressBar() : _buildListView(context),
      ),
    );
  }

  Center _buildProgressBar() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildListView(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return _buildItem(
          context,
          items[index],
        );
      },
    );
  }

  Widget _buildItem(BuildContext context, SampleItem item) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        color: Colors.blueGrey[600],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              item.name.toString(),
            ),
            IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SampleDetailsView(item: item),
                ));
              },
              icon: const Icon(Icons.pageview),
              iconSize: 30,
            )
          ],
        ),
      ),
    );
  }

  Future<List<SampleItem>> getDataFromInternet() async {
    await Future.delayed(const Duration(seconds: 1));

    final List<SampleItem> items = [];

    final url = Uri.https(
      'www.thecocktaildb.com',
      'api/json/v1/1/search.php',
      {'s': 'martini'},
    );

    final response = await http.get(url);
    if (response.statusCode == 200) {
      final jsonResponse = convert.jsonDecode(response.body);

      final drinks = jsonResponse['drinks'];

      for (var drink in drinks) {
        final item = SampleItem()
          ..name = drink['strDrink']
          ..instructions = drink['strInstructions']
          ..imageUrl = drink['strDrinkThumb'];

        items.add(item);
      }
    }

    return items;
  }
}
