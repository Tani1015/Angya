//get MIME TYPE(.jpg => image/jpeg // .png => image/png // more...) and subtype

enum MimeType { applicationOctetStream }

extension MimeTypeExtension on MimeType{
  String? get value {
    if(this == MimeType.applicationOctetStream) {
      return 'application/octet-stream';
    }
    throw AssertionError();
  }
}