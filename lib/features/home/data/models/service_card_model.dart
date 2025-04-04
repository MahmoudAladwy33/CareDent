class ServiceCardModel {
  final String image;
  final String title1;
  final String title2;
  final String appointmentImage;
  final String appointmentTitle;
  final String appointmentSubtitle;
  final String appointmentBody;

  const ServiceCardModel({
    required this.appointmentImage,
    required this.appointmentTitle,
    required this.appointmentSubtitle,
    required this.image,
    required this.title1,
    required this.title2,
    required this.appointmentBody,
  });
}
