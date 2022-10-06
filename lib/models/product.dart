class Product {
  final String name;
  final String dosageForm;
  final String category;
  final List<String> img;
  // final String note;
  // final String company;
  // final String generic;
  // final String img;
  // final String genericID;

  Product({
    required this.name,
    required this.category,
    required this.dosageForm,
    required this.img,
    // required this.company,
    // required this.generic,
    // required this.img,
    // required this.genericID,
  });

  factory Product.fromMap(Map<String, dynamic> map) {
    var _imag = List<String>.from(map['images'] as Iterable<dynamic>);
    return Product(
      name: map['name'].toString(),
      category: map['category'].toString(),
      dosageForm: map['dosageForm'].toString(),
      img: _imag.isEmpty ? ["#"] : _imag,
      // factory BrandDrugs.fromMap(Map<String, dynamic> map) {
      // company: map['company'].toString(),
      // generic: map['generic'].toString(),
      // img: map['img'].toString(),
      // genericID: map['genericID'].toString(),
    );
  }
}
