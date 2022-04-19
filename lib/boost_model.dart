String boostTable = 'boost'; // Making a table

class BoostModel {
  late final int? id;
  late final String name;
  late final int age;

  BoostModel({
    this.id,
    required this.name,
    required this.age,
  });

  Map<String, Object?> toJson() => {
        BoostFields.id: id,
        BoostFields.name: name,
        BoostFields.age: age,
      };

  BoostModel copy({
    int? id,
    int? age,
    String? name,
  }) =>
      BoostModel(
        id: id ?? this.id,
        age: age ?? this.age,
        name: name ?? this.name,
      );

  static BoostModel fromJson(Map<String, Object?> json) => BoostModel(
        id: json[BoostFields.id] as int,
        name: json[BoostFields.name] as String,
        age: json[BoostFields.age] as int,
      );
}

// all field later to be a column
class BoostFields {
  static final List<String> values = [
    id,
    name,
    age,
  ];
  static String id = '_id';
  static String name = 'name';
  static String age = 'age';
}
