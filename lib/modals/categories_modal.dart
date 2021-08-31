
class CategoriesModals {

  static const NAME = 'name';
  static const IMAGE = 'imageUrl';

  late List? image;
  late List? name;

  CategoriesModals({this.name,this.image});

  CategoriesModals.fromMap(Map<String, dynamic> data){
    image = data[NAME];
    name = data[IMAGE];
  }
}