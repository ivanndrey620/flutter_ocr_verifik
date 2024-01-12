class ScannedText {
  final String name;
  final String lastname;
  final String cui;
  final String nacionality;
  final String dateOfBirth;
  final String countryOfBirth;
  final String sex;

  ScannedText({
    required this.name,
    required this.lastname,
    required this.cui,
    required this.nacionality,
    required this.dateOfBirth,
    required this.countryOfBirth,
    required this.sex,
  });

  String get completeName => '$name $lastname';
}
