import 'package:flutter/widgets.dart';

class GalleryExampleItem {
  GalleryExampleItem({this.id, this.resource});

  final String id;
  final String resource;

}

List<GalleryExampleItem> galleryItems = <GalleryExampleItem>[
  GalleryExampleItem(
    id: "tag1",
    resource: "https://i.pravatar.cc/800",
  ),
  GalleryExampleItem(
    id: "tag2",
    resource: "https://i.pravatar.cc/600",
  ),
  GalleryExampleItem(
    id: "tag3",
    resource: "https://i.pravatar.cc/500",
  ),
  GalleryExampleItem(
    id: "tag4",
    resource: "https://i.pravatar.cc/400",
  ),
  GalleryExampleItem(
    id: "tag5",
    resource: "https://i.pravatar.cc/800",
  ),
  GalleryExampleItem(
    id: "tag6",
    resource: "https://i.pravatar.cc/600",
  ),
  GalleryExampleItem(
    id: "tag7",
    resource: "https://i.pravatar.cc/500",
  ),
  GalleryExampleItem(
    id: "tag8",
    resource: "https://i.pravatar.cc/400",
  ),

];