class Aladeia {
  final String id;
  final List<String> categories;

  ///لربط كل صنف بالقائمة بتاعة
  final String title;

  ///اسم لكل دعاء
  final String imageUrl;

  ///استخدام صورة
  final String textAladua; ////لكل دعاء لست من الاسطر

  final int duration;

  ///عدد المرات الواجب قرائتها

  const Aladeia({
    required this.id,
    required this.categories,
    required this.title,
    required this.imageUrl,
    required this.textAladua,
    required this.duration,
  });

  Map<String, dynamic> toMap() => {
        "id": id,
        "categories": categories,
        "title": title,
        "imageUrl": imageUrl,
        "textAladua": textAladua,
        "duration": duration,
      };

  factory Aladeia.fromMap(Map<String, dynamic> json) => new Aladeia(
        id: json["id"],
        categories: json["categories"],
        title: json["title"],
        imageUrl: json["imageUrl"],
        textAladua: json["textAladua"],
        duration: json["duration"],
      );
}
