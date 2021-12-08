
class Users{
  String id="";
  String name="";
  String email="";
  String phone="";
  Users({required this.id,required this.name,required this.email,required this.phone});

  // add data to api

  // Users.fromSnapShot(DataSnapshot dataSnapshot){
  //   id=dataSnapshot.key;
  //   name=dataSnapshot.value["name"];
  //   email=dataSnapshot.value["email"];
  //   phone=dataSnapshot.value["phone"];
  // }

}