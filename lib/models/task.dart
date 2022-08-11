class Task {
  int? id;
  String? name;
  String? relation;
  int? number;

  Task({
    this.id,
    this.name,
    this.relation,
    this.number,
});

  Task.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    relation = json['relation'];
    number = json['number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['relation'] = this.relation;
    data['number'] = this.number;
    return data;
  }
}