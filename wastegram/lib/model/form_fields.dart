class FormFields {
  String image;
  String longitude;
  String latitude;
  int total;

  FormFields({this.image, this.longitude, this.latitude, this.total});

  int get wasteTotal{
    return total;
  }
}