import 'package:falconx/falconx.dart';

import 'sample_item.dart';

class SampleDetailsView extends StatefulWidget {
  final SampleItem item;

  const SampleDetailsView({super.key, required this.item});

  @override
  State<SampleDetailsView> createState() => _SampleDetailsViewState();
}

class _SampleDetailsViewState extends State<SampleDetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.teal[300],
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              Text(
                widget.item.name.toString(),
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
              ),
              SizedBox(height: 30),
              Container(
                width: 200,
                height: 200,
                child: Image.network(widget.item.imageUrl.toString()),
              ),
              SizedBox(height: 50),
              const Text('Instructions'),
              SizedBox(height: 20),
              Text(widget.item.instructions.toString()),
            ],
          ),
        ),
      ),
    );
  }
}
