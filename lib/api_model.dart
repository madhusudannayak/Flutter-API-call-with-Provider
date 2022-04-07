class ApiModel {
  List<Superheros>? superheros;

  ApiModel({this.superheros});

  ApiModel.fromJson(Map<String, dynamic> json) {
    if (json['superheros'] != null) {
      superheros = <Superheros>[];
      json['superheros'].forEach((v) {
        superheros!.add(Superheros.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (superheros != null) {
      data['superheros'] = superheros!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Superheros {
  String? name;
  String? power;
  String? url;

  Superheros({this.name, this.power, this.url});

  Superheros.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    power = json['power'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = name;
    data['power'] = power;
    data['url'] = url;
    return data;
  }
}