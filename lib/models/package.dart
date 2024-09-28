class Package {
  final int id;
  final String name;
  final String shortDescr;
  final String? documentationLink;
  final String pubDevLink;
  final String route;

  Package(
      {required this.id,
      required this.name,
      required this.shortDescr,
      this.documentationLink,
      required this.pubDevLink,
      required this.route});
}
