import 'package:image_picker/image_picker.dart';

class RegisterUserModel {
  String? mobilnyiTelefon;
  String? fio;
  String? pol;
  String? inn;
  String? dataRozdeniya;
  String? tipDokumenta;
  String? nomerPasporta;
  String? dataVydaciPasporta;
  String? organVydaciPasporta;
  String? strana;
  String? oblast;
  String? gorod;
  String? raion;
  String? ulica;
  String? dom;
  String? kvartira;
  String? email;
  String? semeinoePolozenie;
  XFile? passportFront;
  XFile? passportBack;
  XFile? passportSelfie;

  RegisterUserModel({
    this.mobilnyiTelefon,
    this.fio,
    this.pol,
    this.inn,
    this.dataRozdeniya,
    this.tipDokumenta,
    this.nomerPasporta,
    this.dataVydaciPasporta,
    this.organVydaciPasporta,
    this.strana,
    this.oblast,
    this.gorod,
    this.raion,
    this.ulica,
    this.dom,
    this.kvartira,
    this.email,
    this.semeinoePolozenie,
    this.passportFront,
    this.passportBack,
    this.passportSelfie,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['mobilnyi_telefon'] = mobilnyiTelefon;
    data['fio'] = fio;
    data['pol'] = this.pol;
    data['inn'] = this.inn;
    data['data_rozdeniya'] = this.dataRozdeniya;
    data['tip_dokumenta'] = this.tipDokumenta;
    data['nomer_pasporta'] = this.nomerPasporta;
    data['data_vydaci_pasporta'] = this.dataVydaciPasporta;
    data['organ_vydaci_pasporta'] = this.organVydaciPasporta;
    data['strana'] = this.strana;
    data['oblast'] = this.oblast;
    data['gorod'] = this.gorod;
    data['raion'] = this.raion;
    data['ulica'] = this.ulica;
    data['dom'] = this.dom;
    data['kvartira'] = this.kvartira;
    data['email'] = this.email;
    data['semeinoe_polozenie'] = this.semeinoePolozenie;
    return data;
  }
}
