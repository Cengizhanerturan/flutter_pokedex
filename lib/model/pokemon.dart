
class Pokemon {
  List<Pokemon1>? pokemon;

  Pokemon({this.pokemon});

  Pokemon.fromJson(Map<String, dynamic> json) {
    if(json["pokemon"] is List)
      this.pokemon = json["pokemon"]==null ? null : (json["pokemon"] as List).map((e)=>Pokemon1.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if(this.pokemon != null)
      data["pokemon"] = this.pokemon!.map((e)=>e.toJson()).toList();
    return data;
  }
}

class Pokemon1 {
  int? id;
  String? num;
  String? name;
  String? img;
  List<String>? type;
  String? height;
  String? weight;
  String? candy;
  int? candyCount;
  String? egg;
  double? spawnChance;
  double? avgSpawns;
  String? spawnTime;
  List<double>? multipliers;
  List<String>? weaknesses;
  List<PrevEvolution>? prevEvolution;
  List<NextEvolution>? nextEvolution;

  Pokemon1({this.id, this.num, this.name, this.img, this.type, this.height, this.weight, this.candy, this.candyCount, this.egg, this.spawnChance, this.avgSpawns, this.spawnTime, this.multipliers, this.weaknesses, this.prevEvolution, this.nextEvolution});

  Pokemon1.fromJson(Map<String, dynamic> json) {
    if(json["id"] is int)
      this.id = json["id"];
    if(json["num"] is String)
      this.num = json["num"];
    if(json["name"] is String)
      this.name = json["name"];
    if(json["img"] is String)
      this.img = json["img"];
    if(json["type"] is List)
      this.type = json["type"]==null ? null : List<String>.from(json["type"]);
    if(json["height"] is String)
      this.height = json["height"];
    if(json["weight"] is String)
      this.weight = json["weight"];
    if(json["candy"] is String)
      this.candy = json["candy"];
    if(json["candy_count"] is int)
      this.candyCount = json["candy_count"];
    if(json["egg"] is String)
      this.egg = json["egg"];
    if(json["spawn_chance"] is double)
      this.spawnChance = json["spawn_chance"];
    if(json["avg_spawns"] is double)
      this.avgSpawns = json["avg_spawns"];
    if(json["spawn_time"] is String)
      this.spawnTime = json["spawn_time"];
    if(json["multipliers"] is List)
      this.multipliers = json["multipliers"]==null ? null : List<double>.from(json["multipliers"]);
    if(json["weaknesses"] is List)
      this.weaknesses = json["weaknesses"]==null ? null : List<String>.from(json["weaknesses"]);
    if(json["prev_evolution"] is List)
      this.prevEvolution = json["prev_evolution"]==null ? null : (json["prev_evolution"] as List).map((e)=>PrevEvolution.fromJson(e)).toList();
    if(json["next_evolution"] is List)
      this.nextEvolution = json["next_evolution"]==null ? null : (json["next_evolution"] as List).map((e)=>NextEvolution.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["num"] = this.num;
    data["name"] = this.name;
    data["img"] = this.img;
    if(this.type != null)
      data["type"] = this.type;
    data["height"] = this.height;
    data["weight"] = this.weight;
    data["candy"] = this.candy;
    data["candy_count"] = this.candyCount;
    data["egg"] = this.egg;
    data["spawn_chance"] = this.spawnChance;
    data["avg_spawns"] = this.avgSpawns;
    data["spawn_time"] = this.spawnTime;
    if(this.multipliers != null)
      data["multipliers"] = this.multipliers;
    if(this.weaknesses != null)
      data["weaknesses"] = this.weaknesses;
    if(this.prevEvolution != null)
      data["prev_evolution"] = this.prevEvolution!.map((e)=>e.toJson()).toList();
    if(this.nextEvolution != null)
      data["next_evolution"] = this.nextEvolution!.map((e)=>e.toJson()).toList();
    return data;
  }
}

class NextEvolution {
  String? num;
  String? name;

  NextEvolution({this.num, this.name});

  NextEvolution.fromJson(Map<String, dynamic> json) {
    if(json["num"] is String)
      this.num = json["num"];
    if(json["name"] is String)
      this.name = json["name"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["num"] = this.num;
    data["name"] = this.name;
    return data;
  }
}

class PrevEvolution {
  String? num;
  String? name;

  PrevEvolution({this.num, this.name});

  PrevEvolution.fromJson(Map<String, dynamic> json) {
    if(json["num"] is String)
      this.num = json["num"];
    if(json["name"] is String)
      this.name = json["name"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["num"] = this.num;
    data["name"] = this.name;
    return data;
  }
}