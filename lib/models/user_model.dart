class UserModel {
  //field

  String id, name, user, password, avatar;

  //method
  //--> contractor
  UserModel(this.id, this.name, this.user, this.password, this.avatar);

  UserModel.fromJson(Map<String, dynamic> map) {
    id = map['id'];
    name = map['Name'];
    user = map['User'];
    password = map['Password'];
    avatar = map['Avatar'];
  }
}
