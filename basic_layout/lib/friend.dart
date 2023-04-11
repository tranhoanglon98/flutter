class Friend {
  String name;
  String avatarImgPath;
  bool status;

  Friend(this.name, this.avatarImgPath, this.status);

  static Friend fromJson(Map<String, dynamic> data) {
    return Friend(data['name'], data['avatar'], data['status']);
  }
}
