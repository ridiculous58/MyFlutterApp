class User{
  String firstName;
  String lastName;
  String email;
  String phoneNumber;

  User();
  User.all(this.firstName,this.lastName,this.email,this.phoneNumber);

  User.fromJson(Map json){
    email =  json["email"];
    firstName = json["firstName"];
    lastName = json["lastName"];
    email = json["email"];
    phoneNumber = json["phoneNumber"];
  }
  Map toJson(){
    return {
      "email":email,
      "firstName":firstName,
      "lastName":lastName,
      "phoneNumber":phoneNumber,
    };
  }
}