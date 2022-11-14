// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_images.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchImages _$SearchImagesFromJson(Map<String, dynamic> json) => SearchImages(
      json['width'] as int,
      json['height'] as int,
      json['thumbnail_url'] as String,
      json['image_url'] as String,
      json['display_sitename'] as String,
      json['doc_url'] as String,
      json['collection'] as String,
      DateTime.parse(json['datetime'] as String),
    );

Map<String, dynamic> _$SearchImagesToJson(SearchImages instance) =>
    <String, dynamic>{
      'width': instance.width,
      'height': instance.height,
      'thumbnail_url': instance.thumbnail_url,
      'image_url': instance.image_url,
      'display_sitename': instance.display_sitename,
      'doc_url': instance.doc_url,
      'collection': instance.collection,
      'datetime': instance.datetime.toIso8601String(),
    };
