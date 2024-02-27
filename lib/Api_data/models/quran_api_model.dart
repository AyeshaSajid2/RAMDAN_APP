// To parse this JSON data, do
//
//     final quran = quranFromMap(jsonString);

import 'dart:convert';

Quran quranFromMap(String str) => Quran.fromMap(json.decode(str));

String quranToMap(Quran data) => json.encode(data.toMap());

class Quran {
  int code;
  String status;
  Data data;

  Quran({
    required this.code,
    required this.status,
    required this.data,
  });

  factory Quran.fromMap(Map<String, dynamic> json) => Quran(
    code: json["code"],
    status: json["status"],
    data: Data.fromMap(json["data"]),
  );

  Map<String, dynamic> toMap() => {
    "code": code,
    "status": status,
    "data": data.toMap(),
  };
}

class Data {
  List<Surah> surahs;
  Edition edition;

  Data({
    required this.surahs,
    required this.edition,
  });

  factory Data.fromMap(Map<String, dynamic> json) => Data(
    surahs: List<Surah>.from(json["surahs"].map((x) => Surah.fromMap(x))),
    edition: Edition.fromMap(json["edition"]),
  );

  Map<String, dynamic> toMap() => {
    "surahs": List<dynamic>.from(surahs.map((x) => x.toMap())),
    "edition": edition.toMap(),
  };
}

class Edition {
  String identifier;
  String language;
  String name;
  String englishName;
  String format;
  String type;

  Edition({
    required this.identifier,
    required this.language,
    required this.name,
    required this.englishName,
    required this.format,
    required this.type,
  });

  factory Edition.fromMap(Map<String, dynamic> json) => Edition(
    identifier: json["identifier"],
    language: json["language"],
    name: json["name"],
    englishName: json["englishName"],
    format: json["format"],
    type: json["type"],
  );

  Map<String, dynamic> toMap() => {
    "identifier": identifier,
    "language": language,
    "name": name,
    "englishName": englishName,
    "format": format,
    "type": type,
  };
}

class Surah {
  int number;
  String name;
  String englishName;
  String englishNameTranslation;
  String revelationType;
  List<Ayah> ayahs;

  Surah({
    required this.number,
    required this.name,
    required this.englishName,
    required this.englishNameTranslation,
    required this.revelationType,
    required this.ayahs,
  });

  factory Surah.fromMap(Map<String, dynamic> json) => Surah(
    number: json["number"],
    name: json["name"],
    englishName: json["englishName"],
    englishNameTranslation: json["englishNameTranslation"],
    revelationType: json["revelationType"],
    ayahs: List<Ayah>.from(json["ayahs"].map((x) => Ayah.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "number": number,
    "name": name,
    "englishName": englishName,
    "englishNameTranslation": englishNameTranslation,
    "revelationType": revelationType,
    "ayahs": List<dynamic>.from(ayahs.map((x) => x.toMap())),
  };
}

class Ayah {
  int number;
  String text;
  int numberInSurah;
  int juz;
  int manzil;
  int page;
  int ruku;
  int hizbQuarter;
  dynamic sajda;

  // bool isChecked;

  Ayah({
    required this.number,
    required this.text,
    required this.numberInSurah,
    required this.juz,
    required this.manzil,
    required this.page,
    required this.ruku,
    required this.hizbQuarter,
    required this.sajda,
  });

  factory Ayah.fromMap(Map<String, dynamic> json) => Ayah(
    number: json["number"],
    text: json["text"],
    numberInSurah: json["numberInSurah"],
    juz: json["juz"],
    manzil: json["manzil"],
    page: json["page"],
    ruku: json["ruku"],
    hizbQuarter: json["hizbQuarter"],
    sajda: json["sajda"],
  );

  Map<String, dynamic> toMap() => {
    "number": number,
    "text": text,
    "numberInSurah": numberInSurah,
    "juz": juz,
    "manzil": manzil,
    "page": page,
    "ruku": ruku,
    "hizbQuarter": hizbQuarter,
    "sajda": sajda,
  };
}

class SajdaClass {
  int id;
  bool recommended;
  bool obligatory;

  SajdaClass({
    required this.id,
    required this.recommended,
    required this.obligatory,
  });

  factory SajdaClass.fromMap(Map<String, dynamic> json) => SajdaClass(
    id: json["id"],
    recommended: json["recommended"],
    obligatory: json["obligatory"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "recommended": recommended,
    "obligatory": obligatory,
  };
}
