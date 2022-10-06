class Invoice {
  final int duration;
  final int price;
  final String title;
  const Invoice({
    required this.duration,
    required this.price,
    required this.title,
  });

  factory Invoice.fromMap(Map<String, dynamic> doc) {
    return Invoice(
      title: doc['title'].toString(),
      duration: int.tryParse(doc['duration'].toString())!,
      price: int.tryParse(doc['amount'].toString())!,
    );
  }
}
