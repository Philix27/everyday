class BrandDrugs {
  final String name;
  final String note;
  final String dosageForm;
  final String company;
  final String generic;
  final String img;
  final String genericID;
  final List<String> country;

  BrandDrugs({
    required this.name,
    required this.note,
    required this.dosageForm,
    required this.company,
    required this.generic,
    required this.img,
    required this.genericID,
    required this.country,
  });

  factory BrandDrugs.fromMap(Map<String, dynamic> map) {
    // factory BrandDrugs.fromMap(Map<String, dynamic> map) {
    return BrandDrugs(
      name: map['name'].toString(),
      note: map['note'].toString(),
      dosageForm: map['dosageForm'].toString(),
      company: map['company'].toString(),
      generic: map['generic'].toString(),
      img: map['img'].toString(),
      country: List<String>.from(map['country'] as Iterable<dynamic>),
      genericID: map['genericID'].toString(),
    );
  }
}
