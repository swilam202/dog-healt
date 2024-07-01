class FindDisease {
  int? id;
  String? age;
  List<Diseases>? diseases;
  List<Vaccinations>? vaccinations;

  FindDisease({this.id, this.age, this.diseases, this.vaccinations});

  FindDisease.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    age = json['age'];
    if (json['diseases'] != null) {
      diseases = <Diseases>[];
      json['diseases'].forEach((v) {
        diseases!.add(Diseases.fromJson(v));
      });
    }
    if (json['vaccinations'] != null) {
      vaccinations = <Vaccinations>[];
      json['vaccinations'].forEach((v) {
        vaccinations!.add(Vaccinations.fromJson(v));
      });
    }
  }
}

class Diseases {
  int? id;
  String? name;
  String? description;
  List<Causes>? causes;

  Diseases({this.id, this.name, this.description, this.causes});

  Diseases.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    if (json['causes'] != null) {
      causes = <Causes>[];
      json['causes'].forEach((v) {
        causes!.add(Causes.fromJson(v));
      });
    }
  }
}

class Causes {
  int? id;
  String? description;

  Causes({this.id, this.description});

  Causes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
  }
}

class Vaccinations {
  int? id;
  String? age;
  String? vac;

  Vaccinations({this.id, this.age, this.vac});

  Vaccinations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    age = json['age'];
    vac = json['vac'];
  }
}
