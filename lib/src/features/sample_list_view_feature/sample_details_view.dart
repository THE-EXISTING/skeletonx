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
              const SizedBox(height: 20),
              _buildTitleText(),
              const SizedBox(height: 20),
              _buildImage(),
              const SizedBox(height: 20),
              _buildInstructionsText(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitleText() {
    return Text(
      widget.item.name.toString(),
      style: Theme.of(context).textTheme.titleLarge,
    );
  }

  Widget _buildImage() {
    return Container(
      width: 200,
      height: 200,
      child: Image.network(widget.item.imageUrl.toString()),
    );
  }

  Widget _buildInstructionsText() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Text(
            '- Instructions -',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 20),
          Text(widget.item.instructions.toString()),
        ],
      ),
    );
  }
}
