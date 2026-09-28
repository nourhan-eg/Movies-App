class Migration {
  Migration({
      this.message, 
      this.oldBase, 
      this.newBase, 
      this.sunset,});

  Migration.fromJson(dynamic json) {
    message = json['message'];
    oldBase = json['old_base'];
    newBase = json['new_base'];
    sunset = json['sunset'];
  }
  String? message;
  String? oldBase;
  String? newBase;
  String? sunset;

}