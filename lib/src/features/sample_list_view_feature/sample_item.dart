class SampleItem {
  String? name;
  String? instructions;
  String? imageUrl;

  @override
  String toString() {
    return '$name - $instructions -$imageUrl';
  }
}
