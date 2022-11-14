import 'package:json_annotation/json_annotation.dart';
part 'search_images.g.dart';

@JsonSerializable()
class SearchImages {
  SearchImages(this.width, this.height, this.thumbnail_url, this.image_url,
      this.display_sitename, this.doc_url, this.collection, this.datetime);

  int width;
  int height;
  String thumbnail_url;
  String image_url;
  String display_sitename;
  String doc_url;
  String collection;
  DateTime datetime;

  factory SearchImages.fromJson(Map<String, dynamic> json) =>
      _$SearchImagesFromJson(json);

  Map<String, dynamic> toJson() => _$SearchImagesToJson(this);
}
