import 'package:skeletonx/core/core.dart';
import 'package:skeletonx/src/features/sample_list_view_feature/details_view.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

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
        color: Colors.blueGrey,
        child: items.isEmptyOrNull
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : _buildListView(context),
      ),
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

  Widget _buildItem(BuildContext context, Item item) {
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
                  builder: (context) => DetailView(item: item),
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

  Future<List<Item>> getDataFromInternet() async {
    await Future.delayed(const Duration(seconds: 1));

    final List<Item> items = [];

    final url = Uri.https(
      'www.thecocktaildb.com',
      'api/json/v1/1/search.php',
      {'s': 'margarita'},
    );

    final response = await http.get(url);
    if (response.statusCode == 200) {
      final jsonResponse = convert.jsonDecode(response.body);

      final drinks = jsonResponse['drinks'];

      for (var drink in drinks) {
        final item = Item()
          ..name = drink['strDrink']
          ..description = drink['strInstructions']
          ..imageUrl = drink['strDrinkThumb'];

        items.add(item);
      }
    }

    return items;
  }
}

class Item {
  String? name;
  String? description;
  String? imageUrl;

  @override
  String toString() {
    return '$name - $description -$imageUrl';
  }
}
