class BookResponse {
  int? totalItems;
  List<Book>? items;

  BookResponse({this.totalItems, this.items});

  factory BookResponse.fromJson(Map<String, dynamic> jsonData) {
    var bookResponseStr = BookResponse();
    bookResponseStr.totalItems = jsonData['totalItems'] as int;
    bookResponseStr.items = [];
    for (var bookJson in (jsonData['items'] as List<dynamic>)) {
      var bookMap = bookJson as Map<String, dynamic>;
      bookResponseStr.items?.add(Book.fromJson(bookMap));
    }
    return bookResponseStr;
  }
}

class Book {
  String? id;
  VolumeInfo? volumeInfo;

  Book({this.id, this.volumeInfo});

  factory Book.fromJson(Map<String, dynamic> jsonData) {
    var bookResponseStr = Book();
    bookResponseStr.id = jsonData['id'];
    bookResponseStr.volumeInfo = VolumeInfo.fromJson(jsonData['volumeInfo']);
    return bookResponseStr;
  }
}

class VolumeInfo {
  String? title;
  List<String>? authors;
  ImageLinks? imageLinks;

  VolumeInfo({this.title, this.authors, this.imageLinks});

  factory VolumeInfo.fromJson(Map<String, dynamic> jsonData) {
    var volumeInfoParsed = VolumeInfo();
    volumeInfoParsed.title = jsonData['title'];
    volumeInfoParsed.authors = [];
    for (var authorStr in jsonData['authors']) {
      volumeInfoParsed.authors?.add(authorStr);
    }
    volumeInfoParsed.imageLinks = ImageLinks.fromJson(jsonData['imageLinks']);
    return volumeInfoParsed;
  }
}

class ImageLinks {
  String? thumbnail;

  ImageLinks({this.thumbnail});

  factory ImageLinks.fromJson(Map<String, dynamic> jsonData) {
    var imageLinks = ImageLinks();
    imageLinks.thumbnail = jsonData['thumbnail'];
    return imageLinks;
  }
}
