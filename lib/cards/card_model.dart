import 'package:yanni_store/utils/images.dart';

class CardData {
  CardData({required this.title, this.image, required this.routeName});
  final String title;
  final image;
  final String routeName;
}

List<CardData> data = [
  CardData(
      title: "Acoustic guitar",
      image: acoustic_guitar_image,
      routeName: "/one"),
  CardData(
      title: "Classic guitar", image: classic_guitar_image, routeName: "/two"),
  CardData(
      title: "Electric guitar", image: elect_guiter_image, routeName: "/three"),
  CardData(title: "Drums", image: drums_image, routeName: "/four"),
  CardData(title: "Banjo", image: banjo_image, routeName: "/fife"),
  CardData(title: "Cello", image: cello_image, routeName: "/six"),
  CardData(title: "Clarinet", image: clarinet_image, routeName: "/seven"),
  CardData(title: "Violin", image: violin_image, routeName: "/eight"),
  CardData(title: "Harmonica", image: harmonica_image, routeName: "/nine"),
  CardData(title: "Milodica", image: milodica_image, routeName: "/ten"),
  CardData(title: "Oud", image: oud_image, routeName: "/eleven"),
  CardData(title: "Saxophone", image: saxphone_image, routeName: "/twelve"),
  CardData(title: "Organ", image: org_image, routeName: "/treeteen"),
  CardData(title: "Tambourine", image: tambourines_image, routeName: "/fourteen"),
  CardData(title: "Trumpet", image: trumbate_image, routeName: "/fifteen"),
];
