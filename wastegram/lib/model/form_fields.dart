class FormFields {
  String date;
  String image;
  int total;
  String longitude;
  String latitude;

  FormFields({this.date, this.image, this.total, this.longitude, this.latitude});

  int get wasteTotal{
    return total;
  }
}