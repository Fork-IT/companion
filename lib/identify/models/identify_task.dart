class IdentifyTask {
  int? id;
  String? name;
  String? relation;
  String? photo;

  IdentifyTask({
    this.id,
    this.name,
    this.relation,
    this.photo,
});

  IdentifyTask.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    relation = json['relation'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['relation'] = this.relation;
    data['photo'] = this.photo;
    return data;
  }
}